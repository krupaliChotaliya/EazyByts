<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>


        /* Custom styles */
        .navbar {
            margin-bottom: 20px;
        }

        .alert {
            margin-top: 20px;
        }

        .container {
            margin-top: 50px;
        }

        @media (min-width: 576px) {
            .form-group textarea {
                resize: vertical;
            }
        }

        .blog-form {
            background-color: white;
            border: 1px solid #ced4da;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
            margin-bottom: 30px;
        }

        .blog-form:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .blog-heading {
            text-align: center;
            color: #000000;
            font-size: 28px;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<%
    String authorized = (String) session.getAttribute("userId");
    if (authorized == null || authorized.isEmpty()) {
        response.sendRedirect("/login");
        return;
    }
%>
<%
    String message = (String) request.getAttribute("message");
    System.out.println(message);
    if (message != null && !message.isEmpty()) {
%>
<div class="alert alert-danger"><%= message %>
</div>
<%
    }
%>
<div class="container">
    <h2 class="blog-heading">Update a Blog</h2>
    <div class="blog-form">
        <%--@elvariable id="user" type=""--%>
        <form:form modelAttribute="user" method="post">
            <div class="form-group">
                <label>Username:</label>
                <form:input path="username" class="form-control" required="true"/>
            </div>
            <div class="form-group">
                <label>Email:</label>
                <form:input path="email" class="form-control" rows="5" required="true"></form:input>
            </div>
            <div class="form-group">
                <label>Password:</label>
                <form:input type="password" path="password" name="password" class="form-control" rows="5"
                            required="true"></form:input>
            </div>
            <div class="form-group">
                <label>Role:</label>
                <label>
                    <form:select path="role">
                        <form:option value="normal">normal </form:option>
                        <form:option value="admin">admin</form:option>
                    </form:select>
                </label>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form:form>
    </div>
</div>
<!-- Bootstrap JS dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>