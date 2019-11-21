<%@ page pageEncoding="utf-8"%>

<script type="text/javascript">
function profile() {
	window.location.href = "/adm-profile"
}

function adm_signout() {
	var cb = function() {
		window.location = "/admin"
	}	
	
	$.ajax({
		url : "/admin/signout",
		type : "GET",
		contentType : "application/json",
		success : cb,
		error : function(jqXHR, status, errorThrown) {
			console.log(errorThrown);
		}
	});
}

</script>
<style>
label.btn.btn-default.btn-flat {
    background-color: #3c8dbc;
    border: 0px;
    margin-top: 5px;
}
img.user-image {
    max-width: 24px;
    background-color: #3c8dbc;
    /* color: wheat; */
}
</style>
<header class="main-header">
	<!-- Logo -->
	<a href="#" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini"><b>ST</b></span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>SHOP</b> TTH</span>
	</a>
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>

		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- Messages: style can be found in dropdown.less-->
				<!-- Notifications: style can be found in dropdown.less -->
				<!-- Tasks: style can be found in dropdown.less -->
				<!-- User Account: style can be found in dropdown.less -->
				<!-- <li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> 
						
						<button onclick="adm_signout()"  class="btn btn-default btn-flat"><img
						src="static/admin/img/out.png" class="user-image"
						alt="User Image"> </button>
						
				</a>
					<ul class="dropdown-menu">
					</ul></li> -->
					<li>
					<label onclick="adm_signout()"  class="btn btn-default btn-flat"><img
						src="static/admin/img/out.png" class="user-image"
						alt="User Image"> </label>
					</li>
				<!-- Control Sidebar Toggle Button -->
				<li><a href="#" data-toggle="control-sidebar"><i
						class="fa fa-gears"></i></a></li>
			</ul>
		</div>
	</nav>
</header>