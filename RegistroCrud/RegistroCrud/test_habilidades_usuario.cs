//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RegistroCrud
{
    using System;
    using System.Collections.Generic;
    
    public partial class test_habilidades_usuario
    {
        public string habilidades_usuario_usuCed { get; set; }
        public string habilidades_usuario_habId { get; set; }
        public string habilidades_usuario_activo { get; set; }
    
        public virtual test_habilidades test_habilidades { get; set; }
        public virtual test_usuario test_usuario { get; set; }
    }
}
