<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Customer"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/layout/meta.html"%>
        <link rel="shortcut icon" type="image/x-icon" href="<%=request.getRequestURL().toString()%>layout/favicon_onlyD.ico">
    </head>

    <body>
        <header style="top: 0; position:relative; width: 100%;">
            <nav class="navbar navbar-expand-lg navbar-light bg-light" style="top: 0">
                <div class="container">
                    <a href="<%=request.getContextPath()%>">
                    <img src="<%=request.getContextPath()%>/layout/only_D_Logo.png" alt="" width="50px" height="80px" style="margin-right: 10px" />
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Link</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Dropdown
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled">Disabled</a>
                            </li>
                        </ul>
                        <%if((Boolean) session.getAttribute("isCustomer") != null){%>
                        <button class="btn btn-outline-dark loginBtn" type="submit" style="margin-right: 10px"><a href="<%=request.getContextPath()%>/ViewCart">Cart</a></button>
                        <button class="btn btn-outline-dark loginBtn" type="submit" style="margin-right: 10px"><a href="<%=request.getContextPath()%>/ViewOrderHistory">Orders</a></button>
                        <% } else if ((Boolean) session.getAttribute("isStaff") != null) { %>
                        <button class="btn btn-outline-dark loginBtn" type="submit" style="margin-right: 10px"><a href="<%=request.getContextPath()%>/staff/staffDashboard.jsp">Dashboard</a></button>
                        <% } else if(request.isUserInRole("AdminRole")) { %>
                        <button class="btn btn-outline-dark loginBtn" type="submit" style="margin-right: 10px"><a href="<%=request.getContextPath()%>/admin/adminDashboard.jsp">Dashboard</a></button>
                        <% } %>
                        <form class="d-flex" action="<%=request.getContextPath()%>/SearchProductByUser">
                            <input type="text" name="productName" class="form-control me-2" type="search" placeholder="Search Product" aria-label="Search">
                            <input type="submit" value="Search" name="searchButton"  class="btn btn-outline-success">
                        </form>
                        <%
//                        Customer headCust = (Customer)session.getAttribute("customer");
//                        if(headCust.getName() != null){
//                            out.println(headCust.getName());
//                            }
                        
                        if((Boolean) session.getAttribute("isCustomer") != null || (Boolean) session.getAttribute("isStaff") != null || request.isUserInRole("AdminRole") == true){
                        %>
                        <form action="<%=request.getContextPath()%>/logout">
                            <input class="btn btn-outline-dark loginBtn" style="margin-left: 10px" type="submit" value="Logout">

                        </form>
                        <%
                            }else{
                        %>
                        <button class="btn btn-outline-dark loginBtn" type="submit" style="margin-left: 10px"><a href="<%=request.getContextPath()%>/login.jsp">User</a></button>
                        <button class="btn btn-outline-dark loginBtn" type="submit" style="margin-left: 10px"><a href="<%=request.getContextPath()%>/staff/staffLogin.jsp">Staff</a></button>
                        <button class="btn btn-outline-dark loginBtn" type="submit" style="margin-left: 10px"><a href="<%=request.getContextPath()%>/admin/adminLogin.jsp">Admin</a></button>
                        <%
                        }
                        %>

                    </div>
                </div>
            </nav>
        </header>
    </body>

</html>
