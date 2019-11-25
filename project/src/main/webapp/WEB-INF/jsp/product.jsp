<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>
	<!-- header -->
	<jsp:include page="website/header.jsp" />
	<!-- header -->
	
	<!-- content -->
	<jsp:include page="website/ProductContent.jsp" />
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
    <!-- <script src="static/js/bootstrap.js"></script> -->
    <script type="text/javascript">
    	
    	
    </script>
</body>
</html>