<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 首页导航栏 -->
<div class="container-fluid">
  <div class="row">
    <div class="col-md-12" style="background-color: #dfdfdf;">

      <div class="row">

        <div class="col-md-1"></div>

        <div class="col-md-10">

          <a type="button" class="btn btn-link float-left" href="admin_index.jsp" style="color:black">
            京东后台管理系统 </a>
        
          <div class="dropdown">
            <a class="dropdown-toggle btn btn-sm btn-link float-right text-secondary" type="button" data-toggle="dropdown">
              Darling:${user.username }
            </a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="/game/logout">退出登录</a>
            </div>
          </div>

          <%-- <a type="button" class="btn btn-sm btn-link float-right text-secondary" href="admin_user_list">
            用户列表 </a>

          <a type="button" class="btn btn-sm btn-link float-right text-secondary" href="admin_type">
            商品类型 </a>

          <a type="button" class="btn btn-sm btn-link float-right text-secondary" href="admin_shop"> 商品 </a> --%>

        </div>
        <div class="col-md-1"></div>
      </div>
    </div>
  </div>
</div>