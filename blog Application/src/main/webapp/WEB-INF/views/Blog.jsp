<%@ page import="com.blog.app.Model.Blog" %>
<%@ page import="java.util.Optional" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog Details</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom CSS -->
    <style>
        .blog-card {
            border: none;
            margin-bottom: 30px;
            border-radius: 10px;
            transition: transform 0.3s;
        }

        .textStyle {
            font-weight: bold;
            font-size: 15px;
        }

        .card-img-top {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            object-fit: scale-down;
            height: 300px;
            width: 100%;
        }

        .card-body {
            padding: 20px;
        }

        .blog-title {
            font-weight: bold;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .blog-details {
            font-size: 16px;
            color: #6c757d;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="container mt-4">
    <div class="row justify-content-center">
        <% Optional<Blog> blog = (Optional<Blog>) request.getAttribute("blog");
            if (blog.isPresent()) { %>
        <div class="col-md-8">
            <div class="card blog-card shadow">
                <img src="${pageContext.request.contextPath}/image/<%= blog.get().getImage() %>" class="card-img-top"
                     alt="Image">
                <div class="card-body">
                    <h5 class="card-title blog-title"><%= blog.get().getTitle() %>
                    </h5>
                    <p class="card-text"><%= blog.get().getContent() %>
                    </p>
                    <div class="blog-details">
                        <p class="card-text"><span
                                class="textStyle">Category </span> <%= blog.get().getCategoryId().getName() %>
                        </p>
                        <p class="card-text"><span
                                class="textStyle">Author</span> <%= blog.get().getUser().getUsername() %>
                        </p>
                        <p class="card-text"><span class="textStyle">Created At </span> <%= blog.get().getCreatedAt() %>
                        </p>
                        <p class="card-text"><span class="textStyle">Updated At </span> <%= blog.get().getUpdatedAt() %>
                        </p>
                    </div>
                    <a href="${twitterLink}" target="_blank" class="btn btn-sm btn-primary mr-2 mt-3"><i
                            class="fab fa-twitter"></i> Twitter</a>
                    <a href="${linkedInLink}" target="_blank" class="btn btn-sm btn-primary mt-3"><i
                            class="fab fa-linkedin"></i> LinkedIn</a>
                </div>
            </div>
        </div>
        <% } else { %>
        <div class="col">
            <p>No blogs found.</p>
        </div>
        <% } %>
    </div>
</div>

<!-- Bootstrap JS dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>



