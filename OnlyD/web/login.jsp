<%-- 
    Document   : login
    Created on : 11 Apr 2024, 9:57:26 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
    </head>
    <body>
        <%@include file="layout/header.jsp"%>
        
        <%
        String statusMsg = (String)session.getAttribute("statusMsg");
        String errorMessage = (String)session.getAttribute("errorMessage");
        String enteredUsername = (String)session.getAttribute("enteredUsername");
        %>
        <% if(statusMsg != null){ %>
        <h4 style="color: red; text-align: center"><%= statusMsg %></h4>
        <%
            session.removeAttribute("statusMsg");
            }
        %>
        
        <div class="mainBody mt-5" style="display: flex;
             align-content: center; flex-wrap: wrap">
            <div class="loginCard container">
                <div class="card card_deco">
                    <h1 class="card-header yellow_black">Customer Login page</h1>
                    <div class="card-body">
                        <form action="<%=request.getContextPath()%>/Login">
                            <h5 class="card-title" style="text-align: left">Welcome, please enter your:</h5>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">Username</span>
                                <input type="text" name="username" value="<%= (enteredUsername==null)?"":enteredUsername %>" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required >
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">Password</span>
                                <input type="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required >
                            </div>
                            <div class="d-flex justify-content-center">
                                <input class="btn yellow_black me-2" type="submit" value="Sign In">
                                <input class="btn reset_dlt_btn" type="reset" value="Reset">                              
                            </div>
                        </form>
                        <% if(errorMessage != null) { %>
                        <div class="error-message" style="color: red;">
                            <%= errorMessage %>
                        </div>
                        <% 
                            session.removeAttribute("errorMessage");
                            } 
                            if(enteredUsername != null){
                                session.removeAttribute("enteredUsername");
                            }
                        %>
                    </div>
                    <div class="text-center">
                        <p>OR</p>
                        <p>Don't have an account ?<br><a href="register.jsp">Sign Up</a></p>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="layout/footer.jsp"%>        
    </body>
</html>