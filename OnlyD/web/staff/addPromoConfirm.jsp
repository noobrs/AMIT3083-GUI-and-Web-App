<%@include file="staffAuthentication.jsp"%>

<%@include file="/layout/header.jsp"%>
<div class="container mt-5">
    <div class="dashBoard">
        <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
            <h3>
                <%
                  String addPromoMsg = (String)session.getAttribute("addPromoMsg");
                  if (addPromoMsg != null)
                      out.println(addPromoMsg);
                      session.removeAttribute("addPromoMsg");
                %>
            </h3>
            <div style="display: flex; justify-content: center; flex-wrap: nowrap; margin:20px;">
                <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Dashboard</a>
                <a class="btn yellow_black me-2" href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Home</a>
            </div> 
        </div>
    </div>
</div>

<%@include file="/layout/footer.jsp"%>