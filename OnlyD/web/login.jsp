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
        <%@include file="/layout/meta.html"%>

    </head>
    <body style="background-color: #25182E">
        <%@include file="layout/header.jsp"%>

        <%
        String statusMsg = (String)session.getAttribute("statusMsg");
        String errorMessage = (String)session.getAttribute("errorMessage");
        String enteredUsername = (String)session.getAttribute("enteredUsername");
        if(statusMsg != null){
        %>
        <div><%= statusMsg %></div> 
        <%
            session.removeAttribute("statusMsg");
            }
        %>

        <div class="mainBody mt-5" >
            <div class="loginCard container">
                <div class="card" style="width: 50%; border: 2px #FFBE00 solid">
                    <h5 class="card-header yellow_black" >Customer Login page</h5>
                    <div class="card-body" style="background-color: #25182E">
                        <form action="<%=request.getContextPath()%>/Login">
                            <h5 class="card-title" style="color: #FFBE00;">Welcome, please enter your:</h5>
                            <div class="input-group mb-3" style="border: 2px #FFBE00 solid; border-radius: 8px">
                                <span class="input-group-text yellow_black" id="basic-addon1">Username</span>
                                <input type="text" name="username" value="<%= (enteredUsername==null)?"":enteredUsername %>" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3" style="border: 2px #FFBE00 solid; border-radius: 8px">
                                <span class="input-group-text yellow_black" id="basic-addon1">Password</span>
                                <input type="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1">
                            </div>
                            <div class="d-flex justify-content-center">
                                <input class="btn me-2 yellow_black" type="submit" value="Sign In" >
                                <input class="btn resetBtnColor" type="reset" value="Reset" style="background-color: #CA1F3D; color: #FFFFFF; border: 2px #CA1F3D solid">                              
                            </div>
                        </form>
                        <% if(errorMessage != null) { %>
                        <div class="error-message mt-3" style="color: red; text-align: center">
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
                    <div class="text-center" style="background-color: #FFBE00">
                        <p>Don't have an account ?<br><a href="register.jsp">Sign Up</a></p>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="layout/footer.jsp"%>        
    </body>
</html>
