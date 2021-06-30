<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <nav>
        <ol class="breadcrumb d-flex justify-content-end">
          <li class="breadcrumb-item">
            <span>游客您好，欢迎来到随意购商城！</span>
          </li>
          <li class="breadcrumb-item">
            <a href="#loginFormModal" role="button" data-toggle="modal">[登陆]</a>
            &nbsp;
            <a href="#regFormModal" role="button" data-toggle="modal">[新用户注册]</a>
          </li>
          <li class="breadcrumb-item">
            <a href="#">购物车</a>
          </li>
        </ol>
      </nav>

      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <!-- TODO 随意购商城链接 -->
        <a class="navbar-brand" href="${pageContext.request.contextPath }/index.home">随意购<small>商城</small></a>
        <div class="collapse navbar-collapse">
          <ul class="navbar-nav">
            <li class="nav-item ${urlkey == 'index' ? 'active' : '' }">
              <a class="nav-link" href="${pageContext.request.contextPath }/index.home">首页</a>
            </li>
            <li class="nav-item ${urlkey == 'hotGoods' ? 'active' : '' }">
              <a class="nav-link" href="${pageContext.request.contextPath }/goods/hotGoods.goods">热销商品</a>
            </li>
            <li class="nav-item ${urlkey == 'newGoods' ? 'active' : '' }">
              <a class="nav-link" href="${pageContext.request.contextPath }/goods/newGoods.goods">新到商品</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown">商品分类</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
              	<c:forEach var="i" items="${cates }" varStatus="vs">
              		<c:forEach var="j" items="${i.childlist }">
                		<a class="dropdown-item" href="#">${j.cate_name }</a>
                	</c:forEach>
                	<c:if test="${! vs.last }">
                		<div class="dropdown-divider"></div>
                	</c:if>
                </c:forEach>
              </div>
            </li>
          </ul>
          <form class="form-inline ml-5">
            <input class="form-control mr-sm-2" type="text" />
            <button class="btn my-2 my-sm-0 btn-outline-secondary" type="submit">
              搜索
            </button>
          </form>
          <ul class="navbar-nav ml-md-auto">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown">排序</a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                <a class="dropdown-item" href="#">按价格从低到高</a>
                <a class="dropdown-item" href="#">按价格从高到低</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">按销量从高到低</a>
                <a class="dropdown-item" href="#">按销量从低到高</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>

    </div>
  </div>
</div>