<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="toast.jsp"%>

<div class="container">
  <div class="row">
    <div class="col-md-12">

      <nav>
        <ol class="breadcrumb d-flex justify-content-end" id="info">
          <c:if test="${user.user_name == null }">
            <li class="breadcrumb-item">
              <span>游客您好，欢迎来到随意购商城！</span>
            </li>
            <li class="breadcrumb-item"><a href="#loginFormModal" role="button" data-toggle="modal">[登陆]</a> &nbsp; <a
                href="#regFormModal" role="button" data-toggle="modal">[新用户注册]</a>
            </li>
            <li class="breadcrumb-item"><a href="#" onclick="alert('请先登录')">购物车</a>
              <span class="badge badge-pill badge-success">0</span></li>
          </c:if>
          <c:if test="${user.user_name != null }">
            <li class="breadcrumb-item">
              <span>${user.user_name }&nbsp;您好，欢迎来到随意购商城！</span>
            </li>
            <li class="breadcrumb-item"><a href="#cartModal" data-toggle="modal">购物车</a>
              <span class="badge badge-pill badge-success" id="user_cart_count">${empty cartcount ? 0 :
                cartcount}</span></li>
            <li class="breadcrumb-item"><a href="#">我的订单</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/user/index.person">个人中心</a></li>
            <li class="breadcrumb-item"><a href="logout.home">退出登录</a></li>
          </c:if>
        </ol>
      </nav>

      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="${pageContext.request.contextPath }/index.home">随意购<small>商城</small></a>
        <div class="collapse navbar-collapse">
          <ul class="navbar-nav">
            <li class="nav-item ${urlkey == 'index' ? 'active' : '' }"><a class="nav-link"
                href="${pageContext.request.contextPath }/index.home">首页</a></li>
            <li class="nav-item ${urlkey == 'hotGoods' ? 'active' : '' }">
              <a class="nav-link" href="${pageContext.request.contextPath }/goods/hotGoods.goods">热销商品</a>
            </li>
            <li class="nav-item ${urlkey == 'newGoods' ? 'active' : '' }">
              <a class="nav-link" href="${pageContext.request.contextPath }/goods/newGoods.goods">新到商品</a>
            </li>
            <c:if test="${urlkey != 'index' && urlkey != 'hotGoods' && urlkey != 'newGoods' && urlkey != null }">
              <li class="nav-item dropdown active">
            </c:if>
            <c:if test="${urlkey == 'index' || urlkey == 'hotGoods' || urlkey == 'newGoods' }">
              <li class="nav-item dropdown">
            </c:if>
            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown">商品分类</a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
              <c:forEach var="i" items="${cates }" varStatus="vs">
                <c:forEach var="j" items="${i.childlist }">
                  <a class="dropdown-item"
                    href="${pageContext.request.contextPath }/goods/type.goods?cateid=${j.cate_id }">${j.cate_name
                    }</a>
                </c:forEach>
                <c:if test="${! vs.last }">
                  <div class="dropdown-divider"></div>
                </c:if>
              </c:forEach>
            </div>
            </li>
          </ul>
          <form class="form-inline ml-5" method="post" action="${pageContext.request.contextPath }/goods/search.goods">
            <input class="form-control mr-sm-2" type="text" name="search" value="${search }" />
            <button class="btn my-2 my-sm-0 btn-outline-secondary" type="submit">搜索</button>
          </form>

          <c:set var="i" value="${value }" />
          <c:if test="${urlkey == 'search' || urlkey == i }">
            <ul class="navbar-nav ml-md-auto">
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink"
                  data-toggle="dropdown">排序</a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item"
                    href="${pageContext.request.contextPath}/goods/searchGoods.goods?sort=1">按价格从低到高</a>
                  <a class="dropdown-item"
                    href="${pageContext.request.contextPath}/goods/searchGoods.goods?sort=2">按价格从高到低</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item"
                    href="${pageContext.request.contextPath}/goods/searchGoods.goods?sort=3">按销量从高到低</a>
                  <a class="dropdown-item"
                    href="${pageContext.request.contextPath}/goods/searchGoods.goods?sort=4">按销量从低到高</a>
                </div>
              </li>
            </ul>
          </c:if>

        </div>
      </nav>

    </div>
  </div>
</div>

<%@ include file="./modal/loginFormModal.jsp" %>
<%@ include file="./modal/regFormModal.jsp" %>
<%@ include file="./modal/cartModal.jsp" %>
<%@ include file="./modal/addAddressModal.jsp" %>