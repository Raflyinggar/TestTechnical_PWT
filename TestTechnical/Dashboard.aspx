<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="TestTechnical.Dashboard" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="Theme/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />

    <!-- Custom styles for this template-->
    <link href="Theme/css/sb-admin-2.min.css" rel="stylesheet" />

    <style type="text/css">
        .header {
            padding: 15px;
            background-color: darkblue;
        }

        .body-panel {
            background-color: steelblue;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .border-search {
            border: 3px solid #ccc;
            border-radius: 10px;
            border-color: black;
        }
    </style>
</head>
<body style="background-color: steelblue">
    <form id="form1" runat="server">

        <!-- Name Header -->
        <div class="row header">
            <div class="col">
                <asp:Label runat="server" Text="SALES ORDER" Font-Bold="true" Font-Size="Larger" ForeColor="White" />
            </div>
        </div>

        <div class="row body-panel">
            <div class="col-md-12">
                <div class="d-flex flex-wrap align-items-center p-5 border-search">
                    <div class="col-md-2">
                        <asp:Label runat="server" class="form-label" Text="Keywords" ForeColor="Black"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <asp:TextBox runat="server" CssClass="form-control" ID="tb_search" Placeholder="Search by Order ID" />
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <asp:Label runat="server" class="form-label" Text="Order Date" ForeColor="Black"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <asp:TextBox runat="server" CssClass="form-control" ID="tb_searchDate" TextMode="Date" Placeholder="Search by Order ID" />
                        </div>
                    </div>

                    <div class="col-md-12 d-flex justify-content-end mt-3">
                        <asp:Button runat="server" ID="btn_search" Text="Search" CssClass="btn" OnClick="btn_search_Click" ForeColor="White" BackColor="#000066" />
                    </div>
                </div>
                <div class="col-md-12 d-flex p-3">
                    <div>
                        <asp:Button runat="server" ID="btn_addNewSales" Text="Add New Data" CssClass="btn" BackColor="#990033" ForeColor="White" />
                        <asp:Button runat="server" ID="btn_exportToExcel" Text="Export To Excel" CssClass="btn" BackColor="#000066" ForeColor="White" />
                    </div>
                </div>

                <!-- Tambahkan GridView -->
                <asp:GridView runat="server" ID="gv_salesOrder" CssClass="table table-bordered table-striped bg-white"
                    AutoGenerateColumns="False" Width="100%" DataSourceID="SDS_SalesOrder">
                    <Columns>
                        <asp:TemplateField HeaderText="NO" ItemStyle-HorizontalAlign="center">
                            <ItemTemplate>
                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ACTION" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:Button runat="server" ID="btn_editSales" CssClass="fas fa-file-alt" />
                                <asp:LinkButton runat="server" ID="btn_deleteSales" CssClass="fas fa-trash-alt"
                                    CommandName="DeleteTR" CommandArgument='<%# Eval("OrderID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                        <asp:BoundField DataField="OrderDate" HeaderText="Order Date" />
                        <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="SDS_SalesOrder" ConnectionString="<%$ ConnectionStrings:DefaultConnections%>"
                    SelectCommand="SELECT TOP (1000) [SO_ORDER_ID] ,[ORDER_NO] ,[ORDER_DATE],[COM_CUSTOMER_ID],[ADDRESS] FROM [Test_Profescipta].[dbo].[SO_ORDER]">   
                </asp:SqlDataSource>

            </div>
        </div>
    </form>

    <!-- Bootstrap core JavaScript-->
    <script src="Theme/vendor/jquery/jquery.min.js"></script>
    <script src="Theme/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="Theme/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="Theme/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="Theme/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="Theme/js/demo/chart-area-demo.js"></script>
    <script src="Theme/js/demo/chart-pie-demo.js"></script>
</body>
</html>
