<%-- 
    Document   : adminLogin
    Created on : 24 Apr 2024, 5:41:36 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Boolean isStaff = (Boolean) session.getAttribute("isStaff");
    Boolean isCustomer = (Boolean) session.getAttribute("isCustomer");
    
    if(isStaff != null || isCustomer != null){
        request.getRequestDispatcher("/unauthorizedError.jsp").forward(request, response);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <%@include file="/layout/meta.html"%>

    </head>
    <body style="background-color: #25182E">
        <%@include file="/layout/header.jsp"%>  

        <div class="mainBody mt-5" style="display: flex;
             align-content: center; flex-wrap: wrap">
            <div class="loginCard container">
                <div class="card" style="width: 50%; border: 2px #FFBE00 solid">
                    <h5 class="card-header yellow_black">Admin Login page</h5>
                    <div class="card-body" style="background-color: #25182E">
                        <form action="j_security_check " method="POST">
                            <h5 class="card-title" style="color: #FFBE00;">Welcome, please enter your:</h5>
                            <div class="input-group mb-3" style="border: 2px #FFBE00 solid; border-radius: 8px">
                                <span class="input-group-text yellow_black" id="basic-addon1">Username</span>
                                <input type="text" name="j_username" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="input-group mb-3" style="border: 2px #FFBE00 solid; border-radius: 8px">
                                <span class="input-group-text yellow_black" id="basic-addon1">Password</span>
                                <input type="password" name="j_password" class="form-control" placeholder="xxxxxx" aria-label="Password" aria-describedby="basic-addon1" required> 
                            </div>
                            <div class="d-flex justify-content-center">
                                <input class="btn  me-2 yellow_black" type="submit" value="Log In">
                                <input class="btn " type="reset" value="Reset" style="background-color: #CA1F3D; color: #FFFFFF; border: 2px #CA1F3D solid">                              
                            </div>
                        </form>
                        <% if((String)session.getAttribute("errorMessage") != null) { %>
                        <div class="error-message" style="color: red;">
                            <%= (String)session.getAttribute("errorMessage") %>
                        </div>
                        <% 
                            session.removeAttribute("errorMessage");
                            } 
                        %>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
