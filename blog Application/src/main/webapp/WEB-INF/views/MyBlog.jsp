<%@ page import="com.blog.app.Model.Blog" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        <%@include file="css/blog_list.css"%>
        .content {
            margin-top: 10px;
            font-size: 16px;
        }

        .card {
            height: 100%;
        }


        .card img {
            width: 100%;
            height: 100%;
            object-fit: fill;
            vertical-align: middle;
        }
    </style>
    <title>Home</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container py-5">
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <% List<Blog> blogs = (List<Blog>) request.getAttribute("blogs");
            if (blogs != null) {
                for (Blog blog : blogs) { %>
        <div class="col mb-4">
            <div class="card shadow-sm">
                <div class="card-image-container">
                    <img src="${pageContext.request.contextPath}/image/<%= blog.getImage() %>" class="card-img-top"
                         alt="...">
                </div>
                <div class="card-body">
                    <div class="my-3 d-flex justify-content-between">
                        <div class="user-info">
                            <span class="ms-2"><%= blog.getUser().getUsername() %></span>
                        </div>
                        <div class="dropdown">
                            <button class="svg-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <svg width="12" height="14" fill="currentColor" class="bi bi-three-dots-vertical"
                                     viewBox="0 0 16 16">
                                    <path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"></path>
                                </svg>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-light bg-light">
                                <li><a class="dropdown-item" href="/blogs/update?blogId=<%= blog.getId() %>">Update</a>
                                </li>
                                <li><a class="dropdown-item text-danger" href="/blogs/delete/<%= blog.getId() %>"
                                       onclick="return confirmDelete('<%= blog.getId() %>')">Delete</a></li>
                            </ul>
                        </div>
                    </div>
                    <h5 class="card-title"><%= blog.getTitle() %>
                    </h5>
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
        </div>
        <% }
        } else { %>
        <div class="col">
            <p>No blogs found.</p>
        </div>
        <% } %>
    </div>
</div>

<script>
    function confirmDelete(blogId) {
        return confirm("Are you sure you want to delete the blog " + blogId + "?");
    }
</script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<%--<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>--%>
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>--%>
</body>
</html>
