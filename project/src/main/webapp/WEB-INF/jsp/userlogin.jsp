<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>
	<!-- header -->
	<jsp:include page="website/header.jsp" />
	<!-- header -->
<script type="text/javascript">
var USER = 1;
function smlogin() {
	var data = JSON.stringify({
		"username": $('#l_username').val(),
		"password": $('#l_password').val()
	})
	
	var cb = function(data) {
		switch(data) {
		case LOGIN_FAILED: 
			var mess = $('#l_message')
			mess.text('Thông tin đăng nhập không chính xác');
			setTimeout(function(){
				mess.text('');
			}, 1000);
			break;
		case USER: window.location = "/home";	
		}
	}
	
	post("/user/login", data, cb);
}

function smregister() {
	
	var data = JSON.stringify({
		"username": $('#username').val(),
		"password": $('#password').val(),
		"name": $('#name').val(),
		"address": $('#address').val(),
		"email": $('#email').val(),
		"phone": $('#phone').val()
	})
	
	var cb = function(data) {
		if (data == -9) {
			alert("User đã tồn tại")
		} else if (data > 0) {
			window.location = "/home"
		} else {
			alert("Đăng ký thất bại, xin thử lại sau.")
		}
	}
	
	post("/user/registry", data, cb);
	
}
</script>
	<div class="address">
		<div class="container">
			<div class="address-row">
				<div class="col-md-12 address-left wow fadeInLeft animated"
					data-wow-delay=".5s">
					<div class="address-grid">
						<div id="AUTODIV_accountuserloginphtml">
							<!-- main content -->
							<div class="main-content account-content account-height ">
								<div class="styled-content login-register">
									<div class="col-login" style=" color: #ff590f;margin: auto;width: 50%;">
										<h2 class="mb-2">Login</h2>

										<div id="forms-container-LOGIN">
											<form name="login" id="login" class="login">
												<div class="form-group required has-feedback">
												<label for="" class="control-label">Email</label>
												<input name="l_username" data-error="Must be a valid username" id="l_username" class="form-control" required>
											</div>
											<div class="form-group required has-feedback">
												<label class="control-label">Password</label>
												<input name="l_password" data-error="Please fill in this field" id="l_password" class="form-control" required type="password">
											</div>
											<div class="form-group required has-feedback">
												<label id="l_message" style="color: red"> </label> 
											</div>
											<a id="login" class="btn btn-info site-btn wide" type="button" onclick="smlogin()"> Submit </a>
											<a id="btn-regis" class="btn btn-info site-btn wide" type="button" > Register</a>
											</form>
										</div>
									</div>
									<div class="col-register hidden" style="color: #ff590f;margin: auto;width: 50%;">
										
										<h2 class="mb-2">Register An Account</h2>
										<form name="login" id="login" class="login">
											<div class="form-group required has-feedback">
												<label for="username" class="control-label">User Name</label>
												<input name="username" data-error="Must be a valid username" id="username" class="form-control" required="">
											</div>
											<div class="form-group required has-feedback">
												<label for="password" class="control-label">Password</label>
												<input name="password" data-error="Please fill in this field" id="password" class="form-control" required="" type="password">
											</div>
											
											<div class="form-group required has-feedback">
												<label for="name" class="control-label">Full Name</label>
												<input name="name" data-error="Must be a valid username" id="name" class="form-control" required="">
											</div>
											<div class="form-group required has-feedback">
												<label for="mail" class="control-label">Email</label>
												<input name="mail" data-error="Must be a valid username" id="email" class="form-control" required="">
											</div>
											<div class="form-group required has-feedback">
												<label for="phone" class="control-label">Phone</label>
												<input name="phone" data-error="Must be a valid username" id="phone" class="form-control" required="">
											</div>
											<div class="form-group required has-feedback">
												<label for="address" class="control-label">Address</label>
												<input name="address" data-error="Must be a valid username" id="address" class="form-control" required="">
											</div>
											
											<div>
												
											</div>
											<a id="regis" class="btn btn-info site-btn wide" type="button" onclick="smregister()"> Submit </a>
											<a id="btn-login" class="btn btn-info site-btn wide" type="button"> Login</a>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--footer-->
	<jsp:include page="website/footer.jsp" />
	<!--footer-->

	<!--smooth-scrolling-of-move-up-->
	<script type="text/javascript">
		var LOGIN_FAILED = -1
	
		$(document).ready(function() {

			var defaults = {
				containerID : 'toTop', // fading element id
				containerHoverID : 'toTopHover', // fading element hover id
				scrollSpeed : 1200,
				easingType : 'linear'
			};

			$().UItoTop({
				easingType : 'easeOutQuart'
			});
			
			var sr = $('#btn-regis');
			sr.click(function(e) {
				$('.col-register').removeClass('hidden');
				$('.col-login').addClass('hidden');
			});
			
			var r = $('#regis');
			r.click(function(e) {
			});
			
			var l = $('#login');
			l.click(function(e) {
			});
			
			var sl = $('#btn-login');
			sl.click(function(e) {
				$('.col-login').removeClass('hidden');
				$('.col-register').addClass('hidden');
			});
		});
		
		
	</script>
	<!--//smooth-scrolling-of-move-up-->
	<!--Bootstrap core JavaScript
    ================================================== -->
	<!--Placed at the end of the document so the pages load faster -->
</body>
</html>