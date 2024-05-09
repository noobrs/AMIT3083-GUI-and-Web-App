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
                        
                        <% if ((Boolean) session.getAttribute("isStaff") != null || request.isUserInRole("AdminRole")) { %>
                        
                        <button class="btn btn-outline-dark loginBtn" type="submit" style="margin-right: 10px"><a href="<%=request.getContextPath()%>/staff/staffDashboard.jsp">Dashboard</a></button>
                        <% } else { %>
                        <a data-bs-toggle="tooltip" data-bs-placement="bottom" title="Shopping cart" class="cart_order me-2" href="<%=request.getContextPath()%>/ViewCart">
                            <svg xmlns="http://www.w3.org/2000/svg" width="35" height="45" fill="black" class="bi bi-cart3" viewBox="0 0 16 16">
                            <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l.84 4.479 9.144-.459L13.89 4zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                            </svg>
                        </a>

                        <a data-bs-toggle="tooltip" data-bs-placement="bottom" title="Order list" class="cart_order me-2" href="<%=request.getContextPath()%>/ViewOrderHistory">
                            <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="black" class="bi bi-receipt-cutoff" viewBox="0 0 16 16">
                            <path d="M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5M11.5 4a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1z"/>
                            <path d="M2.354.646a.5.5 0 0 0-.801.13l-.5 1A.5.5 0 0 0 1 2v13H.5a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H15V2a.5.5 0 0 0-.053-.224l-.5-1a.5.5 0 0 0-.8-.13L13 1.293l-.646-.647a.5.5 0 0 0-.708 0L11 1.293l-.646-.647a.5.5 0 0 0-.708 0L9 1.293 8.354.646a.5.5 0 0 0-.708 0L7 1.293 6.354.646a.5.5 0 0 0-.708 0L5 1.293 4.354.646a.5.5 0 0 0-.708 0L3 1.293zm-.217 1.198.51.51a.5.5 0 0 0 .707 0L4 1.707l.646.647a.5.5 0 0 0 .708 0L6 1.707l.646.647a.5.5 0 0 0 .708 0L8 1.707l.646.647a.5.5 0 0 0 .708 0L10 1.707l.646.647a.5.5 0 0 0 .708 0L12 1.707l.646.647a.5.5 0 0 0 .708 0l.509-.51.137.274V15H2V2.118z"/>
                            </svg>
                        </a>
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


                    </div>
                </div>
            </nav>
                                    <div class="container-fluid"style="position: absolute; top: 0; display: flex; justify-content: end; ">
                <div style="margin-right:15%;">
                    <a href="<%=request.getContextPath()%>/login.jsp">User</a> |
                    <a href="<%=request.getContextPath()%>/staff/staffLogin.jsp">Staff</a> |
                    <a href="<%=request.getContextPath()%>/admin/adminLogin.jsp">Admin</a>
                </div> 
            </div>


            <%
            }
            %>
        </header>
    </body>

</html>
