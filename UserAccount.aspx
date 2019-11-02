<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="UserAccount.aspx.cs" Inherits="AdminModule.UserAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="page-container">
            <!-- MAIN CONTENT-->
             <div class="main-content">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <div class="row">
                                 <div class="col-md-12">
                                        <div class="card">
                                                <div class="card-header" style="background-color:black">       
                                                     <h2 class="title-1" style="color:white">Configure Admin Account:</h2> 
                                                </div>
                                                <div class="card-body card-block">
                                                    <h4>Account Details:</h4>
                                                </div>
                                                <div class="card-body card-block">
                                                    <form action="" method="post" class="form-horizontal">
                                                        <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Admin Username:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:Label ID="UsernameLabel" runat="server" class="form-control" Text='<%# Eval("adminAccountUsername") %>'></asp:Label>
                                                            </div>
                                                        </div>
                                                         <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Admin Profile Name:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="UserProfileName" runat="server" class=" form-control" AutoComplete="Disabled"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                         <div class="row form-group"> 
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Admin Profile Image:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:Image ID="ProfileImage" runat="server" ImageUrl='<%# Eval("adminAccountDP") %>' Height="250px" Width="200px"></asp:Image>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Upload Profile Image:</label>
                                                            </div> 
                                                            <div class="col-md-6">
                                                                <asp:FileUpload ID="ImageUpdate" runat="server" CssClass="form-control"/>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Admin Email:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="AdminProfileEmail" runat="server" class=" form-control" AutoComplete="Disabled"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        </form>
                                                    </div>
                                                        <div class="card-footer">
                                                          <asp:Button ID="ButtonSave" runat="server" Text="Save" class="btn btn-primary btn-md" OnClick="ButtonSave_Click" />
                                                    </div>
                                            </div>
                                     </div>
                                </div>
                            </div>
                        </div>
                 </div>
           </div>
</asp:Content>
