<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Blog</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>

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
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Blogger</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse d-flex justify-content-between" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="/blog/myblog">My Blog</a>
                </li>
                <% String authenticated=null; HttpSession httpSession1=(HttpSession)
                        request.getSession(false); if (httpSession1 !=null &&
                        httpSession1.getAttribute("userId") !=null) {
                    authenticated=httpSession1.getAttribute("userId").toString(); } if
                (authenticated==null) { %>
                <li class="nav-item">
                    <a class="nav-link active" href="/login">login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/register">Register</a>
                </li>
                <% } %>

                <% String userId=null; HttpSession httpSession=(HttpSession)
                        request.getSession(false); if (httpSession !=null &&
                        httpSession.getAttribute("userId") !=null) {
                    userId=httpSession.getAttribute("userId").toString(); } if (userId !=null) {
                %>
                <li class="nav-item">
                    <a class="nav-link active" href="/logout">logout</a>
                </li>
                <% } %>
                <li class="nav-item">
                    <a class="nav-link active" href="/blog">Add Blog</a>
                </li>
                <% String role=null; if (httpSession !=null &&
                        httpSession.getAttribute("role") !=null) {
                    role=httpSession.getAttribute("role").toString(); } if (role !=null
                        && role.equals("admin")) { %>
                <li class="nav-item">
                    <a class="nav-link active" href="/dashboard/users">Admin
                        DashBoard</a>
                </li>
                <% } %>
            </ul>
            <form method="post" class="search-form d-flex" action="${pageContext.request.contextPath}/blogs/search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                       name="keyword">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
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
        <%--@elvariable id="blog" type=""--%>
        <form:form modelAttribute="blog" action="/blogs/update" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="id">Id:</label>
                <form:input path="id" class="form-control" readonly="true" required="true"/>
            </div>
            <div class="form-group">
                <label for="title">Title:</label>
                <form:input path="title" class="form-control" required="true"/>
            </div>
            <div class="form-group">
                <label for="content">Content:</label>
                <form:textarea path="content" class="form-control" rows="5" required="true"></form:textarea>
            </div>
            <div class="form-group">
                <label>Category:</label>
                <form:select path="categoryId" class="form-control">
                    <form:options items="${categories}" itemValue="id" itemLabel="name"/>
                </form:select>
            </div>
            <div class="form-group">
                <label>Image:</label>
                <input type="file" name="imagePath" class="file" id="imagePicker" required="true">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form:form>
            <div id="imageContainer" style="margin-top: 20px;">
                <img id="selectedImage" src="" alt="" style="max-width: 100%; height: auto;">
            </div>
    </div>
</div>
<!-- Bootstrap JS dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    document.getElementById('imagePicker').addEventListener('change', function(e) {
        const file = e.target.files[0];
        const reader = new FileReader();
        reader.onload = function(event) {
            const imageUrl = event.target.result;
            document.getElementById('selectedImage').src = imageUrl;
        }
        reader.readAsDataURL(file);
    });
</script>
</body>
</html>
