<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clients.aspx.cs" Inherits="DietetiK.Clients" %>

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

    <title>Clientes</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid" style="padding-left: 25px; padding-right: 25px; padding-right: 25px; font-family: 'Segoe UI'; font-size: smaller">
            <div class="row">
                <div class="page-header">
                    <h1><b style="color: greenyellow"><a href="Default.aspx">DietetiK</a></b> | Clientes</h1>
                </div>
            </div>
            <div class="row">
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
            </div>
            <div class="row">
                <div class="col-12">
                    <asp:ListView ID="ClientsListView" runat="server"
                        DataKeyNames="id_cliente"
                        DataSourceID="ClientsDataSource"
                        InsertItemPosition="FirstItem">
                        <LayoutTemplate>
                            <div class="table-responsive">

                                <table class="table  table-condensed">
                                    <thead class="thead-light">
                                        <tr>
                                            <th>ID</th>
                                            <th>Nombres</th>
                                            <th>Apellidos</th>
                                            <th>Nro. documento</th>
                                            <th>R.U.C.</th>
                                            <th>Nro. Celular</th>
                                            <th>Fecha registro</th>
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
                                    <asp:Label ID="lblid_cliente" runat="server" Text='<%# Eval("id_cliente") %>' /></td>
                                <td>
                                    <asp:Label ID="lblnombre" runat="server" Text='<%# Eval("nombre") %>' /></td>
                                <td>
                                    <asp:Label ID="lblapellido" runat="server" Text='<%# Eval("apellido") %>' /></td>
                                <td>
                                    <asp:Label ID="lbldocumento" runat="server" Text='<%# Eval("documento") %>' /></td>
                                <td>
                                    <asp:Label ID="lblruc" runat="server" Text='<%# Eval("ruc") %>' /></td>
                                <td>
                                    <asp:Label ID="lblnro_celular" runat="server" Text='<%# Eval("nro_celular") %>' /></td>
                                <td>
                                    <asp:Label ID="lblfecha_registro" runat="server" Text='<%# Eval("fecha_registro") %>' /></td>

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
                                    <asp:Label ID="txtid_cliente" runat="server" Text='<%# Bind("id_cliente") %>' /></td>
                                <td>
                                    <asp:TextBox ID="txtnombre" runat="server" Text='<%# Bind("nombre") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtapellido" runat="server" Text='<%# Bind("apellido") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtdocumento" runat="server" Text='<%# Bind("documento") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtruc" runat="server" Text='<%# Bind("ruc") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txt_nro_celular" runat="server" Text='<%# Bind("nro_celular") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:Label ID="txtfecha_registro" runat="server" Text='<%# Eval("fecha_registro") %>' /></td>

                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Update" CssClass="btn  btn-success btn-sm btn-square" />
                                </td>
                                <td>
                                    <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn btn-default btn-sm btn-square" />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <tr style="height: 45px">
                                <td>
                                    <asp:Label ID="txtid_cliente" runat="server" Text="" /></td>
                                <td>
                                    <asp:TextBox ID="txtnombre" runat="server" Text='<%# Bind("nombre") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtapellido" runat="server" Text='<%# Bind("apellido") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtdocumento" runat="server" Text='<%# Bind("documento") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtruc" runat="server" Text='<%# Bind("ruc") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtnro_celular" runat="server" Text='<%# Bind("nro_celular") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:Label ID="txtfecha_registro" runat="server" Text="" /></td>

                                <td class="text-center" colspan="2">
                                    <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success btn-square" />
                                </td>
                            </tr>
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
                <asp:DataPager ID="ClientsDataPager" runat="server" PagedControlID="ClientsListView" PageSize="20">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </div>

        <asp:SqlDataSource ID="ClientsDataSource" ConnectionString="<%$ ConnectionStrings:DtKDBContext %>" runat="server"
            SelectCommand="sp_get_clients" SelectCommandType="StoredProcedure"
            DeleteCommand="sp_delete_client" DeleteCommandType="StoredProcedure"
            UpdateCommand="sp_update_client" UpdateCommandType="StoredProcedure"
            InsertCommand="[dbo].[sp_insert_client]" InsertCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="apellido" Type="String" />
                <asp:Parameter Name="documento" Type="String" />
                <asp:Parameter Name="ruc" Type="String" />
                <asp:Parameter Name="nro_celular" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_cliente" />
                <asp:Parameter Name="nombre" />
                <asp:Parameter Name="apellido" />
                <asp:Parameter Name="documento" />
                <asp:Parameter Name="ruc" />
                <asp:Parameter Name="nro_celular"/>
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="id_cliente" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
