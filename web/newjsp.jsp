<%-- 
    Document   : newjsp
    Created on : Mar 1, 2024, 9:47:55 PM
    Author     : hatrung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>${requestScope.datatest1}</p>
        <p>${requestScope.datatest2}</p>
        <p>${requestScope.datatest3}</p>
        <p>${requestScope.datatest4}</p>
        <p>${requestScope.datatest5}</p>
        <p>${requestScope.datatest6}</p>
        <p>${requestScope.datatest7}</p>
    </body>
</html>
