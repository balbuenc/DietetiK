<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="DietetiK.Sales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="/Scripts/jquery-1.12.4.min.js"></script>
    <script src="/Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />

    <style>
        .btn.btn-square {
            border-radius: 0;
        }
    </style>

    <title>Ventas</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid" style="padding-left: 25px; padding-right: 25px; padding-right: 25px; font-family: 'Segoe UI'; font-size: smaller">
            <div class="row" style="padding:5px">
                <div class="page-header">
                    <h1><b style="color: greenyellow"><a href="Default.aspx">DietetiK</a></b> | Ventas</h1>
                </div>
            </div>
            <div class="row">
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
            </div>
            <div class="row">
                <div class="col-2">
                    <h2><b>Cliente</b></h2>
                </div>
                <div class="col-4">
                    <asp:DropDownList ID="ddlClientes" CssClass="form-control" runat="server" DataSourceID="ClientesDDLDataSource" DataTextField="cliente" DataValueField="id_cliente"></asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-2">
                    <h3>Producto</h3>
                </div>
                <div class="col-3">
                    <asp:DropDownList ID="ddlProductos" CssClass="form-control" runat="server" DataSourceID="ProductosDDLDataSource" DataTextField="producto" DataValueField="id_producto" OnSelectedIndexChanged="ddlProductos_SelectedIndexChanged"  AutoPostBack="true"></asp:DropDownList>
                </div>
                <div class="col-3" style="text-align: right">
                    <asp:Label ID="Total1" runat="server" Text="PYG" Font-Size="X-Large"></asp:Label>
                </div>
                <div class="col-4" style="text-align: right">
                    <asp:Label ID="TotalPYG" runat="server" Text="0.0" Font-Size="X-Large"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-2">
                    <h3>Código</h3>
                </div>
                <div class="col-3">
                    <asp:TextBox ID="txtCodigoProducto" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-3" style="text-align: right">
                    <asp:Label ID="Label1" runat="server" Text="USD" Font-Size="X-Large"></asp:Label>
                </div>
                <div class="col-4" style="text-align: right">
                    <asp:Label ID="TotalUSD" runat="server" Text="0.0" Font-Size="X-Large"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-2">
                </div>
                <div class="col-3">
                    <asp:Button ID="AgregarProducto" runat="server" Text="Agregar producto" OnClick="AgregarProducto_Click" CssClass="btn btn-light  btn-square" />
                </div>
                <div class="col-3" style="text-align: right">
                    <asp:Label ID="Label2" runat="server" Text="BRL" Font-Size="X-Large"></asp:Label>
                </div>
                <div class="col-4" style="text-align: right">
                    <asp:Label ID="TotalBRL" runat="server" Text="0.0" Font-Size="X-Large"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-6" style="border: solid; text-align: center; padding:1px">
                    <b>Detalle de Ventas</b>
                </div>
                <div class="col-6" style="text-align: right">
                    <asp:Button ID="FacturarBTN" runat="server" Text="Facturar" OnClick="FacturarBTN_Click" CssClass="btn  btn-success btn-lg btn-square" />
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-12">
                    <asp:ListView ID="SaleDetailsListView" runat="server"
                        DataKeyNames="id_venta_detalle"
                        DataSourceID="SaleDetailsDataSource"
                        InsertItemPosition="FirstItem">
                        <LayoutTemplate>
                            <div class="table-responsive">
                                <table class="table  table-condensed">
                                    <thead class="thead-light" style="height: 10px">
                                        <tr>
                                            <th>ID</th>
                                            <th>Producto</th>
                                            <th>Cantidad</th>
                                            <th>Precio</th>
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
                                    <asp:Label ID="lblid_venta_detalle" runat="server" Text='<%# Eval("id_venta_detalle") %>' /></td>
                                <td>
                                    <asp:Label ID="lblid_producto" runat="server" Text='<%# Eval("producto") %>' /></td>
                                <td>
                                    <asp:Label ID="lblcantidad" runat="server" Text='<%# Eval("cantidad") %>' /></td>
                                <td>
                                    <asp:Label ID="lblprecio" runat="server" Text='<%# Eval("precio") %>' /></td>


                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger btn-sm btn-square" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <EditItemTemplate>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                        </InsertItemTemplate>
                        <EmptyDataTemplate>
                            <div class="row">
                                <div class="col-lg-12 text-center">
                                    <div class="msg-box bg-warning alert-danger">No se encontraron unidades de medida.</div>
                                </div>
                            </div>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </div>
            </div>
            <div class="row">
                <asp:DataPager ID="SaleDetailsDataPager" runat="server" PagedControlID="SaleDetailsListView" PageSize="20">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </div>

        <asp:SqlDataSource ID="SaleDetailsDataSource" ConnectionString="<%$ ConnectionStrings:DtKDBContext %>" runat="server"
            SelectCommand="sp_get_sale_details" SelectCommandType="StoredProcedure"
            DeleteCommand="sp_delete_sale_detail" DeleteCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="id_venta" QueryStringField="venta" Type="Int32" />

            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="id_venta_detalle" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="ClientesDDLDataSource" ConnectionString="<%$ ConnectionStrings:DtKDBContext %>" runat="server"
            SelectCommand="sp_get_clientes_ddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="ProductosDDLDataSource" ConnectionString="<%$ ConnectionStrings:DtKDBContext %>" runat="server"
            SelectCommand="sp_get_productos_ddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </form>
</body>
</html>
