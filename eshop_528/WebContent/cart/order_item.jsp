<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <title>随意购商城</title>
  <%@ include file="../header.jsp"%>
</head>

<body>
  <%@ include file="../nav.jsp"%>

  <div class="container mt-4">
    <div class="row">

      <div class="col-md-12">
        <div class="row">
          <h3 class="ml-3">订单信息</h3>
          <table class="table table-condensed table-hover">
            <tbody>
              <tr>
                <td>订单编号：${order_item.order_code }</td>
                <td>创建时间：${order_item.order_date }</td>
              </tr>
              <tr>
                <td>订单状态：<span>
                    <c:if test="${order_item.order_status == 2 }">
                      等待付款
                    </c:if>
                    <c:if test="${order_item.order_status == 3 }">
                      订单取消，交易关闭
                    </c:if>
                    <c:if test="${order_item.order_status == 1 }">
                      交易成功
                    </c:if>
                  </span>
                </td>
                <td>送货地址：${order_item.order_address }</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <div class="col-md-12 col-offset-1">
        <div class="card border-info">
          <div class="card-header">商品列表</div>
          <div class="card-body">
            <table class="table table-hover table-condensed">
              <thead>
                <tr>
                  <th>#</th>
                  <th>商品图片</th>
                  <th>商品名称</th>
                  <th>商品单价</th>
                  <th>数量</th>
                  <th>小计</th>
                </tr>
              </thead>
              <tbody>
                <c:set var="totalfee" value="${order_item.order_postalfee }" />
                <c:forEach items="${order_item.goods }" var="o" varStatus="vs">
                  <tr>
                    <td>${vs.count }</td>
                    <td><img src="${pageContext.request.contextPath}/resources${o.odetail_pic }" width="30" height="30">
                    </td>
                    <td><a
                        href="${pageContext.request.contextPath }/cart/payment.cart?order_id=${o.order_id }">${o.odetail_name
                        }</a>
                    </td>
                    <td>￥${o.odetail_price }元</td>
                    <td>${o.odetail_num}</td>
                    <td>￥${o.odetail_price*o.odetail_num }</td>
                    <c:set var="totalfee" value="${totalfee+o.odetail_price*o.odetail_num }" />
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
        <table class="table table-condensed">
          <tr>
            <td class="text-right">运费：￥${order_item.order_postalfee}</td>
          </tr>
          <tr>
            <td class="text-right">订单总金额（含运费）：￥${totalfee}</td>
          </tr>
        </table>
        <div class="col-12 text-right">
          <c:if test="${order_item.order_status == 2}">
            <a role="button" class="btn btn-success"
              href="/eshop/cart/payment.cart?order_id=${order_item.order_id }">去付款</a>
          </c:if>
          <a role="button" class="btn btn-primary"
            href="${pageContext.request.contextPath }/cart/allorder.cart">返回订单列表</a>
        </div>
      </div>

    </div>
  </div>

  <%@ include file="../footer.jsp"%>

</body>

</html>