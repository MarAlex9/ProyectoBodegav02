//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoBodegav02.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Pedido_Producto
    {
        public int idPedido_Producto { get; set; }
        public int fk_Pedido_idPedido { get; set; }
        public int fk_Producto_idProducto { get; set; }
        public Nullable<int> Cantidad { get; set; }
    
        public virtual Pedido Pedido { get; set; }
        public virtual Producto Producto { get; set; }
    }
}
