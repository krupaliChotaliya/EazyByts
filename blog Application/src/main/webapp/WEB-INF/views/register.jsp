<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>
    <title>Home</title>
    <style>
        <%@include file="css/register.css"%>
    </style>
</head>
<body>

<div class="navbar">
    <h1><span>B</span>loggler</h1>
</div>
<!-- Display error message if it exists -->
<%
    String error = (String) request.getAttribute("error");
    if (error != null && !error.isEmpty()) {
%>
<div class="alert alert-danger"><%= error %></div>
<%
    }
%>
<div class="main-container">
    <div class="header">
        <h1><span>B</span>logger</h1>
    </div>
    <div class="container">
        <h2>Sign Up for a <span>B</span>logger ID</h2>
        <form method="post" action="/register">
            <input type="text" name="username" placeholder="Username">
            <input type="email" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" placeholder="Email Address">
            <input type="password" id="exampleInputPassword1" name="password" placeholder="Password">
            <input type="submit" value="Sign Up">
        </form>
    </div>
</div>
<%--<form class="container" method="post" action="/register">--%>
<%--    <div class="mb-3">--%>
<%--        <label  class="form-label">Username</label>--%>
<%--        <label>--%>
<%--            <input type="text" class="form-control" name="username">--%>
<%--        </label>--%>
<%--    </div>--%>
<%--    <div class="mb-3">--%>
<%--        <label for="exampleInputEmail1" class="form-label">Email address</label>--%>
<%--        <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp">--%>
<%--    </div>--%>
<%--    <div class="mb-3">--%>
<%--        <label for="exampleInputPassword1" class="form-label">Password</label>--%>
<%--        <input type="password" class="form-control" id="exampleInputPassword1" name="password">--%>
<%--    </div>--%>
<%--    <button type="submit" class="btn btn-primary">Submit</button>--%>
<%--</form>--%>

<%--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>--%>
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>--%>
</body>
</html>