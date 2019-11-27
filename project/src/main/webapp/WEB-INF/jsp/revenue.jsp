<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Quản lý thống kê</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="static/admin/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="static/admin/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet" href="static/admin/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="static/admin/css/skins/_all-skins.min.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="admin/header.jsp" />

		<jsp:include page="admin/sidebar.jsp" />

		<div class="content-wrapper">
			<div class="tab-pane" id="control-sidebar-stats-tab">
				<div class="chart-container"
					style="position: relative; height: 40vh; width: 70vw;color:#ff0000";>
					<canvas id="chart"></canvas>
				</div>
			</div>
		</div>
		<footer
			style="border-top: 1px solid #d2d6de; text-align: center; background: #fff; color: #444; height: 60px; line-height: 60px;">
			<strong>Copyright &copy; 2019 | <a href="#">Vi Văn Tiến</a>
			</strong>
		</footer>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
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
		function draw() {
			var cb = function(datas) {

				var ctx = document.getElementById("chart").getContext('3d');
				var myChart = new Chart(ctx, {
					type : 'bar',
					data : {
						labels : [ "Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4",
								"Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9",
								"Tháng 10", "Tháng 11", "Tháng 12" ],
						datasets : [ {
							label : 'Thống kế số tiền bán được theo tháng',
							data : datas
						} ]
					},
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true
								}
							} ]
						}
					}
				});
			}

			$.ajax({
				url : "revenueByMonth",
				type : "GET",
				contentType : "application/json",
				success : cb,
				error : function(jqXHR, status, errorThrown) {
					console.log(errorThrown);
				}
			});
		}
		$(document).ready(function() {
			activeMenu('.revenue');
			draw();
		});
	</script>
</body>
</html>