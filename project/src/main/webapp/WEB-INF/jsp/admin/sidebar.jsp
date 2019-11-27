<%@ page pageEncoding="utf-8"%>

<script>
	function activeMenu(element) {
		$('.treeview.active').removeClass('active')
		$(element).addClass('active');
	}
</script>
<style>
li.treeview.revenue.hai {
    border-top: 1px solid white;
}

</style>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="static/admin/img/avatar.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
        <p><span class="hidden-xs">${admin.name}</span></p>
        
          <a href="#"><i class="fa fa-circle text-success"></i>Đang hoạt động</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">ĐIỀU HƯỚNG</li>
        <li class="treeview home">
          <a href="admin">
            <i class="fa fa-home"></i> <span>Trang Chủ</span>
          </a>
        </li>
       
      
        <li class="treeview cate">
          <a href="categoryManager">
            <i class="fa fa-bars"></i> 
            <span>Quản lý Danh Mục</span>
          </a>
        </li>
        <li class="treeview brand">
          <a href="brandManager">
            <i class="fa fa-cube"></i> 
            <span>Quản lý Thương Hiệu</span>
          </a>
        </li>
        <li class="treeview prod">
          <a href="productManager">
            <i class="fa fa-apple"></i>
            <span>Quản lý Sản Phẩm</span>
          </a>
        </li>
        
          <li class="treeview order">
          <a href="orderManager">
            <i class="fa fa-opencart"></i>
            <span>Quản Lý Đơn Hàng</span>
          </a>
        </li>
        
        <li class="treeview revenue hai">
          <a href="adm-profile">
            <i class="fa fa-user"></i>
            <span>Sửa thông tin tài khoản</span>
          </a>
        </li>
        
        <li class="treeview revenue">
          <a href="form-users">
            <i class="fa fa-users"></i>
            <span>Quản lý tài khoản khách hàng</span>
          </a>
        </li>
        
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>