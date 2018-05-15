<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Units.aspx.cs" Inherits="DietetiK.Units" %>

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

    <title>Unidades de medida</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid" style="padding-left: 25px; padding-right: 25px; padding-right: 25px; font-family: 'Segoe UI'; font-size: smaller">
            <div class="row">
                <div class="page-header">
                    <h1><b style="color: greenyellow"><a href="Default.aspx">DietetiK</a></b> | Unidades de medida</h1>
                </div>
            </div>
            <div class="row">
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
            </div>
            <div class="row">
                <div class="col-12">
                    <asp:ListView ID="UnitsListView" runat="server"
                        DataKeyNames="id_unidad_medida"
                        DataSourceID="UnitsDataSource"
                        InsertItemPosition="FirstItem">
                        <LayoutTemplate>
                            <div class="table-responsive">

                                <table class="table  table-condensed">
                                    <thead class="thead-light">
                                        <tr>
                                            <th>ID</th>
                                            <th>Unidad</th>
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
                                    <asp:Label ID="lblid_unidad_medida" runat="server" Text='<%# Eval("id_unidad_medida") %>' /></td>
                                <td>
                                    <asp:Label ID="lblunidad" runat="server" Text='<%# Eval("unidad") %>' /></td>

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
                                    <asp:Label ID="txtid_unidad_medida" runat="server" Text='<%# Bind("id_unidad_medida") %>' /></td>
                                <td>
                                    <asp:TextBox ID="txtunidad" runat="server" Text='<%# Bind("unidad") %>' CssClass="form-control" /></td>

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
                                    <asp:Label ID="txtid_unidad_medida" runat="server" Text="" /></td>
                                <td>
                                    <asp:TextBox ID="txtunidad" runat="server" Text='<%# Bind("unidad") %>' CssClass="form-control" /></td>
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
                <asp:DataPager ID="UnitsDataPager" runat="server" PagedControlID="UnitsListView" PageSize="20">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </div>

        <asp:SqlDataSource ID="UnitsDataSource" ConnectionString="<%$ ConnectionStrings:DtKDBContext %>" runat="server"
            SelectCommand="sp_get_units" SelectCommandType="StoredProcedure"
            DeleteCommand="sp_delete_unit" DeleteCommandType="StoredProcedure"
            UpdateCommand="sp_update_unit" UpdateCommandType="StoredProcedure"
            InsertCommand="[dbo].[sp_insert_unit]" InsertCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="unidad" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_unidad_medida" Type="Int32" />
                <asp:Parameter Name="unidad" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="id_unidad_medida" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
