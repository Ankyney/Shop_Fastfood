<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>
	<!-- header -->
	<jsp:include page="website/header.jsp" />
	<!-- header -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('.phone').change(function(e){
				e.target.value = e.target.value.replace(/[^\d]/g, ''); 
			});
		});
		
		function updateuser() {
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
				window.location = "/home";
			}
			
			put("/user/update", data, cb);
		}
		
		function back() {
			window.history.back()
		}
		
		function cancel(id) {
			var cb = function() {
				window.location.reload(true)
			}
			
			get("/order/" + id + "/cancel", cb);
		}
	</script>
	<div class="address order">
		<div class="container">
			<div class="address-row">
				<div class="col-md-12 address-left wow fadeInLeft animated"
					data-wow-delay=".5s">
					<div class="address-grid">
						<div id="AUTODIV_accountuserloginphtml" style="color: #ff590f">
							<!-- main content -->
							<h3>Thông tin người dùng</h3>
							<form class="form-horizontal" >
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label" for="name"><b>Tên người dùng</b></label>
									<div class="col-md-5">
										<input type="text" class="hidden form-control id" name="name" value="${user.id}">
										<input type="text" class="form-control name" name="name" value="${user.name}">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label" for="username"><b>Tên đăng nhập</b></label>
									<div class="col-md-5">
										<input type="text" disabled class="form-control username" name="username" value="${user.username}">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label" for="email"><b>Email</b></label>
									<div class="col-md-5">
										<input type="text" class="form-control email" name="email" value="${user.email}">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="phone"><b>Số điện thoại</b></label>
									<div class="col-md-5">
										<input type="text" class="form-control phone" name="phone" value="${user.phone}">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="address"><b>Địa chỉ</b></label>
									<div class="col-md-5">
										<input type="text" class="form-control address_" name="address" value="${user.address}">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="password"><b>Mật khẩu</b></label>
									<div class="col-md-5">
										<input type="password" class="form-control password" name="password" value="${user.password}">
									</div>
								</div>
								
								<!-- Button -->
								<div class="form-group">
									<label class="col-md-2 control-label" for="submit"></label>
									<div class="col-md-4">
										<button type="button" onclick="updateuser()" class="btn btn-info">Lưu</button>
										<button type="button" class="btn btn-danger" onclick="back()">Quay Lại</button>
									</div>
								</div>
							</fieldset>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="address-row">
				<div class="col-md-12 address-left wow fadeInLeft animated"
					data-wow-delay=".5s">
					<div class="address-grid">
						<div id="AUTODIV_accountuserloginphtml" style="color: #ff590f">
							<!-- main content -->
							<div class="main-content account-content account-height ">
								<c:if test="${not empty orders}">
									<h3>Thông tin đơn hàng</h3>
								<table id="profile" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th width="25px">STT</th>
											<th>Ngày mua</th>
											<th>Số điện thoại</th>
											<th>Địa chỉ</th>
											<th>Hình thức thanh toán</th>
											<th>Trạng thái</th>
											<th>Tổng giá trị</th>
											<th>Lựa Chọn</th>
											
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${orders}" var="od" varStatus="loop">
											<tr>
												<td>${loop.index + 1}</td>
												<td><fmt:formatDate pattern="dd-MM-yyyy" value="${od.created}" /></td>
												<td>${od.phoneNumber}</td>
												<td>${od.address}</td>
												<td>${od.payment}</td>
												<td>
													<c:choose>
														<c:when test="${od.status == 1}">Đơn đang xử lý, hãy đợi trong giây lát</c:when>
														<c:when test="${od.status == 2}">Còn hàng, sẽ giao đến bạn sớm nhất</c:when>
														<c:when test="${od.status == 10}">Đơn đã giao thành công, cảm ơn bạn đã mua hàng</c:when>
														<c:when test="${od.status == -1}">Bạn đã hủy đơn hàng này mất rồi</c:when>
													</c:choose>
												
												
												</td>
												<td><fmt:formatNumber
													value="${od.total}" type="currency"
													currencySymbol="$" />
												</td>
												<td>
													<c:if test="${od.status == 1 || od.status == 2}">
														<button type="button" class="btn btn-danger" onclick="cancel(${od.status})">Hủy đơn hàng</button>
													</c:if>
												</td>
												
										
											</tr>
										</c:forEach>
									</tbody>
								</table>
								</c:if>
								<c:if test="${empty orders}">
									<h3>Quý khác chưa có đơn hàng nào</h3>
									<a href="/home" class="btn btn-danger"> Mua ngay</a>
								</c:if>
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