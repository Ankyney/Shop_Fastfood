<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<link href="static/css/loginadm.css" rel="stylesheet">

<script type="text/javascript">
function post(url, data, cb1){
	$.ajax({
		url : url,
		type : "POST",
		data : data,
		contentType : "application/json",
		success : cb1,
		error : function(jqXHR, status, errorThrown) {
			console.log(errorThrown);
		}
	});
}

function admlogin() {
	var data = JSON.stringify({
		"username" : $('.usn').val(),
		"password": $('.pwd').val()
	});
	
	var cb = function(data) {
		if (data == 200){
			window.location = "/admin";	
		} else {
			alert("Đăng nhập thất bại")
		}
		
	}
	
	post("/admin/submit", data, cb)
}
</script>
</head>
<body>
<div class="login-admin">
	<div class="bird-container bird-container--one">
		<div class="bird bird--one"></div>
	</div>
	
	<div class="bird-container bird-container--two">
		<div class="bird bird--two"></div>
	</div>
	
	<div class="bird-container bird-container--three">
		<div class="bird bird--three"></div>
	</div>
	
	<div class="bird-container bird-container--four">
		<div class="bird bird--four"></div>
	</div>
	
<div class=form-login>
	<h2 style="text-align: center;">Login Form</h2>
		<form>
	  <div class="container">
	    <label for="uname"><b>Username</b></label>
	    <input type="text" class="usn" placeholder="Enter Username" name="uname" required>
	
	    <label for="psw"><b>Password</b></label>
	    <input type="password" class="pwd" placeholder="Enter Password" name="psw" required>
	        
	    <button type="button" class="btn btn-info" onclick="admlogin()" >Login</button>
	  </div>
	</form>
</div>
</div>
</body>
</html>
