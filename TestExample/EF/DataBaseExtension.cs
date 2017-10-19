using PropertyChanged;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Common;
using System.Data.Entity;
using System.Data.Entity.Core.EntityClient;
using System.Linq;

namespace EF {

    public partial class OracleData {
        static Dictionary<string, OracleData> cons = new Dictionary<string, OracleData>();
        public OracleData(string db)
            : base(db) {
        }

        public static OracleData FromName(string db) {
            return new OracleData("name=" + db);
        }
        public static OracleData FromConnectionString(string constr) {
            if (!cons.ContainsKey(constr)) {
                EntityConnectionStringBuilder b = new EntityConnectionStringBuilder();
                b.Metadata = "res://*/Model.csdl|res://*/Model.ssdl|res://*/Model.msl";
                b.Provider = "Oracle.ManagedDataAccess.Client";
                b.ProviderConnectionString = constr;
                cons[constr] = new OracleData(b.ConnectionString);
            }
            return cons[constr];
        }

        public event RefreshEventHandler Refreshed;

        public void Reload() {
            Orders.Load();
            Machines.Load();
            Tasks.Load();
            Customers.Load();
            Properties.Load();
            Rules.Load();

            Refreshed?.Invoke(new RefreshEventArgs(this));
        }

        public override int SaveChanges() {
            foreach (var v in ChangeTracker.Entries()) {
                if (v.State == EntityState.Added) {
                    dynamic entity = v.Entity;
                    DbCommand command = Database.Connection.CreateCommand();
                    command.CommandText = "select IDS.nextval from dual";
                    if (command.Connection.State != System.Data.ConnectionState.Open)
                        command.Connection.Open();
                    entity.ID = long.Parse(command.ExecuteScalar().ToString());
                }
            }
            int res = base.SaveChanges();
            Reload();
            return res;
        }


        public User GetCurrentUser() {

            string name = Environment.UserName;
            string surname = " ";
            if (name.Contains(' ')) {
                surname = name.Split(' ')[1];
            }

            string lastname = name.Split(' ')[0];
            string abbr = (surname[0] + "" + lastname[0]).ToLower();

            var user = Users
                   .Where(n => n.UserName == abbr)
                   .FirstOrDefault();

            if (user != null) {
                return user;
            }

            user = new User();
            user.FirstName = surname;
            user.SecondName = lastname;
            user.UserName = abbr;

            Users.Add(user);
            return user;
        }
    }

    public partial class Property {
        public static bool operator ==(Property p1, Property p2) {
            if ((object)p1 == null ^ (object)p2 == null)
                return false;
            if ((object)p1 == null && (object)p2 == null)
                return true;
            return p1.ID == p2.ID;
        }

        public static bool operator !=(Property p1, Property p2) {
            return !(p1 == p2);
        }
        public override bool Equals(object obj) {
            return base.Equals(obj);
        }
        public override int GetHashCode() {
            return base.GetHashCode();
        }
    }
    public partial class Task : IComparable<Task> {
        public static bool operator ==(Task t1, Task t2) {
            if ((object)t1 == null ^ (object)t2 == null)
                return false;
            if ((object)t1 == null && (object)t2 == null)
                return true;
            return t1.ID == t2.ID;
        }
        public static bool operator !=(Task t1, Task t2) {
            return !(t1 == t2);
        }
        public override bool Equals(object obj) {
            if (obj is Task)
                return this == (Task)obj;
            return false;
        }
        public int CompareTo(Task other) {
            return ID.CompareTo(other.ID);
        }
        public override int GetHashCode() {
            return base.GetHashCode();
        }
    }

    public partial class Machine : IComparable<Machine> {

        public bool Checked { get; set; }

        public override string ToString() {
            return FabricationNumber + " " + Type;
        }
        public virtual string DetailedToString() {
            return FabricationNumber + " " + Type;
        }

        public virtual int CompareTo(Machine other) {
            if (FabricationNumber != other.FabricationNumber)
                return FabricationNumber.CompareTo(other.FabricationNumber);
            return SD.CompareTo(other.SD);
        }

        public static bool operator <(Machine m1, Machine m2) {
            if (m1.FabricationNumber != m2.FabricationNumber)
                return m1.FabricationNumber < m2.FabricationNumber;
            else
                return m1.SD.CompareTo(m2.SD) < 0;
        }
        public static bool operator >(Machine m1, Machine m2) {
            if (m1.FabricationNumber != m2.FabricationNumber)
                return m1.FabricationNumber > m2.FabricationNumber;
            else
                return m1.SD.CompareTo(m2.SD) > 0;
        }

        public static bool operator ==(Machine m1, Machine m2) {
            if ((object)m1 == null ^ (object)m2 == null)
                return false;
            if ((object)m1 == null && (object)m2 == null)
                return true;
            return m1.FabricationNumber == m2.FabricationNumber && m1.SD == m2.SD;
        }
        public static bool operator !=(Machine m1, Machine m2) {
            if ((object)m1 == null ^ (object)m2 == null)
                return true;
            if ((object)m1 == null && (object)m2 == null)
                return false;
            return m1.FabricationNumber != m2.FabricationNumber || m1.SD != m2.SD;
        }

        public override bool Equals(object obj) {
            if (obj is Machine)
                return this == (Machine)obj;
            return false;
        }
        public override int GetHashCode() {
            return base.GetHashCode();
        }
    }


    public partial class Customer : IComparable<Customer> {
        public Customer(string name) : base() {
            Name = name;
        }
        public Customer(long customerNr, string name) {
            CustomerNr = customerNr;
            Name = name;
        }

        public override bool Equals(object obj) {
            if (obj is Customer)
                return this == (Customer)obj;
            return false;
        }
        public static bool operator >(Customer c1, Customer c2) {
            return c1.CustomerNr > c2.CustomerNr;
        }
        public static bool operator <(Customer c1, Customer c2) {
            return c1.CustomerNr < c2.CustomerNr;
        }
        public static bool operator ==(Customer c1, Customer c2) {
            if ((object)c1 == null ^ (object)c2 == null)
                return false;
            if ((object)c1 == null && (object)c2 == null)
                return true;
            return c1.CustomerNr == c2.CustomerNr && c1.Name == c2.Name;
        }
        public static bool operator !=(Customer c1, Customer c2) {
            if ((object)c1 == null ^ (object)c2 == null)
                return true;
            if ((object)c1 == null && (object)c2 == null)
                return false;
            return c1.CustomerNr != c2.CustomerNr || c1.Name != c2.Name;
        }

        public override string ToString() {
            return $"{Name} ({CustomerNr})";
        }

        public int CompareTo(Customer c) {
            return CustomerNr.CompareTo(c.CustomerNr);
        }

        public override int GetHashCode() {
            return (int)CustomerNr;
        }
    }

    public partial class Order {

        public override string ToString() {
            return string.Join(" ", new object[] { Number, Name, Deadline, Customer });
        }
    }

    public partial class Opt : IComparable<Opt> {
        public Opt(long number) {
            Number = number;
        }
        public override bool Equals(object obj) {
            if (obj is Opt)
                return this == (Opt)obj;
            return false;
        }
        public static bool operator >(Opt o1, Opt o2) {
            return o1.ID > o2.ID;
        }
        public static bool operator <(Opt c1, Opt c2) {
            return c1.ID < c2.ID;
        }
        public static bool operator ==(Opt c1, Opt c2) {
            if ((object)c1 == null ^ (object)c2 == null)
                return false;
            if ((object)c1 == null && (object)c2 == null)
                return true;
            return c1.ID == c2.ID;
        }
        public static bool operator !=(Opt c1, Opt c2) {
            if ((object)c1 == null ^ (object)c2 == null)
                return true;
            if ((object)c1 == null && (object)c2 == null)
                return false;
            return c1.ID != c2.ID;
        }

        public override int GetHashCode() {
            return ID.GetHashCode();
        }

        public override string ToString() {
            return $"{ID} ({Blockname}, {SwitchCondition})";
        }

        public virtual int CompareTo(Opt c) {
            return ID.CompareTo(c.ID);
        }
    }
    public partial class Time {
        public Time() {

        }

        public override string ToString() {
            return "Von " + this.StartTime + " bis " + this.EndTime + " Stunden: " + this.Hours + " Auftragsname: " + this.Order.Name;
        }

    }

    public partial class User {
        public override string ToString() {
            return $"{FirstName} {SecondName}".Trim();
        }
    }

    [AddINotifyPropertyChangedInterface]
    public partial class Operation {
    }

    public partial class Time {
        public Time(DateTime startTime, DateTime endTime, User user) {
            StartTime = startTime;
            EndTime = endTime;
            Hours = (endTime - startTime).Hours;
            User = user;
        }
    }
}