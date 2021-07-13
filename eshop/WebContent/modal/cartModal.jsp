<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">

</script>
<form action="" method="post" role="form">
  <div class="modal fade" id="cartModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">

      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="myModalLabel">我的购物车</h5>
          <button type="button" class="close" data-dismiss="modal">
            <span aria-hidden="true">×</span>
          </button>
        </div>

        <div class="modal-body p-0" id="cart-body">
          <c:if test="${not empty sessionScope.carts }">
            <table class="table" id="cart-tab">
              <thead>
                <tr>
                  <th>#</th>
                  <th>商品图片</th>
                  <th>商品名称</th>
                  <th>商品单价</th>
                  <th>数量</th>
                  <th>小计</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody id="cart-tbody">
                <c:set var="count" value="0" />
                <c:set var="price" value="0" />
                <c:forEach varStatus="vs" var="i" items="${carts }">
                  <c:set var="j" value="${i.value }" />
                  <tr data-goodsid="${j.goods_id }">
                    <td>${vs.count }</td>
                    <td><img src="/eshop/resources${j.goods_pic }" style="height:56px;width:56px;" class="border">
                    </td>
                    <td>${j.goods_name }</td>
                    <td>${j.goods_price }</td>
                    <td><input type="number" name="number" value="${j.goods_count }" min="1" max="99"
                        id="number${j.goods_id }" required="required" onblur="CartBlur(${j.goods_id })"></td>
                    <td><span id="totalprice${j.goods_id }">${j.goods_price*j.goods_count }</span></td>
                    <td>
                      <a href="#" class="btn btn-sm btn-outline-primary" onclick="delCart(${j.goods_id })"
                        id="del${j.goods_id }">
                        删除
                      </a>
                    </td>
                  </tr>
                  <c:set var="price" value="${price+(j.goods_price*j.goods_count) }" />
                  <c:set var="count" value="${count+1 }" />
                </c:forEach>
              </tbody>
            </table>
            <hr class="m-0">
            <div class="d-flex p-3 justify-content-between">
              <div class="float-left">
                <a href="#" class="pl-2" onclick="clearCart()">
                  清空购物车
                </a>
              </div>
              <div class="pr-2">
                <span>已选<span id="cart_num">${count }</span>件商品&nbsp;合计(不含运费)￥<span id="cart_sum">${price
                    }</span></span>
              </div>
            </div>
          </c:if>

          <c:if test="${empty sessionScope.carts }">
            <strong class="p-2">
              目前购物车为空，快去购物把
            </strong>
          </c:if>

        </div>

        <div class="modal-footer">
          <c:if test="${not empty sessionScope.carts }">
            <button type="submit" class="btn btn-primary" id="cart_ok_down">
              确认下单
            </button>
          </c:if>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">
            关闭窗口</button>
        </div>

      </div>
    </div>
  </div>
</form>