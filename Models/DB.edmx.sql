
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/24/2020 13:04:43
-- Generated from EDMX file: C:\Users\Alan\Desktop\Alan\ProyectoBodegav02\Models\DB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [dbBodega];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Categoria'
CREATE TABLE [dbo].[Categoria] (
    [idCategoria] int IDENTITY(1,1) NOT NULL,
    [nombre_Cat] varchar(45)  NULL,
    [descripcion_Cat] varchar(45)  NULL
);
GO

-- Creating table 'Empleado'
CREATE TABLE [dbo].[Empleado] (
    [idEmpleado] int IDENTITY(1,1) NOT NULL,
    [cargo_Empleado] varchar(45)  NULL,
    [contraseña] varchar(45)  NULL,
    [fk_idPersona] int  NULL
);
GO

-- Creating table 'Inventario'
CREATE TABLE [dbo].[Inventario] (
    [idInventario] int IDENTITY(1,1) NOT NULL,
    [Fecha_Ingreso] datetime  NULL,
    [Cantidad] int  NULL,
    [fk_idProducto] int  NOT NULL
);
GO

-- Creating table 'Pedido'
CREATE TABLE [dbo].[Pedido] (
    [idPedido] int IDENTITY(1,1) NOT NULL,
    [fecha_Pedido] datetime  NULL,
    [descripcion_Pedido] varchar(45)  NULL,
    [confirmacion_Pedido] bit  NULL,
    [fk_idEmpleado] int  NULL
);
GO

-- Creating table 'Pedido_Producto'
CREATE TABLE [dbo].[Pedido_Producto] (
    [idPedido_Producto] int IDENTITY(1,1) NOT NULL,
    [fk_Pedido_idPedido] int  NOT NULL,
    [fk_Producto_idProducto] int  NOT NULL,
    [Cantidad] int  NULL
);
GO

-- Creating table 'Producto'
CREATE TABLE [dbo].[Producto] (
    [idProducto] int IDENTITY(1,1) NOT NULL,
    [nom_Producto] varchar(45)  NULL,
    [marca_Producto] varchar(45)  NULL,
    [precio_Producto] decimal(18,0)  NULL,
    [fk_idProveedor] int  NULL,
    [fk_idCategoria] int  NULL
);
GO

-- Creating table 'Proveedor'
CREATE TABLE [dbo].[Proveedor] (
    [idProveedor] int IDENTITY(1,1) NOT NULL,
    [nombre_Prove] varchar(45)  NULL,
    [telefono_Prove] varchar(45)  NULL,
    [direccion_Prove] varchar(45)  NULL,
    [NIF_Prove] varchar(50)  NULL,
    [correo_Prove] varbinary(70)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Usuario'
CREATE TABLE [dbo].[Usuario] (
    [idPersona] int IDENTITY(1,1) NOT NULL,
    [nombre_Usuario] varchar(45)  NULL,
    [apellido_Usuario] varchar(45)  NULL,
    [direccion_Usuario] varchar(45)  NULL,
    [cedula_Usuario] varchar(45)  NULL,
    [correro_Usuario] varchar(50)  NULL,
    [genero_Usuario] varchar(10)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [idCategoria] in table 'Categoria'
ALTER TABLE [dbo].[Categoria]
ADD CONSTRAINT [PK_Categoria]
    PRIMARY KEY CLUSTERED ([idCategoria] ASC);
GO

-- Creating primary key on [idEmpleado] in table 'Empleado'
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT [PK_Empleado]
    PRIMARY KEY CLUSTERED ([idEmpleado] ASC);
GO

-- Creating primary key on [idInventario] in table 'Inventario'
ALTER TABLE [dbo].[Inventario]
ADD CONSTRAINT [PK_Inventario]
    PRIMARY KEY CLUSTERED ([idInventario] ASC);
GO

-- Creating primary key on [idPedido] in table 'Pedido'
ALTER TABLE [dbo].[Pedido]
ADD CONSTRAINT [PK_Pedido]
    PRIMARY KEY CLUSTERED ([idPedido] ASC);
GO

-- Creating primary key on [idPedido_Producto] in table 'Pedido_Producto'
ALTER TABLE [dbo].[Pedido_Producto]
ADD CONSTRAINT [PK_Pedido_Producto]
    PRIMARY KEY CLUSTERED ([idPedido_Producto] ASC);
GO

-- Creating primary key on [idProducto] in table 'Producto'
ALTER TABLE [dbo].[Producto]
ADD CONSTRAINT [PK_Producto]
    PRIMARY KEY CLUSTERED ([idProducto] ASC);
GO

-- Creating primary key on [idProveedor] in table 'Proveedor'
ALTER TABLE [dbo].[Proveedor]
ADD CONSTRAINT [PK_Proveedor]
    PRIMARY KEY CLUSTERED ([idProveedor] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [idPersona] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [PK_Usuario]
    PRIMARY KEY CLUSTERED ([idPersona] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [fk_idCategoria] in table 'Producto'
ALTER TABLE [dbo].[Producto]
ADD CONSTRAINT [FK__Producto__fk_idC__4E88ABD4]
    FOREIGN KEY ([fk_idCategoria])
    REFERENCES [dbo].[Categoria]
        ([idCategoria])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Producto__fk_idC__4E88ABD4'
CREATE INDEX [IX_FK__Producto__fk_idC__4E88ABD4]
ON [dbo].[Producto]
    ([fk_idCategoria]);
GO

-- Creating foreign key on [fk_idPersona] in table 'Empleado'
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT [FK__Empleado__fk_idP__534D60F1]
    FOREIGN KEY ([fk_idPersona])
    REFERENCES [dbo].[Usuario]
        ([idPersona])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Empleado__fk_idP__534D60F1'
CREATE INDEX [IX_FK__Empleado__fk_idP__534D60F1]
ON [dbo].[Empleado]
    ([fk_idPersona]);
GO

-- Creating foreign key on [fk_idEmpleado] in table 'Pedido'
ALTER TABLE [dbo].[Pedido]
ADD CONSTRAINT [FK__Pedido__fk_idEmp__5629CD9C]
    FOREIGN KEY ([fk_idEmpleado])
    REFERENCES [dbo].[Empleado]
        ([idEmpleado])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Pedido__fk_idEmp__5629CD9C'
CREATE INDEX [IX_FK__Pedido__fk_idEmp__5629CD9C]
ON [dbo].[Pedido]
    ([fk_idEmpleado]);
GO

-- Creating foreign key on [fk_idProducto] in table 'Inventario'
ALTER TABLE [dbo].[Inventario]
ADD CONSTRAINT [FK__Inventari__fk_Pr__02FC7413]
    FOREIGN KEY ([fk_idProducto])
    REFERENCES [dbo].[Producto]
        ([idProducto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Inventari__fk_Pr__02FC7413'
CREATE INDEX [IX_FK__Inventari__fk_Pr__02FC7413]
ON [dbo].[Inventario]
    ([fk_idProducto]);
GO

-- Creating foreign key on [fk_Pedido_idPedido] in table 'Pedido_Producto'
ALTER TABLE [dbo].[Pedido_Producto]
ADD CONSTRAINT [FK__Pedido_Pr__fk_Pe__59063A47]
    FOREIGN KEY ([fk_Pedido_idPedido])
    REFERENCES [dbo].[Pedido]
        ([idPedido])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Pedido_Pr__fk_Pe__59063A47'
CREATE INDEX [IX_FK__Pedido_Pr__fk_Pe__59063A47]
ON [dbo].[Pedido_Producto]
    ([fk_Pedido_idPedido]);
GO

-- Creating foreign key on [fk_Producto_idProducto] in table 'Pedido_Producto'
ALTER TABLE [dbo].[Pedido_Producto]
ADD CONSTRAINT [FK__Pedido_Pr__fk_Pr__59FA5E80]
    FOREIGN KEY ([fk_Producto_idProducto])
    REFERENCES [dbo].[Producto]
        ([idProducto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Pedido_Pr__fk_Pr__59FA5E80'
CREATE INDEX [IX_FK__Pedido_Pr__fk_Pr__59FA5E80]
ON [dbo].[Pedido_Producto]
    ([fk_Producto_idProducto]);
GO

-- Creating foreign key on [fk_idProveedor] in table 'Producto'
ALTER TABLE [dbo].[Producto]
ADD CONSTRAINT [FK__Producto__fk_idP__4D94879B]
    FOREIGN KEY ([fk_idProveedor])
    REFERENCES [dbo].[Proveedor]
        ([idProveedor])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Producto__fk_idP__4D94879B'
CREATE INDEX [IX_FK__Producto__fk_idP__4D94879B]
ON [dbo].[Producto]
    ([fk_idProveedor]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------