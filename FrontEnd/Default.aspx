<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FrontEnd._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
    <script src="Scripts/jquery-3.4.1.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.6.2/css/buttons.dataTables.min.css"/>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.6.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" charset="utf8" src=" https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.html5.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.colVis.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/searchpanes/1.2.1/js/dataTables.searchPanes.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>
      <script type="text/javascript" src="/Scripts/Controllers/AppController.js"></script>
    
    <style>
        .centerText {
            text-align: center;
        }
        #TB_window {
        position: fixed;
        background: #ffffff;
        z-index: 102;
        color: #000000;
        display: none;
        border: 2px solid #525252;
        text-align: left;
        top: 7%;
        left: 50%;
    }
        #stockDIV {
            padding:5%;
        }
     </style>
    <div ng-controller="AppController">
         <div id="stockDIV">
            <h1>Stock Management</h1><br/>
            <table id="table_id" class="display compact" style="width:100%">
            <thead>
                <tr>
                    <th>VehicleRegistration</th>
                    <th>Make</th>
                    <th>Model</th>
                    <th>ModelYear</th>
                    <th>KMS</th>
                    <th>Colour</th>
                    <th>VIN</th>
                    <th>Retain</th>
                    <th>CostPrice</th>
                    <th>Description</th>
                    <th>Image</th>
                    <th>DTCreated</th>
                    <th>DTUpdated</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>VehicleRegistration</th>
                    <th>Make</th>
                    <th>Model</th>
                    <th>ModelYear</th>
                    <th>KMS</th>
                    <th>Colour</th>
                    <th>VIN</th>
                    <th>Retain</th>
                    <th>CostPrice</th>
                    <th>Description</th>
                    <th>Image</th>
                    <th>DTCreated</th>
                    <th>DTUpdated</th>
                </tr>
            </tfoot>
           </table>
        </div>
       
     </div>

</asp:Content>
