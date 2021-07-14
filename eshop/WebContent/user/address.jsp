<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <title>随意购商城首页</title>
  <%@ include file="../header.jsp" %>
  <script type="text/javascript">
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
                var last_count = $('#address-tbody').children().last().children().first().html();
                last_count = Number(last_count);
                $('#address-tbody').append(
                  '<tr data-addrid="' + res.addr_id + '">' +
                  '<td>' + (last_count + 1) + '</td>' +
                  '<td>' + addr_province + '-' + addr_city + '-' + addr_area + '</td>' +
                  '<td>' + addr_content + '</td>' +
                  '<td>' + addr_receiver + '</td>' +
                  '<td>' + addr_tel + '</td>' +
                  '<td></td>' +
                  '<td>' +
                  '<a href="#" onclick="changeAddress(' + res.addr_id +
                  ')" href="#add_new_address" role="button" data-toggle="modal">' +
                  '修改' +
                  '</a>' +
                  ' | ' +
                  '<a href="#" onclick="delAddress(' + res.addr_id + ',0)" data-addrid="' + res.addr_id +
                  '">' +
                  '删除' +
                  '</a>' +
                  ' | ' +
                  '<a href="#" onclick="defaultAddress(' + res.addr_id + ')">' +
                  '设为默认地址' +
                  '</a>' +
                  '</td>' +
                  '</tr>'
                );
              } else {
                console.log("this is change function");
                var trpos = $('tr[data-addrid=' + res.addr_id + ']').children();
                var new_please = addr_province + "-" + addr_city + "-" + addr_area;
                trpos.eq(1).html(new_please);
                trpos.eq(2).html(addr_content);
                trpos.eq(3).html(addr_receiver);
                trpos.eq(4).html(addr_tel);
              }
            } else {

            }
          }, "json");

        return false;
      });
    });

    function changeAddress(addr_id) {
      var trpos = $('tr[data-addrid=' + addr_id + ']').children();
      var addr_please = trpos.eq(1).html();
      var addr_content = trpos.eq(2).html();
      var addr_receiver = trpos.eq(3).html();
      var addr_tel = trpos.eq(4).html();

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

    function delAddress(addr_id, addr_isdefault) {
      if (addr_isdefault == 1) {
        alert("默认地址不可删除");
      } else {
        if (confirm("你确定要删除该地址吗?")) {
          $.post("${pageContext.request.contextPath}/user/delAddress.person", {
              "addr_id": addr_id
            },
            function (res) {
              console.log("del return function");
              if (res.success) {
                console.log("success");

                var tr_goods = $("tr[data-addrid=" + addr_id + "]");
                // 更新其后节点的序号
                tr_goods.nextAll().each(function () {
                  var td_now = $(this).children().first();
                  var now_index = Number(td_now.html());
                  td_now.html(now_index - 1);
                });

                $('tr[data-addrid=' + addr_id + ']').remove();
              } else {
                console.log("fail");
              }
            }, "json"
          );
        }
      }
    };

    function defaultAddress(addr_id) {
      // var td = $("td");
      // var id;
      // for (let index = 0; index < td.length; index++) {
      //   if (td.eq(index).attr("data-default") != null) {
      //     id = td.eq(index).attr("data-default")
      //   }
      // }
      // console.log(id);
      var old_id = $('#old_default_id').val() * 1;

      $.post("${pageContext.request.contextPath}/user/defaultAddress.person", {
          "addr_id": addr_id
        },
        function (res) {
          if (res.success) {
            $('tr[data-addrid="' + old_id + '"]').children().eq(5).html("");
            $('tr[data-addrid="' + addr_id + '"]').children().eq(5).html("默认地址");
            $('#old_default_id').val(addr_id);

            $('a[data-addrid="' + old_id + '"]').attr("onclick", "delAddress(" + old_id + ",0)");
            $('a[data-addrid="' + addr_id + '"]').attr("onclick", "delAddress(" + addr_id + ",1)");
          } else {
            console.log("fail");
          }
        }, "json"
      );
    };
  </script>
</head>

<body>
  <%@ include file="../nav.jsp" %>

  <div class="container mt-4">
    <div class="row">
      <div class="col-md-12">
        <div class="row">
          <div class="col-md-2">
            <div class="list-group">
              <%@ include file="./left_nav.jsp" %>
            </div>
          </div>
          <div class="col-md-10">
            <a type="button" class="btn btn-info" href="#add_new_address" role="button" data-toggle="modal">添加收货地址</a>
            <c:if test="${empty address }">
              <h3>
                地址为空，请添加地址
              </h3>
            </c:if>

            <c:if test="${not empty address }">
              <table class="table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>省-市-区</th>
                    <th>街道</th>
                    <th>收件人</th>
                    <th>电话</th>
                    <th>默认地址</th>
                    <th>操作</th>
                  </tr>
                </thead>
                <tbody id="address-tbody">
                  <c:forEach var="i" items="${address }">
                    <c:if test="${i.addr_isdefault==1 }">
                      <input value="${i.addr_id }" id="old_default_id" name="old_default_id" type="hidden">
                    </c:if>
                  </c:forEach>
                  <c:forEach var="i" items="${address }" varStatus="vs">
                    <tr data-addrid="${i.addr_id }">
                      <td>${vs.count }</td>
                      <td>${i.addr_province }-${i.addr_city }-${i.addr_area }</td>
                      <td>${i.addr_content }</td>
                      <td>${i.addr_receiver }</td>
                      <td>${i.addr_tel }</td>
                      <td ${i.addr_isdefault==1 ? 'data-default=' : '' }"${i.addr_id }">${i.addr_isdefault == 1 ?
                        '默认地址'
                        : '' }</td>
                      <td>
                        <a onclick="changeAddress(${i.addr_id })" href="#add_new_address" role="button"
                          data-toggle="modal">
                          修改
                        </a>
                        |
                        <a href="#" onclick="delAddress(${i.addr_id },${i.addr_isdefault} )"
                          data-addrid="${i.addr_id }">
                          删除
                        </a>
                        |
                        <a href="#" onclick="defaultAddress(${i.addr_id })">
                          设为默认地址
                        </a>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </c:if>

          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="../footer.jsp" %>
  <%@ include file="../modal/loginFormModal.jsp" %>
  <%@ include file="../modal/regFormModal.jsp" %>
  <%@ include file="../modal/cartModal.jsp" %>

  <div class="modal fade" id="add_new_address" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <form action="${pageContext.request.contextPath}/user/addAddress.person" method="post" id="form_address_change">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="myModalLabel">
              添加修改收货地址
            </h5>
            <button type="button" class="close" data-dismiss="modal">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-md-6">
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">省</span>
                  </div>
                  <input type="text" class="form-control" placeholder="省" id="addr_province" name="addr_province"
                    required>
                </div>
              </div>
              <div class="col-md-6">
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">市</span>
                  </div>
                  <input type="text" class="form-control" placeholder="市" id="addr_city" name="addr_city" required>
                </div>
              </div>
              <div class="col-md-6">
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">区</span>
                  </div>
                  <input type="text" class="form-control" placeholder="区" id="addr_area" name="addr_area" required>
                </div>
              </div>
              <div class="col-md-6">
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">街道</span>
                  </div>
                  <input type="text" class="form-control" placeholder="街道" id="addr_content" name="addr_content"
                    required>
                </div>
              </div>
              <div class="col-md-6">
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">收件人</span>
                  </div>
                  <input type="text" class="form-control" placeholder="收件人" id="addr_receiver" name="addr_receiver"
                    required>
                </div>
              </div>
              <div class="col-md-6">
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">联系电话</span>
                  </div>
                  <input type="text" class="form-control" placeholder="联系电话" id="addr_tel" name="addr_tel" required>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">
              确定
            </button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">
              关闭窗口
            </button>
          </div>
        </div>
        <input value="" id="addr_id" name="addr_id" type="hidden">
      </form>
    </div>
  </div>


</body>

</html>