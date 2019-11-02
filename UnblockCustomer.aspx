<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="UnblockCustomer.aspx.cs" Inherits="AdminModule.UnblockCustomer" %>
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
                                                     <h2 class="title-1" style="color:white">Blocked Customers:</h2> 
                                                </div>
                                            <div class="table-responsive table--no-card m-b-30">
                                            <asp:Repeater ID="rptCategory" runat="server">
                                               <HeaderTemplate>
                                                    <table class="table table-borderless table-striped table-earning">
                                                        <tr>
                                                       <th class="text-center">Customer Name</th>
                                                       <th class="text-center">Password</th>
                                                       <th class="text-center">Repeat Password</th>
                                                        <th class="text-center">Email</th>
                                                        <th class="text-center">Status</th>
                                                        </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Label ID="customerName" runat="server" Text='<%# Eval("blname") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Label ID="customerPass" runat="server" Text='<%# Eval("blpass") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Label ID="customerRptPass" runat="server" Text='<%# Eval("blrptpass") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Label ID="customerEmail" runat="server" Text='<%# Eval("blemail") %>'/></td>
                                                        <td class="text-center" style="width:100px"><asp:Button ID="ButtonDelete" runat="server" class="btn btn-danger btn-md" Text="UnBlock" OnClientClick="return confirm('Do you want to Unblock this User?');" OnClick="ButtonDelete_Click"/></td>
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
