<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="DietetiK.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="/Scripts/jquery-1.12.4.min.js"></script>
    <script src="/Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />

    <title>Productos</title>

    <style>
        .btn.btn-square {
            border-radius: 0;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container-fluid" style="padding-left: 25px; padding-right: 25px; padding-right: 25px; font-family: 'Segoe UI'; font-size: smaller">
            <div class="row">
                <div class="page-header">
                    <h1><b style="color: greenyellow"><a href="Default.aspx">DietetiK</a></b> | Productos</h1>
                </div>
            </div>
            <div class="row">
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
            </div>
            <div class="row">
                <div class="col-12">
                    <asp:ListView ID="ProductsListView" runat="server"
                        DataKeyNames="id_producto"
                        DataSourceID="ProductDataSource"
                        InsertItemPosition="FirstItem"
                        OnItemCommand="ProductsListView_ItemCommand">
                        <LayoutTemplate>
                            <div class="table-responsive">

                                <table class="table  table-condensed">
                                    <thead class=" thead-light">
                                        <tr>

                                            <th>ID</th>
                                            <th>Nombre</th>
                                            <th>Descripcion</th>
                                            <th>Costo</th>
                                            <th>% Gananc.</th>
                                            <th>Tipo produc.</th>
                                            <th>UM</th>
                                            <th>Código</th>
                                            <th colspan="2" style="text-align: center">Acciones</th>
                                        </tr>

                                    </thead>
                                    <tbody>
                                        <tr runat="server" id="itemPlaceholder" />
                                    </tbody>
                                </table>

                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lblid_producto" runat="server" Text='<%# Eval("id_producto") %>' /></td>
                                <td>
                                    <asp:Label ID="lblnombre" runat="server" Text='<%# Eval("nombre") %>' /></td>
                                <td>
                                    <asp:Label ID="lbldescripcion" runat="server" Text='<%# Eval("descripcion") %>' /></td>
                                <td>
                                    <asp:Label ID="lblcosto" runat="server" Text='<%# Eval("costo") %>' /></td>
                                <td>
                                    <asp:Label ID="lblporcentaje_ganancia" runat="server" Text='<%# Eval("porcentaje_ganancia") %>' /></td>

                                <td>

                                    <asp:Label ID="lblid_tipo_producto" runat="server" Text='<%# Eval("tipo") %>' /></td>
                                <td>
                                    <asp:Label ID="lblid_unidad_medida" runat="server" Text='<%# Eval("unidad") %>' /></td>
                                <td>
                                    <asp:Label ID="lblcodigo_barra" runat="server" Text='<%# Eval("codigo_barra") %>' /></td>
                                <td>
                                    <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info btn-sm btn-square" />
                                </td>
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger btn-sm btn-square" />

                                </td>
                            </tr>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="txtid_producto" runat="server" Text='<%# Bind("id_producto") %>' /></td>
                                <td>
                                    <asp:TextBox ID="txtnombre" runat="server" Text='<%# Bind("nombre") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtdescripcion" runat="server" Text='<%# Bind("descripcion") %>' CssClass="form-control" /></td>

                                <td>
                                    <asp:TextBox ID="txtcosto" runat="server" Text='<%# Bind("costo") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtporcentaje_ganancia" runat="server" Text='<%# Bind("porcentaje_ganancia") %>' CssClass="form-control" /></td>

                                <td>
                                    <asp:DropDownList ID="ddlTipoProducto" runat="server" CssClass="form-control" DataSourceID="TipoProductosDataSource"
                                        DataValueField="id_tipo_producto" DataTextField="tipo" AppendDataBoundItems="true"
                                        SelectedValue='<%#string.IsNullOrEmpty( Eval("id_tipo_producto").ToString())?-1:Eval("id_tipo_producto") %>'>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlUnidadMedida" runat="server" CssClass="form-control" DataSourceID="UnidadMedidaDataSource"
                                        DataValueField="id_unidad_medida" DataTextField="unidad" AppendDataBoundItems="true"
                                        SelectedValue='<%#string.IsNullOrEmpty( Eval("id_unidad_medida").ToString())?-1:Eval("id_unidad_medida") %>'>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtcodigo_barra" runat="server" Text='<%# Bind("codigo_barra") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Actualizar" CssClass="btn  btn-success btn-sm btn-square" />
                                </td>
                                <td>
                                    <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn btn-default btn-sm btn-square" />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <tr style="height: 45px">
                                <td>
                                    <asp:Label ID="txtid_producto" runat="server" Text='<%# Bind("id_producto") %>' /></td>
                                <td>
                                    <asp:TextBox ID="txtnombre" runat="server" Text='<%# Bind("nombre") %>' CssClass="form-control" /></td>
                                <td style="width: 400px">
                                    <asp:TextBox ID="txtdescripcion" runat="server" Text='<%# Bind("descripcion") %>' CssClass="form-control" /></td>

                                <td>
                                    <asp:TextBox ID="txtcosto" runat="server" Text='<%# Bind("costo") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtporcentaje_ganancia" runat="server" Text='<%# Bind("porcentaje_ganancia") %>' CssClass="form-control" /></td>

                                <td>
                                    <asp:DropDownList ID="ddlTipoProducto" runat="server" CssClass="form-control" DataSourceID="TipoProductosDataSource"
                                        DataValueField="id_tipo_producto" DataTextField="tipo" AppendDataBoundItems="true">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlUnidadMedida" runat="server" CssClass="form-control" DataSourceID="UnidadMedidaDataSource"
                                        DataValueField="id_unidad_medida" DataTextField="unidad" AppendDataBoundItems="true">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtcodigo_barra" runat="server" Text='<%# Bind("codigo_barra") %>' CssClass="form-control" /></td>

                                <td class="text-center" colspan="2">
                                    <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Agregar" CssClass="btn btn-success btn-square" />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <EmptyDataTemplate>
                            <div class="row">
                                <div class="col-lg-12 text-center">
                                    <div class="msg-box bg-warning alert-danger">No se encontraron productos.</div>
                                </div>
                            </div>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </div>
            </div>
            <div class="row">
                <asp:DataPager ID="ProductsDataPager" runat="server" PagedControlID="ProductsListView" PageSize="20">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </div>
        <asp:SqlDataSource ID="UnidadMedidaDataSource" ConnectionString="<%$ ConnectionStrings:DtKDBContext %>" runat="server"
            SelectCommand="sp_get_unidad_medida_ddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="TipoProductosDataSource" ConnectionString="<%$ ConnectionStrings:DtKDBContext %>" runat="server"
            SelectCommand="sp_get_tipo_productos_ddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="ProductDataSource" ConnectionString="<%$ ConnectionStrings:DtKDBContext %>" runat="server"
            SelectCommand="sp_get_products" SelectCommandType="StoredProcedure"
            DeleteCommand="sp_delete_product" DeleteCommandType="StoredProcedure"
            UpdateCommand="sp_update_product" UpdateCommandType="StoredProcedure"
            InsertCommand="[dbo].[sp_insert_product]" InsertCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="nombre" />
                <asp:Parameter Name="descripcion" />
                <asp:Parameter Name="costo" />
                <asp:Parameter Name="porcentaje_ganancia" />
                <asp:Parameter Name="codigo_barra" />
                <asp:Parameter Name="id_tipo_producto" />
                <asp:Parameter Name="id_unidad_medida" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_producto" />
                <asp:Parameter Name="nombre" />
                <asp:Parameter Name="descripcion" />
                <asp:Parameter Name="costo" />
                <asp:Parameter Name="porcentaje_ganancia" />
                <asp:Parameter Name="codigo_barra" />
                <asp:Parameter Name="id_tipo_producto" />
                <asp:Parameter Name="id_unidad_medida" />

            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="id_producto" Type="Int32" />
            </DeleteParameters>

        </asp:SqlDataSource>
    </form>

</body>
</html>
