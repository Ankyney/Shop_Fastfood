<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>SHOP TTH| Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!--Custom Theme files -->
<link href="static/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="static/css/Style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="static/css/flexslider.css" type="text/css" media="screen" />
<!--//Custom Theme files -->
<!--js-->
<script src="static/js/jquery-1.11.1.min.js"></script>
<script src="static/js/modernizr.custom.js"></script>
<!--//js-->
<!--animation-effect-->
<link href="static/css/animate.min.css" rel="stylesheet"> 
<script src="static/js/wow.min.js"></script>
	<script>
	 new WOW().init();
	</script>
<!--//animation-effect-->
<!--start-smooth-scrolling-->
<script type="text/javascript" src="static/js/move-top.js"></script>
<script type="text/javascript" src="static/js/easing.js"></script>	
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
</script>
<!--//end-smooth-scrolling-->
</head>
<body>
	<!-- header -->
	<jsp:include page="website/header.jsp" />
	<!-- header -->
	
	
	<!-- content -->
	<jsp:include page="website/contentContact.jsp" />
	<!-- content -->
	
	<!--footer-->
	<jsp:include page="website/footer.jsp" />
	<!--footer-->
	
	<!--search jQuery-->
	<script src="static/js/main.js"></script>
	<!--//search jQuery-->
	
	<!--smooth-scrolling-of-move-up-->
	<script type="text/javascript">
		$(document).ready(function() {
		
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
	<!--//smooth-scrolling-of-move-up-->
	<!--Bootstrap core JavaScript
    ================================================== -->
    <!--Placed at the end of the document so the pages load faster -->
    <script src="static/js/bootstrap.js"></script>
</body>
<script src="static/js/minicart.js"></script>
<script>
paypal.minicart.render({
	strings: {
    	button: "$",
   		buttonAlt: "Tổng tiền:",
   		discount: "Giảm giá:"
	}
});

window.onload = function() {
	var items = paypal.minicart.cart.items(),
		quantity = 0;
	if(items.length > 0) {
		for (var i = 0; i < items.length; i++) {
			quantity += items[i].get('quantity');
		}
		if(quantity > 0) {
			document.getElementById("cart-box").innerHTML =
				'<a style="background-color: #DCDCDC; border: 1px solid #FFF; padding: 5px 21px;" href="order">ĐẶT HÀNG</a>';
		}
		document.getElementById("cartTotal").innerHTML = paypal.minicart.cart.total() + " VNĐ (" + quantity + ")";
	} else {
		document.getElementById("cartTotal").innerHTML = "0 VNĐ (0)";
	}
};

paypal.minicart.cart.on('remove', function() {
	var items = this.items(),
		quantity = 0,
		product_name = '',
		total = this.total();
	for (var i = 0; i < items.length; i++) {
		quantity += items[i].get('quantity');
		
	}
	document.getElementById("cartTotal").innerHTML = total + " VNĐ" + " (" + quantity + ")";
});

paypal.minicart.cart.on('checkout', function(idx, product) {
	alert('Check out !');
	window.location.replace("home");
});

$('.clickey').click(function(e) {
    e.stopPropagation();
    
	var items = paypal.minicart.cart.items(),
		length = items.length,
		count = 0,
		price = 0,
		productTotal = 0,
		product_name = '',
		i;
	
	for (i = 0; i < length; i++) {
		count = items[i].get('quantity');
		price = items[i].amount();
		product_name = items[i].get('item_name');
		productTotal = items[i].amount() * count
    }

	window.location.replace("order");
});

if (~window.location.search.indexOf('reset=true')) {
	paypal.minicart.reset();
}
</script>
</html>