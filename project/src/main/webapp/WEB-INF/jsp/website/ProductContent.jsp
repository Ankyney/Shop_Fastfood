<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
function getQtt() {
	var qtt = Number.parseInt($('.item_quantity' ).val());
	return qtt
}
</script>
<!--breadcrumbs-->
<div class="breadcrumbs">
	<div class="container">
		<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
			<li>
				<a href="/home">
					<span class="glyphicon glyphicon-home" aria-hidden="true"></span>Trang Chủ
				</a>
			</li>
			<li class="active">Sản Phẩm</li>
		</ol>
	</div>
</div>
<!--//breadcrumbs-->
<!--products-->
<div class="products">
	<div class="container">
		<div class="col-md-9 product-model-sec">
			<c:choose>
				<c:when test="${products == null}">
					<h1 style="text-align: center;">Sản phẩm này hết hàng rồi bạn ơi!</h1>
				</c:when>
				<c:otherwise>
					<c:forEach var="product" items="${products}">
				<div style="margin: 10px 8px;" class="product-grids simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".5s">
					<div class="new-top">
						<a href="single.html"><img src="${product.image}" class="img-responsive"/></a>
						<div class="new-text">
							<ul>
								<li><a href="productDetail?cateID=${product.category.id}&productID=${product.id}">Xem Chi Tiết </a></li>
								<li><input type="number" class="item_quantity" min="1" value="1"></li>
								<li>
									<form action="#" method="post">
										<fieldset>
											<input type="hidden" name="cmd" value="_cart" />
											<input type="hidden" name="add" value="1" />
											<input type="hidden" name="business" value="" />
											<input type="hidden" name="item_name" value="${product.name}" />
											<input type="hidden" name="amount" value="${product.price}" />
											
											<input type="hidden" name="discount_amount" value="" />
											<input type="hidden" name="currency_code" value="$" />
											<input type="hidden" name="item_image" value="images/4.png" />
											<input type="hidden" name="return" value=" " />
											<input type="hidden" name="cancel_return" value=" " />
											<!-- <input class="item_quantity" type="submit" name="submit" value="Thêm vào giỏ" /> -->
											<input type="button" onclick="addItem(${product.id}, getQtt())" class="item_quantity" value="Thêm Vào Giỏ" />
										</fieldset>
									</form>
									<%-- <button onclick="addItem(${product.id}, getQtt())" class="btn btn-warning">Thêm Vào Giỏ</button> --%>
								</li>
							</ul>
						</div>
					</div>
					<div class="new-bottom" style="text-align: center;">
						<h5>
							<a class="name" href="productDetail?cateID=${product.category.id}&productID=${product.id}">${product.name}</a>
						</h5>
						
						<div class="ofr">
							<p>
								<span class="item_price"><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="$"/></span>
							</p>
						</div>
						<div class="rating">
						<span class="on">☆</span> <span class="on">☆</span> <span class="on">☆</span>
						<span class="on">☆</span> <span class="on">☆</span>
					</div>
					</div>
				</div>
			</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="col-md-3 rsidebar">
				<div class="rsidebar-top">
					<form action="searchProduct" method="get">
					<div class="slider-left">
						<h4>Lọc sản phẩm theo giá</h4>
						<div id="slider-range"></div><br>
						<input type="text" id="amount" style="border: 0; color: #353F49; text-align: center; padding-left: 10px;" />
						<input type="hidden" id="amountHidden" name="priceRange" />
							<input id="priceValue1" type="hidden" value="${priceValue1}"/>
							<input id="priceValue2" type="hidden" value="${priceValue2}"/>
						<!---->
						<script type='text/javascript'>
							$(window).load(function() {
							 $( "#slider-range" ).slider({
										range: true,
										min: 1,
										max: 100,
										step: 1,
										values: [1, 1000],
										slide: function( event, ui ) {
											$( "#amount" ).val( ui.values[ 0 ] + "$ - " + ui.values[ 1 ] + "$" );
											$( "#amountHidden" ).val( ui.values[ 0 ] + "-" + ui.values[ 1 ] );
										}
							 });
							$( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) + "$ - " + $( "#slider-range" ).slider( "values", 1 ) + "$" );
							$( "#amountHidden" ).val( $( "#slider-range" ).slider( "values", 0 ) + "-" + $( "#slider-range" ).slider( "values", 1 ) );
							var priceValue1 = document.getElementById("priceValue1").value;
							var priceValue2 = document.getElementById("priceValue2").value;
							
							if(priceValue1 != null && priceValue2 != null) {
								$( "#slider-range" ).slider( "option", "values", [ priceValue1, priceValue2 ] );
								$( "#amount" ).val( priceValue1 + "	- " + priceValue2 + "$" );
								$( "#amountHidden" ).val( priceValue1 + "-" + priceValue2 );
							}
							});  
						</script>
						
						<!---->
					</div>
					<div class="sidebar-row">
						<h4>Loại sản phẩm</h4>
						<div class="row row1 scroll-pane">
							<!-- <c:choose>
								<c:when test="${categoryID == null}">
									<label class="checkbox"><input type="radio" value="null" checked="checked" name="cateID"><i></i>TẤT CẢ</label>
								</c:when>
								<c:otherwise>
									<label class="checkbox"><input type="radio" value="null" name="cateID"><i></i>TẤT CẢ</label>
								</c:otherwise>
							</c:choose> -->
							<c:forEach var="category" items="${categories}">
								<c:choose>
									<c:when test="${category.id == categoryID}">
										<label class="checkbox"><input type="radio" checked="checked" value="${category.id}" name="cateID"><i></i>${category.name}</label>
									</c:when>
									<c:otherwise>
										<label class="checkbox"><input type="radio" value="${category.id}" name="cateID"><i></i>${category.name}</label>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<center><input style="margin: 0 auto; background: #ff5a10; border: none; color: #FFF; width: 150px; height: 40px; border-radius: 10px;" type="submit" value="LỌC THEO GIÁ" /></center>
						</div>
					</div>
					</form>
				</div>
			</div>
		<div class="clearfix"></div>
	</div>
</div>
<!--//products-->