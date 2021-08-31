<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <title>随意购商城首页</title>
  <%@ include file="../header.jsp"%>
  <script type="text/javascript">
    function cancel(order_id) {
      $.post("${pageContext.request.contextPath}/cart/cancel.cart", {
          "order_id": order_id
        },
        function (res) {
          $('#order_mode' + res.order_id).html("订单取消,交易关闭");
          $('#order_operation_' + res.order_id).children().each(function () {
            $(this).remove();
          });
          $('#order_operation_' + res.order_id).html(
            '<div><a href="#" style="color: white;font-size:12px;" onclick="del(${res.order_id })">删除订单</a></div>');
        }, "json");
    };

    function del(order_id) {
      $.post("${pageContext.request.contextPath}/cart/del.cart", {
        "order_id": order_id
      }, function (res) {
        $('#list_group_' + res.order_id).remove();
      }, "json");
    };
  </script>
</head>

<body>
  <%@ include file="../nav.jsp"%>

  <div class="container mt-4">
    <div class="row">
      <div class="col-md-12">
        <div class="row">
          <div class="col-md-2">
            <div class="list-group">
              <%@ include file="./left_nav.jsp"%>
            </div>
          </div>
          <div class="col-md-10">

            <c:forEach var="i" items="${orders }">
              <div class="list-group mb-4" id="list_group_${i.order_id }">
                <div class="list-group-item list-group-item-action active">
                  <p style="font-size: 12px">
                    下单日期：${i.order_date }&nbsp;&nbsp;&nbsp;订单号：${i.order_code
                    }&nbsp;&nbsp;&nbsp;&nbsp;订单状态：
                    <span id="order_mode${i.order_id }">
                      ${i.order_status == '1' ? '订单完成' : i.order_status == '2' ? '等待付款' : '订单取消,交易关闭' }
                    </span>
                  </p>

                  <div class="d-flex flex-row-reverse" id="order_operation_${i.order_id }">
                    <c:if test="${i.order_status != '2' }">
                      <div><a href="#" style="color: white;font-size:12px;" onclick="del(${i.order_id })">删除订单</a></div>
                    </c:if>

                    <c:if test="${i.order_status == '2' }">
                      <div>
                        <a href="/eshop/cart/payment.cart?order_id=${i.order_id }"
                          style=" color: white;font-size:12px;">去付款</a>
                      </div>
                      <div>
                        <a href="#" style="color: white;font-size:12px;"
                          onclick="cancel(${i.order_id })">取消订单&nbsp;&nbsp;&nbsp;&nbsp;</a>
                      </div>
                    </c:if>

                  </div>
                </div>
                <div class="list-group-item">
                  <table class="table table-sm table-bordered m-0">
                    <tbody>
                      <c:set var="sum" value="${0 }" />
                      <c:forEach var="j" items="${i.goods }">
                        <tr>
                          <td style="width:60px;"><img
                              src="${pageContext.request.contextPath}/resources${j.odetail_pic }"
                              style="width:50px;height:50px;"></td>
                          <td style="width:390px;"><a
                              href="${pageContext.request.contextPath}/goods/gooditem.goods?goodsid=${j.goods_id }">${j.odetail_name
                              }</a></td>
                          <td>￥${j.odetail_price }</td>
                          <td>${j.odetail_num }</td>
                          <td>￥${j.odetail_num*j.odetail_price }</td>
                          <c:set var="sum" value="${sum+j.odetail_num*j.odetail_price }" />
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
                <div class="list-group-item">
                  <div class="d-flex justify-content-between">
                    <div>
                      <button type="button" class="btn btn-info">
                        查看订单详情
                      </button>
                    </div>
                    <div>总金额（含运费${i.order_postalfee }元）：￥${sum+i.order_postalfee }</div>
                  </div>
                </div>
              </div>
            </c:forEach>

          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="../footer.jsp"%>

</body>

</html>