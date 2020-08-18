<%--
  Created by IntelliJ IDEA.
  User: Asif
  Date: 17-Aug-20
  Time: 8:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>welcome</h1>
<p>welcome to home</p>

<p>
    User: <security:authentication property="principal.username"/>

<br>

    Role: <security:authentication property="principal.authorities"/>
</p>
<hr>
<security:authorize access="hasRole('MANAGER')">

    <!-- Add a link to point to /leaders ... this is for the managers -->

    <p>
        <a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
        (Only for Manager peeps)
    </p>

</security:authorize>


<security:authorize access="hasRole('ADMIN')">

    <!-- Add a link to point to /systems ... this is for the admins -->

    <p>
        <a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
        (Only for Admin peeps)
    </p>

</security:authorize>

<hr>

<form:form action="${pageContext.request.contextPath}/logout"
           method="POST">

    <input type="submit" value="logout" />

</form:form>
</body>
</html>
