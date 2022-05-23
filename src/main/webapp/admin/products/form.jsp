<%@ page import="com.example.crudphone.entity.Product" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.crudphone.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: xuanhung
  Date: 5/12/22
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Product obj = (Product) request.getAttribute("obj");
    List<Category> categories = (List<Category>) request.getAttribute("categories");
    if(categories == null) {
        categories = new ArrayList<>();
    }
    int action = (int) request.getAttribute("action");
    HashMap<String, String> errors = (HashMap<String, String>) request.getAttribute("errors");
    String url = "/admin/products/create";
    if(action == 2){
        url = "/admin/products/edit";
    }
    if(errors == null){
        errors = new HashMap<>();
    }
%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../includes/head.jsp"></jsp:include>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <jsp:include page="../includes/navbar.jsp"></jsp:include>

    <!-- Main Sidebar Container -->
    <jsp:include page="../includes/sidebar.jsp"></jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Product management</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="/admin/products/list">Product Management</a></li>
                            <li class="breadcrumb-item active">Create new</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <%
                    if(errors != null && errors.size() > 0){
                %>
                <div class="row">
                    <div class="col-12">
                        <div class="callout callout-danger">
                            <h5>Please fix error below</h5>
                            <ul>
                            <%
                                for (String msg: errors.values()){
                            %>
                                <li class="text-danger"><%=msg%></li>
                            <%
                                }
                            %>
                            </ul>
                        </div>
                    </div>
                </div>
                <%}%>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-warning">
                            <div class="card-header">
                                <h3 class="card-title">Please enter information below</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <form action="<%=url%>" method="post">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <!-- text input -->
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input type="text" name="name" value="<%=obj.getName()%>" class="form-control" placeholder="Please enter product's name">
                                                <%if(errors.containsKey("name")){%>
                                                    <span class="text-danger">* <%=errors.get("name")%></span>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-4">
                                            <!-- select -->
                                            <div class="form-group">
                                                <label>Select</label>
                                                <select name="categoryId" class="form-control">
                                                    <%
                                                        for(int i = 0; i < categories.size(); i++) {
                                                      %>
                                                    <option value="<%=categories.get(i).getId()%>"><%=categories.get(i).getName()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="card-body">
                                        <form action="<%=url%>" method="post">
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <!-- text input -->
                                                    <div class="form-group">
                                                        <label>Price</label>
                                                        <input type="text" name="price" value="<%=obj.getPrice()%>" class="form-control" placeholder="Please enter product's price">
                                                        <%if(errors.containsKey("price")){%>
                                                        <span class="text-danger">* <%=errors.get("price")%></span>
                                                        <%}%>
                                                    </div>
                                                </div>
                                            </div>


                                    <div class="row">
                                        <div class="col-sm-6">
                                            <!-- text input -->
                                            <div class="form-group">
                                                <label>Description</label>
                                                <input type="text" name="description" value="<%=obj.getDescription()%>" class="form-control" placeholder="Please enter product's description">
                                                <%if(errors.containsKey("description")){%>
                                                    <span class="text-danger">* <%=errors.get("description")%></span>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Thumbnail</label>
                                                <input type="text" name="thumbnail" value="<%=obj.getThumbnail()%>" class="form-control" placeholder="Please enter product's thumbnail">
                                                <%if(errors.containsKey("thumbnail")){%>
                                                    <span class="text-danger">* <%=errors.get("thumbnail")%></span>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Detail</label>
                                                <input type="text" name="detail" value="<%=obj.getDetail()%>" class="form-control" placeholder="Please enter product's detail">
                                                <%if(errors.containsKey("detail")){%>
                                                    <span class="text-danger">* <%=errors.get("detail")%></span>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <button class="btn btn-primary">Save</button>
                                                <input type="reset" class="btn btn-default" value="Reset">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <jsp:include page="../includes/footer.jsp"></jsp:include>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<jsp:include page="../includes/script.jsp"></jsp:include>
<script>
    document.addEventListener('DOMContentLoaded', function (){
        $('#reservationdate').datetimepicker({
            format: 'YYYY-MM-DD'
        });
    })
</script>
</body>
</html>