<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<style>
.hover-cart:hover {
	background-color: #ff590f;
}
</style>
<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<body>

	<!-- header -->
	<jsp:include page="website/header.jsp" />
	<!-- header -->
	<!-- content -->
	<div class="address">
		<!--address-->
		<div class="container">
			<div class="address-row">
				<div class="col-md-10 address-left wow fadeInLeft animated"
					data-wow-delay=".5s">
					<div class="address-grid">

						<c:if test="${cart.countItem() == 0}">
							<h4>Bạn chưa có sản phẩm nào trong giỏ hàng</h4>

						</c:if>
						<c:if test="${cart.countItem() > 0}">
							<div class="checkout-right animated wow slideInUp"
								data-wow-delay=".5s">
								<h4>Thông tin giỏ hàng</h4>
								<table class="timetable_sub">
									<thead>
										<tr>
											<th>STT</th>
											<th>Hình Sản Phẩm</th>
											<th>Số Lượng</th>
											<th>Tên Sản Phẩm</th>
											<th>Đơn Giá</th>
											<th>Tùy Chọn</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="i" items="${cart.cartItems}" varStatus="loop">
											<tr class="rem1">
												<td class="invert">${loop.index + 1}</td>
												<td class="invert-image" style="width: 25%"><a
													href="single"> <img
														src="${i.value.getProduct().getImage()}"
														class="img-responsive" />
												</a></td>
												<td class="invert" style="width: 20%">
													<div class="quantity">
														<div class="quantity-select">
															<a class="hover-cart"
																style="cursor: pointer; padding: 8px 15px; display: inline-block;"
																onclick="subItem(${i.key}, 1)">
																<div class="entry value-minus" style="color: white">-</div>
															</a>

															<div class="entry value" id="valuequantity"
																style="display: inline-block;">
																<%-- <span>${i.value.quantity}</span> --%>
																<input class="item_quantity _${loop.index}" min="1"
																	value="${i.value.quantity}">
															</div>

															<a class="hover-cart"
																style="cursor: pointer; padding: 8px 15px; display: inline-block;"
																onclick="addItem(${i.key}, 1)">
																<div class="entry value-plus active"
																	style="color: white">+</div>
															</a>
														</div>
													</div>
												</td>
												<td class="invert" style="width: 30%">
													${i.value.getProduct().getName()}</td>
												<td class="invert"><fmt:formatNumber
														value="${i.value.getProduct().getPrice()}" type="currency"
														currencySymbol="$" /></td>
												<td class="invert" style="width: 10%"><a
													style="cursor: pointer; color: white; text-decoration: none"
													onclick="removeItem(${i.key})"> <span
														class="glyphicon glyphicon-trash"></span>
												</a></td>
											</tr>
										</c:forEach>
										<tr>

											<td colspan="2">Tổng hóa đơn:</td>
											<td colspan="4"><fmt:formatNumber
													value="${cart.totalCart()}" type="currency"
													currencySymbol="$" /> <input class="hidden totalcart"
												value=${cart.totalCart()}></td>
										</tr>
									</tbody>
								</table>

							</div>

						</c:if>
						<br>
						
						
							<div class="btn_form">
								<button onclick="addItem(${product.id}, getQtt())" class="btn btn-warning">Cập nhật giỏ hàng</button>
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
							<h2>Thanh toán nha</h2>
							<br>
							<form class="form-horizontal">
								<fieldset>
									<div class="form-group">
										<label class="col-md-2 control-label" for="name"><b>Tên
												người dùng</b></label>
										<div class="col-md-5">
											<input type="text" class="hidden form-control id" name="name"
												value="${user.id}"> <input type="text"
												class="form-control name" name="name" value="${user.name}">
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-2 control-label" for="email"><b>Email</b></label>
										<div class="col-md-5">
											<input type="text" class="form-control email" name="email"
												value="${user.email}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label" for="phone"><b>Số
												điện thoại</b></label>
										<div class="col-md-5">
											<input type="text" class="form-control phone" name="phone"
												value="${user.phone}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label" for="address"><b>Địa
												chỉ</b></label>
										<div class="col-md-5">
											<input type="text" class="form-control address_"
												name="address" value="${user.address}">
										</div>
									</div>
									<!-- Button -->
									<div class="form-group">
										<div class="col-md-8">
											<div class="text-center"
												style="display: flex; justify-content: center; padding: 20px;">
												<div style="display: inline-block; padding: 10px;">
													<button class="btn btn-info"
														onclick="createOrder('regular')">Thanh toán đơn
														hàng</button>
												</div>

												<div style="display: inline-block; padding: 10px;">
													<a href="/home" class="btn btn-danger"> Tiếp tục mua hàng</a>
												</div>

											</div>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- content -->

	<!--footer-->
	<jsp:include page="website/footer.jsp" />
	<!--footer-->

	<!--search jQuery-->
	<script src="static/js/main.js"></script>

	<!--//smooth-scrolling-of-move-up-->
	<!--Bootstrap core JavaScript
    ================================================== -->
	<!--Placed at the end of the document so the pages load faster -->
	<script>
    
    function getQtt(idx) {
    	var qtt = Number.parseInt($('._' + idx).val());
    	return qtt
    }
    
    function createOrder(payment) {
    	var data = JSON.stringify({
    		"customerName": $('.name').val(),
    		"phoneNumber": $('.phone').val(),
    		"address": $('.address_').val(),
    		"payment": payment
    	});
    	
    	var cb = function(data) {
    		if (data) {
    			window.location = "/profile"
    		}
    	}
    	
    	post("/order", data, cb);
    }
    
    
    $(document).ready(function() {
		
		var defaults = {
			containerID: 'toTop', // fading element id
			containerHoverID: 'toTopHover', // fading element hover id
			scrollSpeed: 1200,
			easingType: 'linear' 
		};
		
		$().UItoTop({ easingType: 'easeOutQuart' });
		
	});
    
    
        paypal.Button.render({

            env: 'sandbox', // sandbox | production

            // PayPal Client IDs - replace with your own
            // Create a PayPal app: https://developer.paypal.com/developer/applications/create
            client: {
                sandbox:    'AXvtg0AxB1_NhGFM_4dU-MkxVgCDALkig3D7JOu4eIpezr1sMUQAtJOa4BKzlcy8V4dDvzY3aUD4O2VL'
            },

            // Show the buyer a 'Pay Now' button in the checkout flow
            commit: true,

            // payment() is called when the button is clicked
            payment: function(data, actions) {

                // Make a call to the REST api to create the payment
                return actions.payment.create({
                    payment: {
                        transactions: [{
                                amount: { total: $('.totalcart').val() || 0, currency: 'USD' }
                            }]
                    }
                });
            },

            // onAuthorize() is called when the buyer approves the payment
            onAuthorize: function(data, actions) {

                // Make a call to the REST api to execute the payment
                return actions.payment.execute().then(function() {
                	createOrder('paypal')
                });
            }

        }, '#paypal-button-container');

    </script>
</body>
</html>