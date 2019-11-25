<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.content-wrapper {
	position: relative;
}


</style>
<div class="content-wrapper" style="position: relative;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Thống kê
       
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>${orders}</h3>

              <p>Đơn Hàng Mới</p>
            </div>
            <div class="icon">
              <i class="ion ion-plus-circled"></i>
            </div>
            <a href="orderManager" class="small-box-footer">Chi Tiết <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>5</h3>
              <p>Thương hiệu</p>
            </div>
            <div class="icon">
              <i class="ion ion-cube"></i>
            </div>
            <a href="brandManager" class="small-box-footer">Chi Tiết <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        
         <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>${products}</h3>

              <p>Sản phẩm</p>
            </div>
            <div class="icon">
              <i class="ion ion-social-dropbox"></i>
            </div>
            <a href="productManager" class="small-box-footer">Chi Tiết <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
            
              <h3><fmt:formatNumber value="${revenue}" type="currency" currencySymbol="$" /></h3>

              <p>Doanh thu năm 2019</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="" class="small-box-footer">Chi Tiết <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
      </div>
	  <section class="content-header">
      <h1>
        <center>Sản phẩm bán nhiều nhất tháng này</center>
        <small></small>
      </h1>
    </section>
	
	<section class="content">
      <!-- Small boxes (Stat box) -->
		<div class="row">
				<div style="text-align: center; float: left; margin: 10px; width: 22%; border: 2px solid; border-color: #3c8dbc; padding: 10px; border-radius: 10px;">
					<img src="static/images/prod/anvat_1.jpg" width="80%" />
					<p style="font-weight: bold; padding-top: 10px;">${p.name}</p>
				</div>
				<div style="text-align: center; float: left; margin: 10px; width: 22%; border: 2px solid; border-color: #3c8dbc; padding: 10px; border-radius: 10px;">
					<img src="static/images/prod/anvat_8.jpg" width="80%" />
					<p style="font-weight: bold; padding-top: 10px;">${p.name}</p>
				</div>
				<div style="text-align: center; float: left; margin: 10px; width: 22%; border: 2px solid; border-color: #3c8dbc; padding: 10px; border-radius: 10px;">
					<img src="static/images/prod/anvat_14.jpg" width="80%" />
					<p style="font-weight: bold; padding-top: 10px;">${p.name}</p>
				</div>
				<div style="text-align: center; float: left; margin: 10px; width: 22%; border: 2px solid; border-color: #3c8dbc; padding: 10px; border-radius: 10px;">
					<img src="static/images/prod/anvat_19.jpg" width="80%" />
					<p style="font-weight: bold; padding-top: 10px;">${p.name}</p>
				</div>
		</div>
		
	</section>
	  
	  	
      
  <footer style="border-top: 1px solid #d2d6de; text-align: center; background: #fff; color: #444; height: 60px; line-height: 60px;position: absolute;bottom: 0px; width: 100%">
    <strong>Copyright &copy; 2018 | <a href="#">Shop TTH</a>.</strong>
  </footer>
  
</div>