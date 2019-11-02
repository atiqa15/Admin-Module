<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="AdminModule.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dastarkhwan Restaurant Login</title>
     <link href="login.css" rel="stylesheet" media="all"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-wrap">
        <div class="login-html">
            <a href="Login.aspx" class="tab" >Sign In</a>
            <a href="SignUp.aspx" class="tab" >Sign Up</a>
            <div class="login-form">
                    <div class="group">
                        <label for="user" class="label">Username</label>
                        <asp:TextBox ID="Username" runat="server" CssClass="input" AutoCompleteType="Disabled"></asp:TextBox>
                         </div>
                    <div class="group">
                        <label for="pass" class="label">Password</label>
                        <asp:TextBox ID="Password" runat="server" CssClass="input" AutoCompleteType="Disabled" TextMode="Password" ValidationGroup="*"></asp:TextBox>
                    </div>
                    <div class="group">
                        <label for="Rptpass" class="label">Repeat Password</label>
                        <asp:TextBox ID="RptPassword" runat="server" CssClass="input" AutoCompleteType="Disabled" TextMode="Password" ValidationGroup="*"></asp:TextBox>
                    </div>
                    <div class="group">
                        <label for="Email" class="label">Email</label>
                        <asp:TextBox ID="UserEmail" runat="server" CssClass="input" AutoCompleteType="Disabled"></asp:TextBox>
                    </div>
                    <div class="group">
                         <asp:Label ID="LoginResults" runat="server" Text="" CssClass="form-control" ForeColor="Black"></asp:Label>
                    </div>
                    <div class="group">
                        <asp:Button ID="LoginButton" runat="server"  OnClick="Submit_Click" CssClass="button" Text="SIGN UP"></asp:Button>
                    </div>
                    <div class="hr"></div>
                    <div class="foot-lnk">
                        <a href="Login.aspx">Already a member?</a>
                    </div>
                    
            </div>
        </div>
    </div>
    </form>
</body>
</html>