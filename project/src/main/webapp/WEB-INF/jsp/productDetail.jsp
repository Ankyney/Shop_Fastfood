<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<title>Chi tiết Sản phẩm</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--//for-mobile-apps -->
<!--Custom Theme files -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="static/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="static/css/style21.css" rel="stylesheet" type="text/css" media="all" />
<link href="static/css/heade.css" rel="stylesheet" type="text/css" media="all" />
<!--//Custom Theme files -->
<!--js-->
<script src="static/js/jquery-1.11.1.min.js"></script>
<script src="static/js/bootstrap-notify.min.js"></script>
<!--//js-->
<!--flex slider-->
<script defer src="static/js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="static/css/flexslider1.css" type="text/css" media="screen" />
<jsp:include page="head.jsp" />
<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>
<!--flex slider-->
<script src="static/js/imagezoom.js"></script>
<!--animation-effect-->
<link href="static/css/animate.min.css" rel="stylesheet"> 
<script src="static/js/wow.min.js"></script>
<jsp:include page="function.jsp" />
<script>
 new WOW().init();
</script>
<!--//animation-effect-->
<!--start-smooth-scrolling-->
<script type="text/javascript" src="static/js/move-top.js"></script>
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
		
		function getQtt() {
			var qtt = Number.parseInt($('.item_quantity' ).val());
			return qtt
		}
</script>
<!--//end-smooth-scrolling-->
<style type="text/css">
.products {
    font-family: serif;
}
</style>
</head>
<body>
	<!--header-->
	<jsp:include page="website/header.jsp"></jsp:include>
	<!--//header-->
	
	<!--single-page-->
	<jsp:include page="website/detailContent.jsp"></jsp:include>
	<!--//single-page-->
	
	<!--footer-->
	<jsp:include page="website/footer.jsp"></jsp:include>
	<!--//footer-->			
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
</html>