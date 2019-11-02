<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="AdminModule.Feedback" %>
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
                                                     <h2 class="title-1" style="color:white">Feedback:</h2> 
                                                </div>
                                            <div class="table-responsive table--no-card m-b-30">
                                            <asp:Repeater ID="rptCategory" runat="server">
                                               <HeaderTemplate>
                                                    <table class="table table-borderless table-striped table-earning">
                                                        <tr>
                                                      <th class="text-center">Name</th>
                                                      <th class="text-center">Email</th>
                                                      <th class="text-center">Feedback</th>
                                                        <th class="text-center">Block</th>
                                                        </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Label ID="adminCustName" runat="server" Text='<%# Eval("adminCustomerName") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Label ID="adminCustEmail" runat="server" Text='<%# Eval("adminCustomerEmail") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Label ID="adminCustFeedback" runat="server" Text='<%# Eval("adminCustomerFeedback") %>'/></td>
                                                        <td class="text-center" style="width:100px"><asp:Button ID="ButtonDelete" runat="server" class="btn btn-danger btn-md" Text="Remove" OnClientClick="return confirm('Do you want to remove this feedback?');" OnClick="ButtonDelete_Click"/></td>
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
