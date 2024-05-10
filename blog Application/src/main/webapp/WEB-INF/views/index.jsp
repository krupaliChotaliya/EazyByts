<%@ page import="com.blog.app.Model.Blog" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .textStyle {
            margin: 5px;
            font-weight: bold;
            font-size: 18px;
        }

        .content {
            margin-top: 3px;
            margin-left: 2px;
            font-size: 16px;
        }
        
        .blog-container-outside {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .blog-container {
            width: 400px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 20px;
        }

        .image {
            width: 100%;
            height: 200px;
            overflow: hidden;
        }

        .image img {
            width: 100%;
            height: 100%;
            object-fit: contain;
            vertical-align: middle;
        }

        .blog-content {
            padding: 15px;
        }
    </style>
    <title>Home</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container-fluid">
    <div class="blog-container-outside">
        <% List<Blog> blogs = (List<Blog>) request.getAttribute("blogs");
            if (blogs != null) {
                for (Blog blog : blogs) { %>
        <div class="blog-container">
            <div class="image">
                <img src="${pageContext.request.contextPath}/image/<%= blog.getImage() %>" alt="Image">
            </div>
            <div class="blog-content">
                <div class="textStyle">
                    <%= blog.getTitle() %>
                </div>
                <div class="content">
                    <% String[] contentWords = blog.getContent().split("\\s+"); %>
                    <% if (contentWords.length > 15) { %>
                    <%= String.join(" ", Arrays.copyOfRange(contentWords, 0, 15)) %>
                    <% } else { %>
                    <%= blog.getContent() %>
                    <% } %>
                    <a class="" href="/blogs/blog/<%= blog.getId() %>">More..</a>
                </div>
            </div>
        </div>
        <% }
        } else { %>
        <div class="col">
            <p>No blogs found.</p>
        </div>
        <% } %>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
