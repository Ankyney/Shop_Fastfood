<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="IE=edge">
<title>Quản lý Sản Phẩm</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="static/admin/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet" href="static/admin/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet" href="static/admin/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="static/admin/css/skins/_all-skins.min.css">

<link rel="stylesheet" href="static/css/bootstrap-datepicker.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<jsp:include page="admin/header.jsp" />

		<jsp:include page="admin/sidebar.jsp" />

		<div class="content-wrapper">
		
		

			<!-- Main content -->
			<h3>Cập nhật sản phẩm</h3>
			${message}
				<form class="form-horizontal" action="saveChangeProduct" name="productForm" method="post" enctype="multipart/form-data">
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label" for="id">Mã Sản Phẩm:</label>
									<div class="col-md-5">
										<input type="text" class="form-control id" name="id" value="${productForm.id}">
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-2 control-label" for="category.id">Danh Mục:</label>
									<div class="col-md-5">
										<select  class="form-control id" name="category.id" >
											<c:forEach items="${Categories}" var="c">
												<c:if test="${c.id != productForm.category.id}"> <option value="${c.id}" > ${c.name} </option> </c:if>
												<c:if test="${c.id == productForm.category.id}"> <option selected value="${c.id}" > ${c.name} </option> </c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label" for="brand.id">Nhãn Hiệu:</label>
									<div class="col-md-5">
										<select  class="form-control id" name="brand.id" >
											<c:forEach items="${brands}" var="b">
												<c:if test="${b.id != productForm.brand.id}"> <option value="${b.id}" > ${b.name} </option> </c:if>
												<c:if test="${b.id == productForm.brand.id}"> <option selected value="${b.id}" > ${b.name} </option> </c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">Tên Sản Phẩm:</label>
									<div class="col-md-5">
										<input type="text" class="form-control name" name="name" value="${productForm.name}">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label" for="price">Đơn giá:</label>
									<div class="col-md-5">
										<input type="text" class="form-control price" name="price" value="${productForm.price}" />
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label" for="quantity">Số Lượng :</label>
									<div class="col-md-5">
										<input type="text" class="form-control quantity" name="quantity" value="${productForm.quantity}">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label" for="date">Ngày Nhập:</label>
									<div class="col-md-5 " style="display: table;">
										<input type="text" data-date-format="dd/mm/yyyy" name="date" class="form-control date" value="${productForm.date}" style="display: table-cell;">
										<span class="input-group-addon" style="display: table-cell;">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
									</div>
								</div>
					
								<div class="form-group">
									<label class="col-md-2 control-label" for="file_image">Thêm Hình Ảnh:</label>
									<div class="col-md-5">
										<input type="file" class="file_image" name="file_image">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label" for="image">Hình Ảnh:</label>
									<div class="col-md-5">
										<input type="text" name="image" class="image" value="${productForm.image}"/>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label" for="description">Mô tả</label>
									<div class="col-md-5">
										<textarea rows="15" class="form-control des" name="description">${productForm.description}</textarea>
									</div>
								</div>

								<!-- Button -->
								<div class="form-group">
									<label class="col-md-2 control-label" for="submit"></label>
									<div class="col-md-4">
										<button type="submit" class="btn btn-info">Lưu</button>
										<button type="button" class="btn btn-danger" onclick="back()">Quay Lại</button>
									</div>
								</div>
							</fieldset>
						</form>
						
			
			
			<!-- /.content -->
		</div>
		
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.2.0 -->
	<script src="static/admin/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="static/admin/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script src="static/admin/datatables/jquery.dataTables.min.js"></script>
	<script src="static/admin/datatables/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script src="static/admin/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="static/admin/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="static/admin/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="static/admin/js/demo.js"></script>
	
	<script src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- page script -->
	<script>
	function back() { window.history.back(); }
	
		$(document).ready(function() {
			$('.file_image').change(function(e) {
				var name = e.target.files[0].name;
				if (name) {
					$('.image').val('static/images/prod/' + name);
				}
				
			});	
		});
		
		$(document).ready(function() {
			$('.date').datepicker();
			activeMenu('.prod');
		});
		
		$(function() {
			$("#example1").DataTable();
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false
			});
		});
	</script>
</body>
</html>
