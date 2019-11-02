<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AdminModule.Login" %>

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
            <label class="tab" id="lbl1"><a href="Login.aspx">Sign In</a></label>
            <label class="tab" id="lbl2"><a href="SignUp.aspx">Sign Up</a></label>
            <div class="login-form">
                    <div class="group">
                        <label for="user" class="label">Username</label>
                        <asp:TextBox ID="username" runat="server" CssClass="input" AutoCompleteType="Disabled"></asp:TextBox>
                         </div>
                    <div class="group">
                        <label for="pass" class="label">Password</label>
                        <asp:TextBox ID="password" runat="server" CssClass="input" AutoCompleteType="Disabled" TextMode="Password" ValidationGroup="*"></asp:TextBox>
                    </div>
                    <div class="group">
                         <asp:Label ID="LoginResults" runat="server" Text="" CssClass="form-control" ForeColor="Black"></asp:Label>
                    </div>
                    <div class="group">
                        <asp:Button ID="LoginButton" runat="server"  OnClick="Submit_Click" CssClass="button" Text="SIGN IN"></asp:Button>
                    </div>
                    <div class="hr"></div>
                    <div class="foot-lnk">
                        <a href="#forgot">Forgot Password?</a>
                    </div>
                    
            </div>
        </div>
    </div>
    </form>
</body>
</html>
