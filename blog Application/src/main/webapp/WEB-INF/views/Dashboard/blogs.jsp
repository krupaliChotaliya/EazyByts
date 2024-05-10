<%@ page import="java.util.List" %>
<%@ page import="com.blog.app.Model.Blog" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <style>
        .card {
            border: none;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }

        body {
            background-color: #4CAF50;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Admin Dashboard</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/dashboard/users">Users</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/dashboard/category">Categories</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/dashboard/blogs">Blogs</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/logout">logout</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Main content -->
<div class="container mt-4 mb-4">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <h2>Blog Data</h2>
                    <a href="/blog">
                        <button class="btn btn-success mb-3" id="newCategoryBtn">New Blog</button>
                    </a>
                    <div class="table-responsive">
                        <table id="categoryTable" class="table table-striped table-bordered" style="width:100%">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Content</th>
                                <th>Image</th>
                                <th>Created_at</th>
                                <th>Updated_at</th>
                                <th>Author</th>
                                <th>Category</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% List<Blog> blogs = (List<Blog>) request.getAttribute("blogs");
                                if (blogs != null) {
                                    for (Blog blog : blogs) { %>
                            <tr>
                                <td><%= blog.getId() %>
                                </td>
                                <td>
                                    <div class="client">
                                        <div class="client-info">
                                            <h4><%= blog.getTitle() %>
                                            </h4>
                                        </div>
                                    </div>
                                </td>
                                <td><%= blog.getContent() %>
                                </td>
                                <td><%= blog.getImage() %>
                                </td>
                                <td><%= blog.getCreatedAt() %>
                                </td>
                                <td><%= blog.getUpdatedAt() %>
                                </td>
                                <td><%= blog.getUser().getUsername() %>
                                </td>
                                <td><%= blog.getCategoryId().getName() %>
                                </td>
                                <td>
                                    <a class="dropdown-item" href="/blogs/update?blogId=<%= blog.getId() %>">
                                        <button type="button" class="btn btn-primary btn-sm mr-2">Update</button>
                                    </a>
                                    <a class="dropdown-item" href="/blogs/delete/<%= blog.getId() %>"
                                       onclick="return confirmDelete('<%= blog.getId() %>')">
                                        <button type="button" class="btn btn-danger btn-sm mr-2">Delete</button>
                                    </a>
                                </td>
                            </tr>
                            <% }
                            }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

<script>
    $(document).ready(function () {
        $('#categoryTable').DataTable();
        $('#newCategoryBtn').click(function () {
            console.log("New Category button clicked");
        });
    });

    function confirmDelete(blogId) {
        return confirm("Are you sure you want to delete the blog " + blogId + "?");
    }
</script>
</body>
</html>
