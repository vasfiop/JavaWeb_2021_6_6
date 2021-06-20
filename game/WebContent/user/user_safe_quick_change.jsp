<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>修改个人资料</title>

  <%@ include file="../head.jsp"%>
</head>

<body>
  <%@ include file="../nav.jsp"%>

  <div class="container-fluid">
    <!-- 标题 -->
    <div class="row">
      <div class="col-md-12" style="background-color: white;">
        <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-10">

            <div class="row">
              <div class="col-md-2">
                <img src="../resources/img/nav_logo.jpg" style="width: 190px; height: 120px;">
              </div>
              <div class="col-md-10">
                <h4 style="margin-top: 80px;" class="float-left">我的京东</h4>
              </div>
            </div>

          </div>
          <div class="col-md-1"></div>
        </div>
      </div>
    </div>

  </div>

  <div class="container-fluid bg-gray">
    <div class="row">
      <div class="col-md-1"></div>
      <div class="col-md-10">
        <div class="d-flex p-3 text-black">
          <div class="p-2" style="margin: 0 auto;">
            <h3 class="text-center m-3">您已获得快速登陆口令!</h3>
            <h4 class="text-center m-3">请您牢记下列密码，已方便您登陆!</h4>
            <h6 class="text-center m-3">${quick }</h6>
            <a type="button" class="btn btn-outline-primary btn-block mb-3" href="">
              我记住了！
            </a>
          </div>
        </div>
      </div>
      <div class="col-md-1"></div>
    </div>
  </div>

  <%@ include file="../footer.jsp"%>
  <!--删除确认框-->
  <div class="modal" role="dialog" id="delConfirmModal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">警告！</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <h5 class="text-danger" id="prompt"></h5>
        </div>
        <div class="modal-footer">
          <input type="hidden" id="url" />
          <button type="button" class="btn btn-default" data-dismiss="modal">放弃</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal" id="delButtonConfirm">确定</button>
        </div>
      </div>
    </div>
  </div>

  <script>
    function delConfirm(prompt, delAddr, id, ajaxRequest) {
      $('#prompt').html(prompt);
      $('#url').val(delAddr + '?id=' + id);
      $('#delButtonConfirm').click(function () {
        if (ajaxRequest == 'ajax_no') {
          location.replace($('#url').val());
        } else if (ajaxRequest == 'ajax_yes') {
          $.ajax({
            type: "get",
            url: $('#url').val(),
            dataType: "json",
            success: function (data) {
              if (data.id != -1) {
                //删除页面节点
                $("button[name='delButton']").each(function () {
                  if ($(this).attr('data-value') == data.id) {
                    var tr = $(this).parent().parent();
                    tr.remove();
                  }
                });
              }
            }
          });
        }
      });
      $('#delConfirmModal').modal();
    }
  </script>
</body>

</html>