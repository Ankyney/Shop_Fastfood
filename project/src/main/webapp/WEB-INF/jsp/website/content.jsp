<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!--new-->
<script>
function getQtt(idx) {
	var qtt = Number.parseInt($('._' + idx).val());
	return qtt
}
</script>

<div class="gallery">
	<div class="container">
		<div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
			<h3 class="title"><spring:message code="product.product2"></spring:message></h3>
			<p><spring:message code="product.of"></spring:message> </p>
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