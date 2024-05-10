<nav class="navbar navbar-expand-lg navbar-dark bg-dark" >
    <a class="navbar-brand"  href="/" ><span style="color:#4CAF50;">B</span>logger</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link active" href="/blog/myblog">My Blog</a>
            </li>
            <% String authenticated = null;
                HttpSession httpSession1 = (HttpSession)
                        request.getSession(false);
                if (httpSession1 != null &&
                        httpSession1.getAttribute("userId") != null) {
                    authenticated = httpSession1.getAttribute("userId").toString();
                }
                if
                (authenticated == null) { %>
            <li class="nav-item">
                <a class="nav-link active" href="/login">login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="/register">Register</a>
            </li>
            <% } %>
            <li class="nav-item">
                <a class="nav-link active" href="/blog">Add Blog</a>
            </li>
            <% String userId = null;
                HttpSession httpSession = (HttpSession)
                        request.getSession(false);
                if (httpSession != null &&
                        httpSession.getAttribute("userId") != null) {
                    userId = httpSession.getAttribute("userId").toString();
                }
                if (userId != null) {
            %>
            <li class="nav-item">
                <a class="nav-link active" href="/logout">logout</a>
            </li>
            <% } %>

            <% String role = null;
                if (httpSession != null &&
                        httpSession.getAttribute("role") != null) {
                    role = httpSession.getAttribute("role").toString();
                }
                if (role != null
                        && role.equals("admin")) { %>
            <li class="nav-item">
                <a class="nav-link active" href="/dashboard/users">Admin
                    DashBoard</a>
            </li>
            <% } %>
        </ul>
        <form method="post" class="search-form d-flex" action="${pageContext.request.contextPath}/blogs/search">
            <input class="form-control mr-1" type="search" placeholder="Search" aria-label="Search"
                   name="keyword">
            <button class="btn btn-success" type="submit">Search</button>
        </form>
    </div>
</nav>
