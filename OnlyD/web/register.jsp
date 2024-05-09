<%@page import="entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>        
    </head>
    <body>
        <%@include file="layout/header.jsp"%>

        <%
            String errorMessage = (String)session.getAttribute("errorMessage");
            String enteredName = (String)session.getAttribute("enteredName");
            String enteredEmail = (String)session.getAttribute("enteredEmail");
            String enteredUsername = (String)session.getAttribute("enteredUsername");
            String enteredPhoneNumber = (String)session.getAttribute("enteredPhoneNumber");         
        %>

        <div class="mainBody mt-2" style="display: flex;
             align-content: center; flex-wrap: wrap">
            <div class="RegisterCard container">
                <div class="card card_deco" style="width: 50%">
                    <div class="card-header yellow_black">
                        <h1>Customer Register page</h1>
                    </div>
                    <div class="card-body">
                        <form action="Register" method="POST">
                            <h5 class="card-title">Welcome, please enter your:</h5>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">Name</span>
                                <input type="text" name="name" value="<%= (enteredName == null)?"":enteredName %>" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">Username</span>
                                <input type="text" name="username" value="<%= (enteredUsername == null)?"":enteredUsername %>" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">Phone Number</span>
                                <input type="tel" name="phoneNumber" value="<%= (enteredPhoneNumber == null)?"":enteredPhoneNumber %>"  pattern="[0-9]{3}-[0-9]{7}|[0-9]{2}-[0-9]{8}|[0-9]{3}-[0-9]{8}" placeholder="012-3456789" class="form-control" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">Email</span>
                                <input type="email" name="email" value="<%= (enteredEmail == null)?"":enteredEmail %>" class="form-control" placeholder="xxxx@gmail.com" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">Password</span>
                                <input type="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>                            
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">Re-enter Password</span>
                                <input type="password" name="rePassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="d-flex justify-content-center">
                                <input class="btn yellow_black me-2" type="submit" value="Register">
                                <input class="btn reset_dlt_btn" type="reset" value="Reset">                              
                            </div>
                        </form>
                        <% if(errorMessage != null){ %>
                        <div class="error-message" style="color: red;">
                            <%= errorMessage %>
                        </div>
                        <% }
                            session.removeAttribute("errorMessage");
                            session.removeAttribute("enteredName");
                            session.removeAttribute("enteredEmail");
                            session.removeAttribute("enteredUsername");
                            session.removeAttribute("enteredPhoneNumber");

                        %>
                    </div>
                    <div class="text-center">
                        <p>OR</p>
                        <p>Already have an account ?<br><a href="login.jsp">Sign In</a></p>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="layout/footer.jsp"%>
    </body>
</html>