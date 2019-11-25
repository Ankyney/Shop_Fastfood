<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--new-->
<script>
function getQtt(idx) {
	var qtt = Number.parseInt($('._' + idx).val());
	return qtt
}
</script>
<!-- 
<div class="new">
	<div class="container">
		<div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
			<h3 class="title">BÁN CHẠY</h3>
			<p>TOP 4 SẢN PHẨM BÁN CHẠY NHẤT</p>
		</div>
		<div class="new-info">
		
		<c:forEach var="i" items="${bestSeller}" varStatus="loop">
			<div class="col-md-3 new-grid simpleCart_shelfItem wow flipInY animated" data-wow-delay=".5s">
				<div class="new-top">
					<a href="single.html"><img src="${i.image}"
						class="img-responsive" alt="" /></a>
					<div class="new-text">
						<ul>
							<li><a class="item_add" href="productDetail?cateID=${i.category.id}&productID=${i.id}">Xem Chi Tiết </a></li>
							<li><input type="number" class="item_quantity _${loop.index}" min="1" value="1"></li>
							<li><a onclick="addItem(${i.id}, getQtt(${loop.index}))" style="cursor: pointer">Thêm vào Giỏ </a></li>
						</ul>
					</div>
				</div>
				<div class="new-bottom">
					<h5>
						<a class="name" href="single.html">${i.name}</a>
					</h5>
					<div class="rating">
						<span class="on">☆</span> <span class="on">☆</span> <span class="on">☆</span>
						<span class="on">☆</span> <span class="on">☆</span>
					</div>
					<div class="ofr">
						<p>
							<span class="item_price"><fmt:formatNumber value="${i.price}" type="currency" currencySymbol="$"/></span>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
 -->
<!--//new-->
<!--gallery-->
<div class="gallery">
	<div class="container">
		<div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
			<h3 class="title">SẢN PHẨM</h3>
			<p>Sản phẩm cửa Shop TTH </p>
		</div>
		<div class="gallery-info">
			<c:forEach var="product" varStatus="status" items="${mostViews}">
				<div class="col-md-3 gallery-grid wow fadeInUp animated" data-wow-delay=".5s">
					<a href="productDetail?cateID=${product.category.id}&productID=${product.id}">
						<img src="${product.image}" class="img-responsive" />
					</a>
					<div class="gallery-text simpleCart_shelfItem" style="padding-top:0px;">
						<h5>
							<a class="name" href="productDetail?cateID=${product.category.id}&productID=${product.id}">${product.name}</a>
						</h5>
						<p>
							<span class="item_price"><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="$"/></span>
						</p>
						<h4 class="sizes"></h4>
						<ul>
							<li>
								<a href="productDetail?cateID=${product.category.id}&productID=${product.id}">
									<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
								</a>
							</li>
							<li>
								<a class="item_add" onclick="addItem(${product.id}, 1)">
									<span class="glyphicon glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
								</a>
							</li>
							<div class="rating">
						<span class="on">☆</span> <span class="on">☆</span> <span class="on">☆</span>
						<span class="on">☆</span> <span class="on">☆</span>
					</div>
							<!-- <li>
								<a href="#">
									<span class="glyphicon glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
								</a>
							</li> -->
						</ul>
					</div>
				</div>
			</c:forEach>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!--//gallery-->