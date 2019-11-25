<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link href="static/css/jquery-ui/jquery-ui.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Arima+Madurai:300"
	rel="stylesheet">
<script>
	$(function() {
		$("a[data-lang]").click(function() {
			var lang = $(this).attr("data-lang");
			$.get("home.htm?language=" + lang, function() {
				location.reload();
			});
			return false;
		});
	});
</script>
<script>
	function logout() {
		var cb = function() {
			window.location = "/home"
		}

		get("/user/logout", cb)
	}
</script>
<div class="header">
	<div class="top-header navbar navbar-default">
		<!--header-one-->
		<div class="container">
			<div class="nav navbar-nav wow fadeInLeft animated"
				data-wow-delay=".5s">
				<p>
					<spring:message code="header.wellcom" />
					<a>SHOP TTH</a>
					<c:if test="${not empty user}">
						<a title="Thông tin người dùng" href="/profile"> ${user.name}</a>
						<button class="btn btn-danger" type="button" onclick="logout()">
							Đăng xuất</button>

					</c:if>

					<c:if test="${empty user}">
						<a href="login"><spring:message code="header.login" /></a>
					</c:if>
				</p>
			</div>
			<div class="nav navbar-right menu-right">

				<ul>
					<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>
						0862998345</li>
					<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>
						<a href="mailto:">shoptthpoly@gmail.com</a></li>
					<li><a href="?language=vi" title="Vietnamese"> <img
							class="vietnam" alt="" src="/static/images/logo/Viet Nam.png">
					</a></li>
					<li><a href="?language=en" title="English"> <img alt=""
							src="/static/images/logo/english_flag (1).png">
					</a></li>
				</ul>
			</div>

		</div>
	</div>
	<div class="header-two navbar navbar-default header-menu">

		<!--header-two-->

		<div class="container menu-home">
			<div class="row">
				<div class="col-sm-3">
					<div class=" logo wow zoomIn animated" data-wow-delay=".7s">

						<a href="home" class="shop"> SHOP <b class="logotth">TTH</b> <span
							class="tag"><spring:message code="header.logo"></spring:message> </span>
						</a>

					</div>
				</div>
				<div class="col-sm-3 magin-tophe">
					<div class="col-four icoon">
						<i class="fa fa-truck icoon-hinh" style="font-size: 30px"> </i> <strong><spring:message
								code="banner.mpship"></spring:message></strong> <br>
						<spring:message code="banner.mp"></spring:message>
					</div>

				</div>

				<div class="col-sm-1 magin-tophe"></div>
				<div class="col-sm-3 magin-tophe thanhtoan">
					<div class="col-four icoon">
						<i class="fa fa-usd icoon-hinh" style="font-size: 30px"> </i> <strong><spring:message
								code="banner.h4"></spring:message></strong> <br>
						<spring:message code="banner.ck"></spring:message>
					</div>

				</div>
				<%-- <div class="col-sm-3 magin-tophe">
			<div class="col-four icoon"> 
			<i class="fa fa-thumbs-up icoon-hinh" style="font-size:30px">
			</i> <strong><spring:message code="banner.h3"> </spring:message></strong>
			 <br><spring:message code="banner.h2"></spring:message></div>
			 </div> --%>

				<div class="col-sm-2">
					<div class="nav navbar-nav navbar-right header-two-right">
						<div class="header-right cart">
							<a href="#"> <span class="glyphicon glyphicon-shopping-cart"
								aria-hidden="true"></span>
							</a>
							<h4>
								<a href="#"> <span id="cartTotal"> <fmt:formatNumber
											value="${cart.totalCart()}" type="currency"
											currencySymbol="$" />
								</span> (<span id="totalItems">${cart.countItem()}</span>)
								</a>
							</h4>
							<div class="cart-box">
								<form action="">
									<input type="hidden" name="cmd" value="_cart" /> <input
										type="hidden" name="display" value="1" />
									<p>
										<a id="cartButton" href="/cart"
											style="background-color: transparent; border: none;"> <spring:message
												code="view.cart" /></a>
									</p>
								</form>
								<div class="clearfix"></div>
								<div id="cart-box"></div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>


			</div>
		</div>
	</div>
	<div class="top-nav navbar navbar-default">
		<!--header-three-->
		<div class="container">
			<nav class="navbar" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<!--navbar-header-->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav top-nav-info">
						<li><a href="home"><spring:message code="header.home" /></a></li>
						<li><a href="allProduct"><spring:message
									code="header.product" /></a></li>
						<li class="dropdown"><a href="#"
							class="dropdown-toggle list1" data-toggle="dropdown"><spring:message
									code="header.category" /><b class="caret"></b> </a>
							<ul
								class="dropdown dropdown-menu multi-column menu-two multi-column3">
								<div class="row">
									<div class="col-sm-4 menu-grids">
										<ul class="multi-column-dropdown">
											<c:forEach var="c" items="${categories}">
												<li><a class="list"
													href="/searchProduct?cateID=${c.id}">${c.name}</a></li>
											</c:forEach>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</ul></li>

						<li><a href="lienhe"><spring:message
									code="header.contact" /></a></li>




					</ul>
					<div class="clearfix"></div>
					<!--//navbar-collapse-->
					<header class="cd-main-header">

						<div class="row">
							<div class="col-sm-12">

								<ul class="cd-header-buttons">
									<li><a class="cd-search-trigger" href="#cd-search"> <span></span></a></li>
								</ul>
								<ul>

								</ul>
							</div>


						</div>

						<!-- cd-header-buttons -->



					</header>




				</div>
				<!--//navbar-header-->



			</nav>
			<div id="cd-search" class="cd-search">
				<form action="search" method="get">
					<input id="autocomplete" type="text" name="searchValue"
						placeholder="Tìm kiếm sản phẩm..." /> <input type="submit"
						value="Tìm sản phẩm" />
				</form>
			</div>
			<script src="static/js/jquery/jquery-ui.js"></script>
		</div>
	</div>
</div>