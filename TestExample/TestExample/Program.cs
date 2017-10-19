using EF;
using System;
using System.Linq;

namespace TestExample {
    class Program {
        static void Main(string[] args) {
            OracleData data = new OracleData();

            var todos = data.Orders.Where((o) => !o.Done);

            Console.WriteLine($"insgesamt {todos.Count()} offene Aufträge");
            Console.WriteLine($"mit {todos.Sum((o) => o.MachineOrders.Count)} Maschinen");

            Order actualOrder = todos.First();

            var startTime = DateTime.Now - new TimeSpan(1, 23, 3);
            actualOrder.Time.Add(new Time(startTime, DateTime.Now, data.GetCurrentUser()));
            data.SaveChanges();
            Console.WriteLine("Zeit wurde verbucht");


            Console.WriteLine("Enter drücken zum Beenden ...");
            Console.ReadLine();
        }
    }
}