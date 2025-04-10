<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditSalesOrder.aspx.cs" Inherits="TestTechnical.EditSalesOrder" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Dashboard Sales Order</title>

    <!-- Custom fonts for this template-->
    <link href="Theme/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
        integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />

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
            padding: 10px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .border-search {
            border: 3px solid black;
            border-radius: 10px;
        }

        .line-panel {
            background-color: #024094;
            text-align: center;
        }
    </style>
</head>
<body style="background-color: steelblue">
    <form id="form1" runat="server">

        <!-- Name Header -->
        <div class="row header py-2 px-3 mb-2">
            <div class="col-md-12">
                <asp:Label runat="server" Text="SALES ORDER" Font-Bold="true" Font-Size="Larger" ForeColor="White" />
            </div>
        </div>

        <!--Detail Line-->
        <div class="row line-panel px-3 py-2 mb-3">
            <div class="col-md-12">
                <asp:Label runat="server" Text="Sales Order Informartion " ForeColor="White" Font-Bold="true" Font-Size="Large"></asp:Label>
                <i class="fas fa-angles-down text-white"></i>

            </div>
        </div>

        <!-- Body Panel -->
        <div class="row body-panel">
            <div class="col-md-12">
                <div class="row px-4 py-4">

                    <div class="col-md-6">
                        <div class="form-group row align-items-center">
                            <asp:Label runat="server" CssClass="col-sm-4 col-form-label" Text="Sales Order Number" ForeColor="Black"></asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" ID="tb_so_number" CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group row align-items-center">
                            <asp:Label runat="server" CssClass="col-sm-4 col-form-label" Text="Customer" ForeColor="Black"></asp:Label>
                            <div class="col-sm-8">
                                <asp:DropDownList runat="server" ID="dd_customer" CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group row align-items-center mt-3">
                            <asp:Label runat="server" CssClass="col-sm-4 col-form-label" Text="Order Date" ForeColor="Black"></asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" ID="tb_orderDate" CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group row align-items-center mt-3">
                            <asp:Label runat="server" CssClass="col-sm-4 col-form-label" Text="Address" ForeColor="Black"></asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" ID="tb_address" CssClass="form-control" TextMode="MultiLine" Rows="2" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Detail Line-->
        <div class="row line-panel px-3 py-2 mb-3">
            <div class="col-md-12">
                <asp:Label runat="server" Text="Detail Item Informartion " ForeColor="White" Font-Bold="true" Font-Size="Large"></asp:Label>
                <i class="fas fa-angles-down text-white"></i>
            </div>
        </div>

        <!-- GridView -->
        <asp:GridView runat="server" ID="gv_so_item" AllowPaging="true" DataKeyNames="SO_ITEM_ID"
            AutoGenerateColumns="False" Width="100%" DataSourceID="SDS_SO_Item" BorderStyle="None">
            <HeaderStyle BackColor="#000066" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" />

            <Columns>
                <asp:TemplateField HeaderText="NO" ItemStyle-HorizontalAlign="center" ItemStyle-Width="5%">
                    <ItemTemplate>
                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ACTION" ItemStyle-HorizontalAlign="Right" ItemStyle-CssClass="text-center" ItemStyle-Width="10%">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="btn_editSales" CssClass="fas fa-file-alt"
                            CommandName="EditSalesOrder" CommandArgument='<%# Eval("SO_ITEM_ID") %>' />
                        <asp:LinkButton runat="server" ID="btn_deleteSales" CssClass="fas fa-trash-alt"
                            CommandName="DeleteSalesOrder" CommandArgument='<%# Eval("SO_ITEM_ID") %>' />

                        <asp:LinkButton runat="server" ID="btn_saveEdit" CssClass="fas fa-file-alt" Visible="false"
                            CommandName="SaveEditSalesOrder" CommandArgument='<%# Eval("SO_ITEM_ID") %>' />
                        <asp:LinkButton runat="server" ID="btn_cancelEdit" CssClass="fas fa-trash-alt" Visible="false"
                            CommandName="CancelEditSalesOrder" CommandArgument='<%# Eval("SO_ITEM_ID") %>' />

                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="ITEM_NAME" HeaderText="ITEM NAME" />
                <asp:BoundField DataField="QUANTITY" HeaderText="QUANTITY" />
                <asp:BoundField DataField="PRICE" HeaderText="PRICE" />

                <asp:TemplateField HeaderText="TOTAL" FooterStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <%# Convert.ToDecimal(Eval("QUANTITY")) * Convert.ToDecimal(Eval("PRICE")) %>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lblFooterTotalAmount" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SDS_SO_Item" ConnectionString="<%$ ConnectionStrings:DefaultConnections%>"
            SelectCommand="SELECT [SO_ITEM_ID], [SO_ORDER_ID], [ITEM_NAME], [QUANTITY], [PRICE] FROM [Test_Profescipta].[dbo].[SO_ITEM]"></asp:SqlDataSource>
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
