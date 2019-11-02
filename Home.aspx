<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AdminModule.Home" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="page-container">
            <!-- HEADER DESKTOP-->
          <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">overview</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row m-t-25">
                            <div class="col-sm-4 col-lg-4">
                                <div class="overview-item overview-item--c1" style="height:300px">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <a href="Customer.aspx">
                                             <div class="icon">
                                                <i class="zmdi zmdi-account-o"></i>
                                            </div>
                                            <br />
                                            <div class="text">
                                                <h2><asp:Label ID="customers" runat="server" Text=""></asp:Label></h2>
                                                <span>Customers</span>
                                            </div>
                                            </a>
                                        </div>
                                        <div class="overview-chart">
                                        </div>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 col-lg-4">
                                <div class="overview-item overview-item--c2" style="height:300px">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <a href="DineInOrder.aspx">
                                            <div class="icon">
                                                <i class="zmdi zmdi-local-dining"></i>
                                            </div><br />
                                            <div class="text">
                                                <h2> <asp:Label ID="tablereservation" runat="server" Text=""></asp:Label></h2>
                                                <span> Restaurants</span>
                                            </div>
                                            </a>
                                        </div>
                                        <div class="overview-chart">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 col-lg-4">
                                <div class="overview-item overview-item--c3" style="height:300px">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <a href="HomeDeliveryOrders.aspx">
                                            <div class="icon">
                                                <i class="zmdi zmdi-comment-list"></i>
                                            </div><br />
                                            <div class="text">
                                                <h2>
                                                    <asp:Label ID="feedback" runat="server" Text=""></asp:Label></h2>
                                                <span>Feedback</span>
                                            </div>
                                            </a>
                                        </div>
                                        <div class="overview-chart">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                          <div class="row">
                            <div class="col-lg-6">
                                <div class="au-card recent-report">
                                    <div class="au-card-inner">
                                        <h3 class="title-2">recent reports</h3>
                                        <div class="chart-info">
                                            <div class="chart-info__left">
                                                <div class="chart-note">
                                                    <span class="dot dot--blue"></span>
                                                    <span>Restaurants Capacity:</span>
                                                </div>
                                             </div>
                                          </div>
                                        <div class="recent-report__chart">
                                            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                                                <Series>
                                                    <asp:Series ChartType="StackedColumn" Name="Series1" XValueMember="restaurantName" YValueMembers="restaurantCapacity">
                                                    </asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1">
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionString %>" SelectCommand="SELECT customerAccount.customerAccountID, customerAccount.customerAccountUsername, customerAccount.customerAccountPassword, customerAccount.customerAccountRptPassword, customerAccount.customerAccountEmail, restaurantProfile.* FROM customerAccount CROSS JOIN restaurantProfile">
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="au-card chart-percent-card">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 tm-b-5">char by %</h3>
                                        <div class="row no-gutters">
                                            <div class="col-xl-6">
                                                <div class="chart-note-wrap">
                                                    <div class="chart-note mr-0 d-block">
                                                        <span class="dot dot--blue"></span>
                                                        <span>Customer/Restaurant Details: </span>
                                                    </div>
                                                 </div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="percent-chart">
                                                    <asp:Chart ID="ChartCst" runat="server" DataSourceID="SqlDataSource3">
                                                        <Series>
                                                            <asp:Series Name="Series1" ChartType="StackedColumn" XValueMember="restaurantID" YValueMembers="customerID"></asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionString %>" SelectCommand="SELECT customerAccount.*, tableReservation.* FROM customerAccount CROSS JOIN tableReservation"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
