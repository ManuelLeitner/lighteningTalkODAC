//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class MachineProperty
    {
        public long ID { get; set; }
        public string Value { get; set; }
    
        public virtual Property Property { get; set; }
        public virtual MachineOrder MachineOrder { get; set; }
    }
}
