<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <%@ include file="head.jsp"%>

  <title>商品</title>

</head>

<body>
  <%@ include file="nav.jsp"%>
  <!-- 搜索条 -->
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-10">

            <div class="row">
              <div class="col-md-2">
                <img src="./resources/img/nav_logo.jpg" style="width: 190px; height: 120px;">
              </div>
              <div class="col-md-10">
                <!-- 下面是右面 -->
                <a type="button" class="btn btn-link float-right text-secondary" style="margin-top: 70px;"> 我的购物车 </a>
                <form class="form-inline float-right" style="margin-top: 70px; margin-right: 10px;">
                  <div class="input-group mb-3">
                    <input type="text" class="form-control">
                    <div class="input-group-append">
                      <button class="input-group-text" type="submit">搜索</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>

          </div>
          <div class="col-md-1"></div>
        </div>
      </div>
    </div>
  </div>
  <p></p>

  <div class="container-fluid bg-gray">
    <div class="row">
      <div class="col-md-1"></div>
      <div class="col-md-10">
        <div class="row">
          <div class="col-md-5">
            <img src="./resources/img/${shop.picture }" style="float: right;" />
          </div>
          <div class="col-md-7">
            <table class="table">
              <tbody>
                <tr>
                  <td>
                    <h6>
                      <span class="text-red">${shop.home }</span>&nbsp;<strong>${shop.shopname
                        }</strong>&nbsp;${shop.title }
                    </h6>
                  </td>
                </tr>
                <tr>
                  <td>京东价:￥${shop.price } ${ shop.comment == 0 ? '' : '<small>[<del>￥9766</del>]</small>' }</td>
                </tr>
                <tr>
                  <td>
                    <c:if test="${collect == 1 }">
                      <a class="btn btn-light" href="del.user_collect?shopid=${shop.id }&src=shop_item">移除关注</a>
                    </c:if>
                    <c:if test="${collect == 0 }">
                      <a class="btn btn-light" href="add.user_collect?shopid=${shop.id }&src=shop_item">关注</a>
                    </c:if>
                    <c:if test="${car == 1 }">
                      <a class="btn btn-light" href="del.user_car?shopid=${shop.id }&src=shop_item">移除购物车</a>
                    </c:if>
                    <c:if test="${car == 0 }">
                      <a class="btn btn-light" href="add.user_car?shopid=${shop.id }&src=shop_item">加入购物车</a>
                    </c:if>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="col-md-1"></div>
    </div>
  </div>

  <%@ include file="footer.jsp"%>

</body>

</html>