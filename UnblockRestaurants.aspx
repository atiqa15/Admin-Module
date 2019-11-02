<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="UnblockRestaurants.aspx.cs" Inherits="AdminModule.UnblockRestaurants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="page-container">
            <!-- HEADER DESKTOP-->
              <!-- HEADER DESKTOP-->
             <!-- MAIN CONTENT-->
             <div class="main-content">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <div class="row">
                                 <div class="col-md-12">
                                        <div class="card">
                                                <div class="card-header" style="background-color:black">       
                                                     <h2 class="title-1" style="color:white">Blocked Restaurants:</h2> 
                                                </div>
                                            <div class="table-responsive table--no-card m-b-30">
                                            <asp:Repeater ID="rptCategory" runat="server">
                                               <HeaderTemplate>
                                                    <table class="table table-borderless table-striped table-earning">
                                                        <tr>
                                                       <th class="text-center">Admin Username</th>
                                                      <th class="text-center">Admin Name</th>
                                                      <th class="text-center">Admin DP</th>
                                                       <th class="text-center">Password</th>
                                                       <th class="text-center">Repeat Password</th>
                                                        <th class="text-center">Email</th>
                                                        <th class="text-center">Status</th>
                                                        </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Label ID="restaurantAdminUName" runat="server" Text='<%# Eval("blUname") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Label ID="restaurantAdminName" runat="server" Text='<%# Eval("blname") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Image ID="restaurantAdminDP" runat="server" ImageUrl='<%# Eval("blDP") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Label ID="restaurantAdminPass" runat="server" Text='<%# Eval("blPass") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Label ID="restaurantAdminRptPass" runat="server" Text='<%# Eval("blRptPass") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Label ID="restaurantAdminEmail" runat="server" Text='<%# Eval("blEmail") %>'/></td>
                                                        <td class="text-center" style="width:100px"><asp:Button ID="ButtonDelete" runat="server" class="btn btn-danger btn-md" Text="Block" OnClientClick="return confirm('Do you want to block this User?');" OnClick="ButtonDelete_Click"/></td>
                                                    </tr>
                                                    
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </table>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>                                      
                                      </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                 </div>
            </div>
</asp:Content>
