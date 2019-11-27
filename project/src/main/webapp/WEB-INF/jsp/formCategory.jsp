<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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

<style>
#rightContent {

}
.error{
color: red;
}

#rightContent h3 {
	font-size: 20px;
	font-weight: normal;
	padding: 0;
	margin: 5px;
	border-bottom: 1px dashed #dcdcdc;
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<jsp:include page="admin/header.jsp" />

		<jsp:include page="admin/sidebar.jsp" />

		
				
		<div class="content-wrapper">
		<h3>Thêm danh mục mới</h3>
			<div class="">
					<div class="main-login main-center">
						<form:form class="form-horizontal" action="addCategory" method="post" modelAttribute="categoryForm">
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label" for="confirm_password">Tên danh mục</label>
									<div class="col-md-5">
										<form:input type="text" class="form-control name" path="name"/>
										<form:errors path="name" cssClass="error" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-2 control-label" for="gender">Mô tả</label>
									<div class="col-md-5">
										<form:textarea rows="15" class="form-control des" path="description"/> 									
										<form:errors path="description" cssClass="error" />
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
						</form:form>
					</div>
				</div>
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
	<!-- page script -->
	<script>
	$(document).ready(function() {
		activeMenu('.cate');
	});
	
	function back() { window.history.back(); }
	
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
