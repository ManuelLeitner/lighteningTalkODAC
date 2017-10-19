using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EF
{
    public partial class Condition
    {
        public Condition()
        {
            Type = "C";
        }

    }

    public partial class UnaryOperation
    {
        public UnaryOperation()
        {
            Type = "U";
        }

    }

    public partial class BinaryOperation
    {
        public BinaryOperation()
        {
            Type = "B";
        }

    }

}
