//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MvcApplication1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Colors
    {
        public Colors()
        {
            this.Gowns = new HashSet<Gowns>();
        }
    
        public int id_color { get; set; }
        public string color { get; set; }
    
        public virtual ICollection<Gowns> Gowns { get; set; }
    }
}
