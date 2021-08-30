<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <title>确定订单</title>
  <%@ include file="../header.jsp" %>
  <script type="text/javascript">
    function defaultAddress(addr_id) {
      var old_id = $('#old_default_id').val() * 1;
      $.post("${pageContext.request.contextPath}/user/defaultAddress.person", {
          "addr_id": addr_id
        },
        function (res) {
          if (res.success) {
            $('tr[data-addrid="' + old_id + '"]').children().eq(6).html(" ");
            $('tr[data-addrid="' + addr_id + '"]').children().eq(6).html("默认地址");
            $('#old_default_id').val(addr_id);
          } else {
            console.log("fail");
          }
        }, "json"
      );
    };

    function changeAddress(addr_id) {
      var trpos = $('tr[data-addrid=' + addr_id + ']').children();
      var addr_please = trpos.eq(2).html();
      var addr_content = trpos.eq(3).html();
      var addr_receiver = trpos.eq(4).html();
      var addr_tel = trpos.eq(5).html();

      var new_please = addr_please.split("-");

      var addr_province = new_please[0];
      var addr_city = new_please[1];
      var addr_area = new_please[2];

      $('#addr_province').val(addr_province);
      $('#addr_city').val(addr_city);
      $('#addr_area').val(addr_area);
      $('#addr_content').val(addr_content);
      $('#addr_receiver').val(addr_receiver);
      $('#addr_tel').val(addr_tel);

      path = "changeAddress";
      $('#addr_id').val(addr_id);
    };

    var path = "addAddress";
    $(function () {
      $('#add_new_address').on("hidden.bs.modal", function () {
        $("#addr_province").val('');
        $("#addr_city").val('');
        $("#addr_area").val('');
        $("#addr_content").val('');
        $("#addr_receiver").val('');
        $("#addr_tel").val('');
        path = "addAddress";
      });

      $('#form_address_change').submit(function () {
        var addr_province = $("#addr_province").val();
        var addr_city = $("#addr_city").val();
        var addr_area = $("#addr_area").val();
        var addr_content = $("#addr_content").val();
        var addr_receiver = $("#addr_receiver").val();
        var addr_tel = $("#addr_tel").val();

        console.log(path);

        $.post("${pageContext.request.contextPath}/user/" + path + ".person",
          $('#form_address_change').serialize(),
          function (res) {
            $('#add_new_address').modal('hide');
            if (res.success) {
              if (res.is_add) {
                var tr = $('#cart-table').length;
                console.log(tr);
                if (tr == 0) {
                  $('#cart-h6').remove();
                  $('#cart-table-parent').append(
                    '<table class="table" id="cart-table">' +
                    '<tbody>' +
                    '<input value="" id="old_default_id" name="old_default_id" type="hidden">' +
                    '<tr data-addrid="' + res.addr_id + '">' +
                    '<input value="1" type="hidden">' +
                    '<td>' +
                    '<div class="custom-control custom-radio">' +
                    '<input type="radio" class="custom-control-input" id="address1" name="address" checked value="' +
                    res.addr_id + '">' +
                    '<label class="custom-control-label" for="address1"></label>' +
                    '</div>' +
                    '</td>' +
                    '<td>' + addr_province + '-' + addr_city + '-' + addr_area + '</td>' +
                    '<td>' + addr_content + '</td>' +
                    '<td>' + addr_receiver + '</td>' +
                    '<td>' + addr_tel + '</td>' +
                    '<td></td>' +
                    '<td>' +
                    '<a onclick="changeAddress(' + res.addr_id +
                    ')" href="#add_new_address" role="button" data-toggle="modal">修改</a>' +
                    ' | ' +
                    '<a href="#" onclick="defaultAddress(' + res.addr_id + ')">设为默认地址</a></td>' +
                    '</tr>' +
                    '</tbody>' +
                    '</table>'
                  );
                } else {
                  console.log("不是第一个添加地址");
                  var last_count = $('#buygoods-address-tbody').children().last().children().first().val();
                  last_count = Number(last_count);
                  console.log("last_count = " + last_count);
                  $('#buygoods-address-tbody').append(
                    '<tr data-addrid="' + res.addr_id + '">' +
                    '<input value="' + (last_count + 1) +
                    '" type="hidden">' +
                    '<td>' +
                    '<div class="custom-control custom-radio">' +
                    '<input type="radio" class="custom-control-input" id="address' + (last_count + 1) +
                    '" name="address" checked value="' + res.addr_id + '">' +
                    '<label class="custom-control-label" for="address' + (last_count + 1) + '"></label>' +
                    '</div>' +
                    '</td>' +
                    '<td>' + addr_province + '-' + addr_city + '-' + addr_area + '</td>' +
                    '<td>' + addr_content + '</td>' +
                    '<td>' + addr_receiver + '</td>' +
                    '<td>' + addr_tel + '</td>' +
                    '<td></td>' +
                    '<td>' +
                    '<a onclick="changeAddress(' + res.addr_id +
                    ')" href="#add_new_address" role="button" data-toggle="modal">' +
                    '修改' +
                    '</a>' +
                    ' | ' +
                    '<a href="#" onclick="defaultAddress(' + res.addr_id + ')">' +
                    '设为默认地址' +
                    '</a>' +
                    '</td>' +
                    '</tr>'
                  );
                }
              } else {
                console.log("this is change function");
                var trpos = $('tr[data-addrid=' + res.addr_id + ']').children();
                var new_please = addr_province + "-" + addr_city + "-" + addr_area;
                trpos.eq(2).html(new_please);
                trpos.eq(3).html(addr_content);
                trpos.eq(4).html(addr_receiver);
                trpos.eq(5).html(addr_tel);
              }
            } else {

            }
          }, "json");

        return false;
      });
    });
  </script>
</head>

<body>
  <%@ include file="../nav.jsp" %>
  <form method="post" action="/eshop/cart/addCart.cart">
    <div class="container">
      <div class="row">
        <div class="col-md-12 mt-2">
          <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10" class="cart-table-parent">
              <c:if test="${not empty address }">
                <strong>确认收货地址</strong>
                <table class="table" id="cart-table">
                  <tbody id="buygoods-address-tbody">
                    <c:forEach var="i" items="${address }">
                      <c:if test="${i.addr_isdefault==1 }">
                        <input value="${i.addr_id }" id="old_default_id" name="old_default_id" type="hidden">
                      </c:if>
                    </c:forEach>
                    <c:forEach var="i" items="${address }" varStatus="vs">
                      <tr data-addrid="${i.addr_id }">
                        <input value="${vs.count }" type="hidden">
                        <td>
                          <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="address${vs.count }" name="address"
                              ${i.addr_isdefault==1 ? 'checked' : '' } value="${i.addr_id }">
                            <label class="custom-control-label" for="address${vs.count }"></label>
                          </div>
                        </td>
                        <td>${i.addr_province }-${i.addr_city }-${i.addr_area }</td>
                        <td>${i.addr_content }</td>
                        <td>${i.addr_receiver }</td>
                        <td>${i.addr_tel }</td>
                        <td>${i.addr_isdefault == 1 ?
                          '默认地址'
                          : '' }</td>
                        <td>
                          <a onclick="changeAddress(${i.addr_id })" href="#add_new_address" role="button"
                            data-toggle="modal">修改</a>
                          |
                          <a href="#" onclick="defaultAddress(${i.addr_id })">设为默认地址</a>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </c:if>
              <c:if test="${empty address }">
                <h6 id="cart-h6">您还没有地址</h6>
              </c:if>

              <a type="button" class="btn btn-info" href="#add_new_address" role="button" data-toggle="modal">添加收货地址</a>
              <div>
                <br class="mt-2 mb-2">
              </div>

              <strong>确认订单</strong>
              <table class="table m-0">
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
                  <c:set var="price" value="0" />
                  <c:set var="maxpso" value="0" />
                  <c:forEach varStatus="vs" var="i" items="${carts }">
                    <c:set var="j" value="${i.value }" />
                    <c:if test="${maxpso < j.goods_postalfee }">
                      <c:set var="maxpso" value="${j.goods_postalfee }" />
                    </c:if>
                    <tr data-goodsid="${j.goods_id }">
                      <td>${vs.count }</td>
                      <td><img src="/eshop/resources${j.goods_pic }" style="height: 24px; width: 24px;" class="border">
                      </td>
                      <td>${j.goods_name }</td>
                      <td>原价:￥${j.goods_oldprice }&nbsp;现售:￥${j.goods_price }</td>
                      <td>${j.goods_count }</td>
                      <td><span id="totalprice${j.goods_id }">${j.goods_price*j.goods_count }</span></td>
                    </tr>
                    <c:set var="price" value="${price+(j.goods_price*j.goods_count) }" />
                  </c:forEach>
                </tbody>
              </table>
              <hr class="m-0">
              <span class="d-flex justify-content-end">运费:￥${maxpso }</span>
			  <input type="hidden" name="status" value="${maxpso }">
              <hr class="m-0">
              <span class="d-flex justify-content-end">合计（含运费）:￥${price+maxpso }</span>
              <input type="hidden" name="allmoney" value="${price+maxpso }">
              <div class="d-flex justify-content-end mt-2">
                <div class="">
                  <button type="submit" class="btn btn-info">提交订单</button>
                </div>
              </div>

            </div>
            <div class="col-md-1"></div>
          </div>
        </div>
      </div>
    </div>
  </form>

  <%@ include file="../footer.jsp" %>

</body>

</html>