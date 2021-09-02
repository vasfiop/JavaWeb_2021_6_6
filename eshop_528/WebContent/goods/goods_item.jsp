<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <title>随意购商城首页</title>
  <%@ include file="../header.jsp" %>
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
        console.log("out side");
        $.post("${pageContext.request.contextPath}/goods/addCart.goods",
          $('#goods_items_form').serialize(),
          function (res) {
            $('#user_cart_count').html(res.size);
            console.log("if外面");
            if ($('#cart-tab').length == 0) {
              console.log("this is first goods");
              console.log("cart-table.length = " + $('#cart-tab').length);
              $('#cart-body').html(
                '<table class="table" id="card-tab">' +
                '<thead>' +
                '<tr>' +
                '<th>#</th>' +
                '<th>商品图片</th>' +
                '<th>商品名称</th>' +
                '<th>商品单价</th>' +
                '<th>数量</th>' +
                '<th>小计</th>' +
                '<th>操作</th>' +
                '</tr>' +
                '</thead>' +
                '<tbody id="card-tbody">' +
                '<tr data-goodsid="' + res.newgoods.goods_id + '">' +
                '<td>' + res.newgoods.goods_id + '</td>' +
                '<td><img src="/eshop/resources' + res.newgoods.goods_pic +
                '" style="height:56px;width:56px;" class="border">' +
                '</td>' +
                '<td>' + res.newgoods.goods_name + '</td>' +
                '<td>' + res.newgoods.goods_price + '</td>' +
                '<td><input type="number" name="number" value="' + res.newgoods.goods_count +
                '" min="1" max="99" id="number' + res.newgoods.goods_id +
                '" required="required" onblur="CartBlur(' + res.newgoods.goods_id + ')"></td> ' +
                '<td><span id="totalprice' + res.newgoods.goods_id + '">' + res.newgoods.goods_count * res
                .newgoods.goods_price + '</span></td>' +
                '<td>' +
                '<a href="#" class="btn btn-sm btn-outline-primary" onclick="delCart(' + res.newgoods
                .goods_id + ')" id="del' + res
                .newgoods.goods_id + '">' +
                '删除' +
                '</a>' +
                '</td>' +
                '</tr>' +
                '</tbody>' +
                '</table>' +
                '<hr class="m-0">' +
                '<div class="d-flex p-3 justify-content-between">' +
                '<div class="float-left">' +
                '<a href="#" class="pl-2" onclick="clearCart()">' +
                '清空购物车' +
                '</a>' +
                '</div>' +
                '<div class="pr-2">' +
                '<span>已选<span id="cart_num">' + res.size +
                '</span>件商品&nbsp;合计(不含运费)￥<span id="cart_sum">' + res.newgoods.goods_count * res.newgoods
                .goods_price + '</span></span>' +
                '</div>' +
                '</div>');
              $('#cart-body').next().prepend(
                '<button type="submit" class="btn btn-primary" id="cart_ok_down">' +
                '确认下单' +
                '</button >');
            } else {
              var old_price = $('#cart_sum').html();
              old_price = Number(old_price);
              var new_price = old_price + res.newgoods.goods_count * res.newgoods.goods_price;
              var is_newShop = $('tr[data-goodsid=' + res.newgoods.goods_id + ']').length == 0 ? true : false;
              if (is_newShop) {
                console.log("this is new goods");
                $('#cart-tbody').append(
                  '<tr data-goodsid="' + res.newgoods.goods_id + '">' +
                  '<td>' + res.size + '</td>' +
                  '<td><img src="/eshop/resources' + res.newgoods.goods_pic +
                  '" style="height:56px;width:56px;" class="border">' +
                  '</td>' +
                  '<td>' + res.newgoods.goods_name + '</td>' +
                  '<td>' + res.newgoods.goods_price + '</td>' +
                  '<td><input type="number" name="number" value="' + res.newgoods.goods_count +
                  '" min="1" max="99" id="number' + res.newgoods.goods_id +
                  '" required="required" onblur="CartBlur(' + res.newgoods.goods_id + ')"></td>' +
                  '<td><span id="totalprice' + res.newgoods.goods_id + '">' + res.newgoods.goods_count * res
                  .newgoods.goods_price + '</span></td>' +
                  '<td>' +
                  '<a href="#" class="btn btn-sm btn-outline-primary" onclick="delCart(' + res.newgoods
                  .goods_id + ')" id="del' + res.newgoods.goods_id + '">' +
                  '删除' +
                  '</a>' +
                  '</td>' +
                  '</tr>'
                );
                $('#cart_num').html(res.size);
                $('#cart_sum').html(new_price);
              } else {
                console.log("this is old goods");

                var old_number = $('#number' + res.newgoods.goods_id + '').val() * 1;
                $('#number' + res.newgoods.goods_id + '').val(res.newgoods.goods_count);

                $('#totalprice' + res.newgoods.goods_id + '').html(res.newgoods.goods_count * res.newgoods
                  .goods_price);

                var old_price = $('#cart_sum').html();
                console.log("old price = " + old_price);
                old_price = Number(old_price);
                var new_price = old_price + ((res.newgoods.goods_count - old_number) * res.newgoods
                  .goods_price);
                console.log("new price = " + new_price);
                $('#cart_sum').html(new_price);
              }
            }
          }, "json");
        return false;
      });
    });

    function delCart(goods_id) {
      $.post("${pageContext.request.contextPath}/goods/delCart.goods", {
          "goods_id": goods_id
        },
        function (res) {
          if (res.success) {
            if (res.size == 0) {
              $('tr[data-goodsid=' + goods_id + ']').remove();
              $('#cart-body').html(
                '<strong class="p-2">' +
                '目前购物车为空，快去购物把' +
                '</strong>');
              $('#cart_ok_down').remove();
              $('#user_cart_count').html('0');
            } else {
              console.log(res.size);
              $('#cart_num').html(res.size);

              var tr_goods = $("tr[data-goodsid=" + goods_id + "]");
              // 更新其后节点的序号
              tr_goods.nextAll().each(function () {
                var td_now = $(this).children().first();
                var now_index = Number(td_now.html());
                td_now.html(now_index - 1);
              });

              var totalprice = '#totalprice' + goods_id + '';
              var old_price = $(totalprice).html();
              old_price = Number(old_price);

              var old_sum = $('#cart_sum').html();
              old_sum = Number(old_sum);

              $('#cart_sum').html(old_sum - old_price);
              $('tr[data-goodsid=' + goods_id + ']').remove();
              $('#user_cart_count').html(res.size);
            }
          } else {
            console.log("ERROR::未知错误");
          }
        },
        "json");
    };

    function clearCart() {
      $.post("${pageContext.request.contextPath}/goods/clearCart.goods",
        true,
        function (res) {
          if (res.success) {
            $('#cart-body').html(
              '<strong class="p-2">' +
              '目前购物车为空，快去购物把' +
              '</strong>'
            );
            $('#user_cart_count').html("0");
            $('#cart_ok_down').remove();
          }
        }, "json");
    };

    function CartBlur(goods_id) {
      var goods_count = $('#number' + goods_id + '').val();
      if (goods_count > 0) {
        $.post('${pageContext.request.contextPath}/goods/cartNumberAdd.goods', {
            "goods_count": goods_count,
            "goods_id": goods_id
          },
          function (res) {
            if (res.success) {
              console.log("success");
            } else {
              console.log("fail");
            }
          }, 'json'
        );
      } else {
        alert("请输入大于0的数字");
      }
    };
  </script>
</head>

<body>
  <%@ include file="../nav.jsp" %>
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
            <a href="${pageContext.request.contextPath }/resources${good.goods_pic }" title="Images" class="MagicZoom" id="MagicZoom"><img
                width="350px" height="350px" src="${pageContext.request.contextPath }/resources${good.goods_pic }" /></a>
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
          <script src="${pageContext.request.contextPath }/resources/zoom/js/ShopShow.js"></script>
          <img class="MagicZoomLoading" width="16" height="16" src="${pageContext.request.contextPath }/resources/zoom/images/loading.gif"
            alt="Loading..." />
        </div>
      </div>
      <div class="col-md-8">
        <h5>${good.goods_name }</h5>
        <div class="p-4 bg-light border">
          <p class="text-secondary">
            促销价：<span class="text-danger">￥<strong style="font-size: 20px;">${good.goods_discount
                }</strong></span>
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
          <input name="goods_oldprice" id="goods_oldprice" value="${good.goods_price }" type="hidden">
          <input name="goods_postalfee" id="goods_postalfee" value="${good.goods_postalfee }" type="hidden">
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
                <img src="${pageContext.request.contextPath }/resources${good.goods_pic }" style="width:400px;" class="mb-2">
              </div>

              <c:forEach var="i" items="${good.pic }">
                <div class="d-flex justify-content-center">
                  <img src="${pageContext.request.contextPath }/resources${i.pic_url }" style="width:400px;" class="mb-2">
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="../footer.jsp" %>

</body>

</html>