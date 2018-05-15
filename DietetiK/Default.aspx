<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DietetiK.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="/Scripts/jquery-1.12.4.min.js"></script>
    <script src="/Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />

    <title>DietetiK | Menu</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid" style="padding-left: 25px; padding-right: 25px; padding-right: 25px; font-family: 'Segoe UI'; font-size: medium">
            <div class="row">
                <div class="page-header">
                    <h2><b>DietetiK</b> | Menu</h2>
                </div>
            </div>
            <div class="row" style="color: greenyellow; border-bottom: solid">
                <hr />
            </div>
            <div class="row" style="padding-top: 10px">
                <div class="col-3">
                    <a href="Products.aspx" class="btn btn-info btn-lg" role="button">Productos</a>
                </div>
                <div class="col-3">
                    <a href="ProductTypes.aspx" class="btn btn-info btn-lg" role="button">Tipos Productos</a>
                </div>
                <div class="col-3">
                    <a href="Currencies.aspx" class="btn btn-info btn-lg" role="button">Monedas</a>
                </div>
            </div>
            <div class="row" style="padding-top: 10px">
                <div class="col-3">
                    <a href="Units.aspx" class="btn btn-info btn-lg" role="button">Unidad de medida</a>
                </div>
                <div class="col-3">
                    <a href="Clients.aspx" class="btn btn-info btn-lg" role="button">Clientes</a>
                </div>

            </div>
            <div class="row" style="color: greenyellow; border-bottom: solid">
                <hr />
            </div>
            <div class="row" style="padding-top: 10px">
                <div class="col-3">
                    <a href="Sales.aspx" class="btn btn-info btn-lg" role="button">Ventas</a>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
