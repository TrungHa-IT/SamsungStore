<%-- 
    Document   : detailaccount
    Created on : Mar 9, 2024, 2:06:55 AM
    Author     : hatrung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông Tin Tài Khoản</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <style>
            .container {
                margin-top: 20px;
            }
            h2 {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <jsp:include page="Menu.jsp"></jsp:include>
        <body>
            <h4 style="color: red">${requestScope.mess}</h4>
        <h4 style="color: red">${requestScope.mess1}</h4>
        <h4 style="color: greenyellow">${requestScope.mess2}</h4>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <form action="account" method="post">
                        <h4>Information User</h4>
                        <div class="form-group">
                            <label for="email">User name: </label>
                            <input type="email" class="form-control" id="email" value="${sessionScope.account.getUsername()}" readonly>
                        </div>

                        <h4>View Order</h4>
                        <div class="form-group">
                            <a href="orderdetails?name=${sessionScope.account.getUsername()}">View Order</a>
                        </div>

                        <c:if test="${sessionScope.account.getRole()==2}">
                            <h4>Statistic revenue</h4>
                            <div class="form-group">
                                <a href="year" >annual revenue</a>
                            </div>

                            <h4>Statistic of total orders in year </h4>
                            <div class="form-group">
                                <a href="countorder" >Total Order</a>
                            </div>
                            <h4>Statistic of average orders in month </h4>
                            <div class="form-group">
                                <a href="averageaccount" >Total Average</a>
                            </div>
                            <h4>Top 3 customers buy the most </h4>
                            <div class="form-group">
                                <a href="topcustomer" > Top 3 Customer</a>
                            </div>
                        </c:if>

                        <c:if test="${sessionScope.account.getRole()==0}">
                            <h4>Statistic revenue</h4>
                            <div class="form-group">
                                <a href="year" >annual revenue</a>
                            </div>

                            <h4>Statistic of total orders in year </h4>
                            <div class="form-group">
                                <a href="countorder" >Total Order</a>
                            </div>
                            <h4>Statistic of average orders in year </h4>
                            <div class="form-group">
                                <a href="averageaccount" >Total Average</a>
                            </div>
                            <h4>Top 3 customers buy the most </h4>
                            <div class="form-group">
                                <a href="topcustomer" > Top 3 Customer</a>
                            </div>
                        </c:if>


                        <h4>Change Password</h4>
                        <div class="form-group">
                            <label for="newPassword">Old password</label>
                            <input type="text" name="oldpass" class="form-control" id="newPassword">
                            <input type="hidden" name="user" value="${sessionScope.account.getUsername()}">
                        </div>
                        <div class="form-group">
                            <label for="newPassword">New password:</label>
                            <input type="text" name="pass" class="form-control" id="newPassword">
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">Repeat new password:</label>
                            <input type="text" name="repass" class="form-control" id="confirmPassword">
                        </div>

                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>