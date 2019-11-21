<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--breadcrumbs-->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="/home"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Trang Chủ</a></li>
				<li class="active">Sản Phẩm</li>
				<li class="active">${product.name}</li>
			</ol>
		</div>
	</div>
<!--single-page-->
	<div class="single">
		<div class="container">
			<div class="single-info">		
				<div class="col-md-6 single-top wow fadeInLeft animated" data-wow-delay=".5s">	
					<div class="flexslider">
						<ul>
							<li data-thumb="${product.image}">
								<div class="thumb-image"> <img src="${product.image}" data-imagezoom="true" class="img-responsive" alt=""> </div>
							</li>
							
						</ul>
					</div>
				</div>
				<div class="col-md-6 single-top-left simpleCart_shelfItem wow fadeInRight animated" data-wow-delay=".5s">
					<h3>${product.name}</h3>
					<h6 class="item_price"><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="$"/></h6>			
					<div class="clearfix"> </div>
					<div>
						
						<c:forEach var="p" items="${details}">
							Mô tả: <p> ${p}</p>
						</c:forEach>
					</div>
					<div class="quantity">
						<c:if test="${product.quantity > 1}">
							<p style="font-weight: bold;">Hiện tại vẫn còn hàng</p><br>
							<p class="qty"> Số lượng :  </p>	
							<input style="border: 1px solid #000; color: #000; font-weight: 700;" min="1" type="number" value="1" class="item_quantity">
						</c:if>
						
						<c:if test="${product.quantity < 1}">
							<p style="font-weight: bold;">Hiện tại đã hết hàng</p><br>
						</c:if>
						
					</div>
					
					<c:if test="${product.quantity > 1}">
							<div class="btn_form">
								<button onclick="addItem(${product.id}, getQtt())" class="btn btn-warning">Thêm Vào Giỏ</button>
							</div>
					</c:if>
						
				</div>
			   <div class="clearfix"> </div>
			</div>
			<!--collapse-tabs-->
			<div class="collpse tabs">
				<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default wow fadeInUp animated" data-wow-delay=".5s">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
								  Thông tin thương hiệu
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								${product.brand.description}
							</div>
						</div>
					</div>
					<div class="panel panel-default wow fadeInUp animated" data-wow-delay=".6s">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								   Thông tin danh mục
								</a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">
								${product.category.description}
							</div>
						</div>
					</div>
					<div class="panel panel-default wow fadeInUp animated" data-wow-delay=".8s">
						<div class="panel-heading" role="tab" id="headingFour">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
									Trợ giúp
								</a>
							</h4>
						</div>
						<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
							<div class="panel-body">
							
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--//collapse -->
			<!--related-products-->
			
			<!--//related-products-->
		</div>
	</div>
<!--//single-page-->