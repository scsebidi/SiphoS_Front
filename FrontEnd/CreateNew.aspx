<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CreateNew.aspx.cs" Inherits="FrontEnd.CreateNew" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div style="padding:10%"> 
            <div class="form-group">
                <label>VehicleRegistration</label>
                <input type="text" ng-model="VehicleRegistration" class="form-control" >
            </div>
            <div class="form-group">
                <label>Make</label>
                <input type="text" ng-model="Make" class="form-control" >
            </div>
           <div class="form-group">
                <label>Model</label>
                <input type="text" ng-model="Model" class="form-control" >
            </div>
            <div class="form-group">
                <label>ModelYear</label>
                <input type="text" ng-model="ModelYear" class="form-control" >
            </div>
            <div class="form-group">
                <label>KMS</label>
                <input type="text" ng-model="KMS" class="form-control" >
            </div>
             <div class="form-group">
                <label>Colour</label>
                <input type="text" ng-model="Colour" class="form-control" >
            </div>
            <div class="form-group">
                <label>VIN</label>
                <input type="text" ng-model="VIN" class="form-control" >
            </div>
            <div class="form-group">
                <label>RetailPrice</label>
                <input type="text" ng-model="RetailPrice" class="form-control" >
            </div><div class="form-group">
                <label>CostPrice</label>
                <input type="text" ng-model="CostPrice" class="form-control" >
            </div>
            <div class="form-group">
                <label>Description</label>
                <input type="text" ng-model="Description" class="form-control" >
            </div>
            <div class="form-group">
                <label>Image</label>
                <input type="file" ng-model="Image" class="form-control" >
            </div>
            <input type="submit" ng-click="Add()"/>
            </div>
    </form>
</asp:Content>
