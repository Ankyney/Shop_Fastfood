<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

function post(url, data, cb1){
	$.ajax({
		url : url,
		type : "POST",
		data : data,
		contentType : "application/json",
		success : cb1,
		error : function(jqXHR, status, errorThrown) {
			console.log(errorThrown);
		}
	});
}

function put(url, data, cb1){
	$.ajax({
		url : url,
		type : "PUT",
		data : data,
		contentType : "application/json",
		success : cb1,
		error : function(jqXHR, status, errorThrown) {
			console.log(errorThrown);
		}
	});
}

function postForm(url, data, cb) {
	$.ajax({
		url : url,
		type : "POST",
		data : data,
		processData : false,
		contentType : false,
		success : cb,
		error : function(jqXHR, status, errorThrown) {
			console.log(errorThrown);
		}
	});
}

function get(url, cb1){
	$.ajax({
		url : url,
		type : "GET",
		contentType : "application/json",
		success : cb1,
		error : function(jqXHR, status, errorThrown) {
			console.log(errorThrown);
		}
	});
}

function del(url, cb1){
	$.ajax({
		url : url,
		type : "DELETE",
		contentType : "application/json",
		success : cb1,
		error : function(jqXHR, status, errorThrown) {
			console.log(errorThrown);
		}
	});
}

		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
		
		function addItem(id, qtt){
    		$.ajax({
				url : "/cart/plus/"+id + "/" + qtt,
				type : "GET",
				async : false,
				success : function(result) {
					generateNotify(result.message);
					setTimeout(function() {
			    		location.reload(true);
			    	}, 1000);
				},
				error : function(jqXHR, status, errorThrown) {
					generateNotify(errorThrown);
				}
				});
    	}
    	function subItem(id, qtt){
    		$.ajax({
				url : "/cart/sub/"+id + "/" + qtt,
				type : "GET",
				async : false,
				success : function(result) {
					generateNotify(result.message);
					setTimeout(function() {
			    		location.reload(true);
			    	}, 1000);
				},
				error : function(jqXHR, status, errorThrown) {
					generateNotify(errorThrown);
				}
				});
    	}
    	function removeItem(id){
    		$.ajax({
				url : "/cart/remove/"+id,
				type : "GET",
				async : false,
				success : function(result) {
					generateNotify(result.message);
					setTimeout(function() {
			    		location.reload(true);
			    	}, 1000);
				},
				error : function(jqXHR, status, errorThrown) {
					generateNotify(errorThrown);
				}
				});
    	}
    	function generateNotify(mess) {
    		$.notify({
			      title: '<strong>Thông báo: </strong>',
			      icon: 'glyphicon glyphicon-star',
			      message: mess
			    },{
			      type: 'info',
			      animate: {
					    enter: 'animated fadeInDown',
			        	exit: 'animated fadeOutUp'
			      },
			      placement: {
			        from: "top",
			        align: "right"
			      },
			      newest_on_top: true,
			      offset: 70,
			      spacing: 10,
			      z_index: 1031,
			    template: '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
				'<button type="button" aria-hidden="true" class="close" data-notify="dismiss">×</button>' +
				'<span data-notify="icon"></span> ' +
				'<span data-notify="title">{1}</span> ' +
				'<span data-notify="message">{2}</span>' +
				'<div class="progress" data-notify="progressbar">' +
					'<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
				'</div>' +
				'<a href="{3}" target="{4}" data-notify="url"></a>' +
			'</div>'
			    });
	}
</script>