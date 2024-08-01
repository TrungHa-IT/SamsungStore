<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/detail.css"/>
        <style>
            /* General navbar enhancements */
            .navbar-dark.bg-dark {
                background-color: #343a40 !important; /* Dark shade */
            }

            .navbar-brand, .nav-link {
                font-size: 1.5rem; /* Larger font size for brand and links */
                font-weight: 300; /* Slightly bolder */
            }

            /* Adjusts size for navbar toggler icon */
            .navbar-toggler {
                font-size: 1.5rem;
                border: none;
            }

            .navbar-toggler-icon {
                background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23FFF' viewBox='0 0 30 30'%3e%3cpath stroke='rgba(255, 255, 255, 0.5)' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
            }

            /* Search box and buttons */
            .form-control {
                font-size: 1.5rem; /* Bigger font in search box */
            }

            .btn {
                font-size: 1.5rem; /* Bigger text on buttons */
            }

            /* Cart badge adjustments */
            .badge {
                font-size: 1.5rem; /* Adjust as needed */
            }
            .table .table-striped .table-hover {
                width: 100%;
                max-width: 100%;
            }

            .table th, .table td {
                text-align: center; /* Canh giữa nội dung của bảng */
                vertical-align: middle; /* Đảm bảo nội dung được căn giữa theo chiều dọc */
            }

            /* Điều chỉnh hình ảnh sản phẩm */
            .table img {
                width: 120px; /* Đặt chiều rộng cố định cho hình ảnh */
                height: auto; /* Tự động điều chỉnh chiều cao để giữ tỷ lệ */
                border-radius: 5px; /* Tạo viền bo tròn nhẹ cho hình ảnh */
            }

            /* Điều chỉnh kích thước và cách thức hiển thị của các nút */
            .table .edit, .table .delete {
                font-size: 2.0rem; /* Tăng kích thước icon */
                margin: 0 5px; /* Thêm khoảng cách giữa các nút */
            }
            .table .thead-dark th {
                font-size: 1.1rem; /* Increase font size in table header */
            }

            .table td, .table th {
                padding: .75rem; /* Adjust padding as needed */
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }

            .table td {
                font-size: 1.5rem; /* Increase font size for table data */
            }

            /* Specific adjustments */
            .table td.product-name, .table td.product-price {
                font-weight: bold; /* Make product name and price bolder */
                font-size: 1.5rem; /* Slightly larger font size for product name and price */
            }

            .table td.product-actions {
                font-size: 1.5rem; /* Adjust action icons size if necessary */
            }

        </style>

    </head>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="home">SamSung Store</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                <ul class="navbar-nav m-auto">
                    <c:if test="${sessionScope.account.getRole()==2}">
                        <li class="nav-item">
                            <a class="nav-link" href="adminaccount">Manager Account</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="manager">Manager Products</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="category">Manager Categories</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.account.getRole()==0}">
                        <li class="nav-item">
                            <a class="nav-link" href="adminaccount">View Account</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="manager">Manager Products</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="category">Manager Categories</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.account != null}">
                        <li class="nav-item">
                            <a class="nav-link" href="account?name=${sessionScope.account.getUsername()}">Hello ${sessionScope.account.getUsername()}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="login?lg=2">Logout</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.account == null}">
                        <li class="nav-item">
                            <a class="nav-link" href="login?lg=1">Login</a>
                        </li>
                    </c:if>
                </ul>

                <form action="searchcategory" method="post" class="form-inline my-2 my-lg-0">
                    <div class="input-group input-group-sm">
                        <input name="usersearch" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                        <div class="input-group-append">
                            <button type="submit" value="Search" class="btn btn-secondary btn-number">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                    <a class="btn btn-success btn-sm ml-3" href="Cart.jsp">
                        <i class="fa fa-shopping-cart"></i> Cart
                        <span class="badge badge-light">${sessionScope.size}</span>
                    </a>
                </form>
            </div>
        </div>
    </nav>
    <section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading">SamSung Store</h1>
            <p class="lead text-muted mb-0">Do what you can’t</p>
        </div>
    </section>
    <!--end of menu-->
    
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Categories</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Catogory</span></a>
                        </div>
                    </div>
                </div>
                <h4 style="color: red">${requestScope.exist}</h4>
                <c:if test="${requestScope.success} != null">
                    <h4 style="color: greenyellow">${requestScope.success}</h4>
                </c:if>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.categories}" var="c">
                            <tr>
                                <td>${c.getCategoryID()}</td>
                                <td>${c.getCategoryName()}</td>
                                <td>${c.getDescription()}</td>
                                <td>
                                    <a href="editcategory?edit=${c.getCategoryID()}"  class="edit" ><i class="material-icons"  title="Edit">&#xE254;</i></a>
                                    <a href="deletecategory?delete=${c.getCategoryID()}" class="delete" data-toggle="modal" onclick="confirmDelete(${c.getCategoryID()})">
                                        <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                            <c:forEach items="${requestScope.searchcategory}" var="c">
                            <tr>
                                <td>${c.getCategoryID()}</td>
                                <td>${c.getCategoryName()}</td>
                                <td>${c.getDescription()}</td>
                                <td>
                                    <a href="editcategory?edit=${c.getCategoryID()}"  class="edit" ><i class="material-icons"  title="Edit">&#xE254;</i></a>
                                    <a href="deletecategory?delete=${c.getCategoryID()}" class="delete" data-toggle="modal" onclick="confirmDelete(${c.getCategoryID()})">
                                        <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Showing <b>1</b> out of <b>${requestScope.endpage}</b> entries</div>
                    <ul class="pagination">
                        <c:forEach begin="1" end="${requestScope.endpage}" var="i">
                            <li class="page-item"><a href="crudcategory?index=${i}" class="page-link">${i}</a></li>
                            </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="crudcategory" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add new Category</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Category Name:</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Category Description:</label>
                                <input name="description" type="text" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <textarea class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" class="form-control" required>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
            <script src="js/manager.js" type="text/javascript"></script><script src="js/manager.js" type="text/javascript"></script>
            <script>
                                        function confirmDelete(categoryID) {
                                            var confirmation = confirm("Do you want to delete the category?");

                                            if (confirmation) {
                                                // If the user confirms, navigate to the delete URL
                                                window.location.href = "deletecategory?delete=" + categoryID;
                                            } else {
                                                // If the user cancels, do nothing or provide feedback
                                                console.log("Deletion canceled");
                                            }
                                        }
            </script>
    </body>
</html>