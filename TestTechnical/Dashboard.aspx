<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="TestTechnical.Dashboard" %>


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

        .search-panel {
            background: steelblue;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .border-search {
            border: 3px solid #ccc;
            border-radius: 10px;
            border-color: black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Header Name -->

        <div class="row header">
            <div class="col">
                <h1 class="h3 text-white">SALES ORDER</h1>
            </div>
        </div>

        <!-- Body -->
        <div class="row search-panel">
            <div class="col-md-12">
                <div class="d-flex flex-wrap align-items-center p-5 border-search">
                    <div class="col-md-2">
                        <asp:Label runat="server" class="form-label" Text="Keywords" ForeColor="Black"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <input type="text" class="form-control" id="tb_search" placeholder="Search by Order ID" />
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <asp:Label runat="server" class="form-label" Text="Order Date" ForeColor="Black"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <input type="text" class="form-control" id="tb_searchDate" placeholder="Search by Order ID" />
                        </div>
                    </div>

                </div>
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
