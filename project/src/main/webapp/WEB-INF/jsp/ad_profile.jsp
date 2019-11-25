<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SHOP TTH</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, admin.scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="static/admin/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="static/admin/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="static/admin/css/skins/_all-skins.min.css">
<style>
.content-wrapper {
	position: relative;
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="admin/header.jsp" />
		<jsp:include page="admin/sidebar.jsp" />

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					<small>Thông tin Admin </small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Dashboard</li>
				</ol>
			</section>

			<section class="content">
				<div class="row">
					<div class="col-md-12 "
					data-wow-delay=".5s">
					<div class="address-grid">
						<div id="AUTODIV_accountadmin.oginphtml">
							<!-- main content -->
							<h3>Thông tin tài khoản</h3>
							<form class="form-horizontal" >
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label" for="name"><b>Tên người dùng</b></label>
									<div class="col-md-5">
										<input type="text" class="hidden form-control id" name="name" value="${admin.id}">
										<input type="text" class="form-control name" name="name" value="${admin.name}">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label" for="admin.ame"><b>Tên đăng nhập</b></label>
									<div class="col-md-5">
										<input type="text" disabled class="form-control username" name="admin.ame" value="${admin.username}">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label" for="email"><b>Email</b></label>
									<div class="col-md-5">
										<input type="text" class="form-control email" name="email" value="${admin.email}">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="phone"><b>Số điện thoại</b></label>
									<div class="col-md-5">
										<input type="text" class="form-control phone" name="phone" value="${admin.phone}">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="address"><b>Địa chỉ</b></label>
									<div class="col-md-5">
										<input type="text" class="form-control address_" name="address" value="${admin.address}">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="password"><b>Mật khẩu</b></label>
									<div class="col-md-5">
										<input type="password" class="form-control password" name="password" value="${admin.password}">
									</div>
								</div>
								
								<!-- Button -->
								<div class="form-group">
									<label class="col-md-2 control-label" for="submit"></label>
									<div class="col-md-4">
										<button type="button" onclick="updateadmin()" class="btn btn-info">Lưu</button>
										<button type="button" class="btn btn-danger" onclick="back()">Quay Lại</button>
									</div>
								</div>
							</fieldset>
						</form>
						</div>
					</div>
				</div>	
				</div>
				
			</section>



			<footer 
				style="border-top: 1px solid #d2d6de; text-align: center; background: #fff; color: #444; height: 60px; line-height: 60px;position: absolute;bottom: 0px; width: 100%">
				<strong>Copyright &copy; 2018 | <a href="#">Shop TTH</a>.
				</strong>
			</footer>
		</div>
	</div>
		<!-- jQuery 2.2.0 -->
		<script src="static/admin/jQuery/jQuery-2.2.0.min.js"></script>
		<!-- jQuery UI 1.11.4 -->
		<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
		<!-- Bootstrap 3.3.6 -->
		<script src="static/admin/js/bootstrap.min.js"></script>
		<!-- Sparkline -->
		<script src="static/admin/sparkline/jquery.sparkline.min.js"></script>
		<!-- jvectormap -->
		<!-- Bootstrap WYSIHTML5 -->
		<!-- Slimscroll -->
		<script src="static/admin/slimScroll/jquery.slimscroll.min.js"></script>
		<!-- FastClick -->
		<script src="static/admin/fastclick/fastclick.js"></script>
		<!-- AdminLTE App -->
		<script src="static/admin/js/app.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				activeMenu('.home');
			});
			
			function put(url, data, cb1){
				$.ajax({
					url : url,
					type : "PUT",
					data : data,
					contentType : "application/json",
					success : cb1,
					error : function(jqXHR, status, errorThrown) {
						console.log(errorThrown);
					}
				});
			}
			
			function updateadmin() {
				if ($(".phone").val() == "") {
					alert("Quý khách vui lòng điền số điện thoại")
					return;
				}
				
				if ($(".password").val() == "") {
					alert("Quý khách vui lòng điền mật khẩu")
					return;
				}
				
				var data = JSON.stringify({
					"id": $(".id").val(),
					"password": $(".password").val(),
					"name": $(".name").val(),
					"email": $(".email").val(),
					"address": $(".address_").val(),
					"phone": $(".phone").val(),
					"username": $('.username').val()
				});
				
				
				var cb = function() {
					window.location = "/admin";
				}
				
				put("/admin/update", data, cb);
			}
			
			function back() {
				window.history.back()
			}
		</script>
</body>
</html>