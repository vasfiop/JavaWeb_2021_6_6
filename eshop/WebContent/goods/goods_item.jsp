<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <title>随意购商城首页</title>
  <%@ include file="../header.jsp"%>
  <style>
    .radio_group input[type="radio"]:checked+label {
      padding: 0.2em 1em;
      border: 1px solid #6c757d;
      background: #6c757d;
      color: white;
    }

    .radio_group input[type="radio"]+label {
      padding: 0.2em 1em;
      border: 1px solid #CCCCCC;
      color: #999;
    }

    .radio_group_title {
      padding: 0.2em 0;
      padding-right: 1em;
      color: #000;
    }
  </style>
  <script type="text/javascript">
    $(function () {
      $('#goods_items_form').submit(function () {
        $.post("${pageContext.request.contextPath}/goods/addCart.goods",
          $('#goods_items_form').serialize(),
          function (resa) {
            $('#user_cart_count').html(resa);
            
          }, "json");
        return false;
      });
    });
  </script>
</head>

<body>
  <%@ include file="../nav.jsp"%>

  <div class="container mt-4">
    <div class="row">
      <div class="col-md-12">
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/index.home">首页</a></li>
            <li class="breadcrumb-item"><a
                href="${pageContext.request.contextPath }/goods/type.goods?cateid=${good.cate_id }">${good.cate_name
                }</a></li>
            <li class="breadcrumb-item active">${good.goods_name }</li>
          </ol>
        </nav>
      </div>
    </div>
  </div>

  <div class="container">
    <div class="row">
      <div class="col-md-4">
        <!-- 左侧图片展示区开始 -->
        <div id="tsShopContainer">
          <div id="tsImgS">
            <a href="/eshop/resources${good.goods_pic }" title="Images" class="MagicZoom" id="MagicZoom"><img
                width="350px" height="350px" src="/eshop/resources${good.goods_pic }" /></a>
          </div>
          <div id="tsPicContainer">
            <div id="tsImgSArrL" onclick="tsScrollArrLeft()"></div>
            <div id="tsImgSCon">
              <ul>
                <c:forEach var="i" items="${good.pic }">
                  <li onclick="showPic()" rel="MagicZoom"><img height="42" width="42"
                      src="/eshop/resources${i.pic_url }" tsImgS="/eshop/resources${i.pic_url }" /></li>
                </c:forEach>
              </ul>
            </div>
            <div id="tsImgSArrR" onclick="tsScrollArrRight()"></div>
          </div>
          <script src="/eshop/resources/zoom/js/ShopShow.js"></script>
          <img class="MagicZoomLoading" width="16" height="16" src="/eshop/resources/zoom/images/loading.gif"
            alt="Loading..." />
        </div>
      </div>
      <div class="col-md-8">
        <h5>${good.goods_name }</h5>
        <div class="p-4 bg-light border">
          <p class="text-secondary">
            促销价：<span class="text-danger">￥<strong style="font-size: 20px;">${good.goods_discount }</strong></span>
          </p>
          <p class="text-secondary">
            原价：
            <del class="">￥${good.goods_price }</del>
          </p>
          <p class="mb-0 text-secondary">已售出${good.goods_sales }件</p>
        </div>

        <form class="" id="goods_items_form" method="post"
          action="${pageContext.request.contextPath }/goods/addCart.goods">
          <input name="goods_id" id="goods_id" value="${good.goods_id }" type="hidden">
          <input name="goods_price" id="goods_price" value="${good.goods_discount }" type="hidden">
          <input name="goods_pic" id="goods_pic" value="${good.goods_pic }" type="hidden">
          <input name="goods_name" id="goods_name" value="${good.goods_name }" type="hidden">
          <c:forEach var="i" items="${good.typetitle }" varStatus="vt">
            <div class="input-group mb-3 mt-2 radio_group">
              <div class="input-group-prepend">
                <div class="radio_group_title">${i.type_name }:</div>
                <c:forEach var="j" items="${good.typename }" varStatus="vs">
                  <c:if test="${j.type_id == i.type_id }">
                    <input type="radio" name="type${vt.count }" id="color_${vs.count }" style="display: none;">
                    <label for="color_${vs.count }">${j.content }</label>
                  </c:if>
                </c:forEach>
              </div>
            </div>
          </c:forEach>

          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <div class="radio_group_title">数量:</div>
              <input type="number" name="goods_count" value="1" min="1" max="99" id="goods_count">
            </div>
          </div>

          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <div class="radio_group_title">运费:</div>
              <div class="radio_group_title">￥${good.goods_postalfee }</div>
            </div>
          </div>

          <div class="mb-3">
            <button type="button" class="btn btn-primary mr-2 btn-sm">
              立即购买
            </button>
            <button type="submit" class="btn btn-primary btn-sm">
              加入购物车
            </button>
          </div>

        </form>
      </div>
    </div>
  </div>

  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <h5 class="card-header">商品详情</h5>
          <div class="card-body">
            <dl class="row mb-0">
              <dt class="col-sm-3">宝贝详情</dt>
              <dd class="col-sm-9">${good.goods_disc }</dd>

              <dt class="col-sm-3">产地</dt>
              <dd class="col-sm-9">${good.goods_origin }</dd>
            </dl>
          </div>
          <div class="card-footer">
            <div class="container">

              <div class="d-flex justify-content-center">
                <img src="/eshop/resources${good.goods_pic }" style="width:400px;" class="mb-2">
              </div>

              <c:forEach var="i" items="${good.pic }">
                <div class="d-flex justify-content-center">
                  <img src="/eshop/resources${i.pic_url }" style="width:400px;" class="mb-2">
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="../footer.jsp"%>
  <%@ include file="../modal/loginFormModal.jsp"%>
  <%@ include file="../modal/regFormModal.jsp"%>
  <%@ include file="../modal/cartModal.jsp"%>
</body>

</html>