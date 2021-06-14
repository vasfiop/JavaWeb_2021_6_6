<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>管理员用户列表界面</title>

  <%@ include file="../head.jsp" %>
</head>

<body>
  <!-- 首页导航栏 -->
  <%@ include file="admin_nav.jsp" %>

  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
            <div class="container">
              <div class="row">
                <div class="col-md-12">
                  <!-- 搜索表单 -->
                  <form role="form" class="form-inline" action="admin_user_list?mode=1" method="POST">
                    <div class="form-group">
                      <input type="text" class="form-control" name="username" placeholder="按用户名搜索" value="${param.username }" />
                    </div>
                    &nbsp;&nbsp;&nbsp;
                    <button type="submit" class="btn btn-outline-success">
                      搜索</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div class="card-body">
            <!-- table -->
            <table class="table table-hover table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>用户名</th>
                  <th>角色</th>
                  <th>电话</th>
                  <th>操作</th>
                  <th>状态</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="i" items="${users }" varStatus="vs">
                  <tr>
                    <th>${vs.count }</th>
                    <td>${i.username }</td>
                    <td>${i.mode == 1?'管理员':'用户'}</td>
                    <td>${i.telephone }</td>
                    <td>
                      <button class="btn btn-outline-warning btn-sm" onclick="delConfirm('确定要${i.frozen == 1? '激活':'冻结' }该用户吗',
                      '${pageContext.request.contextPath}/admin/admin_user_frozen','${i.id}&mode=${i.frozen == 1? '0':'1' }','ajax_no')">${i.frozen == 1? '激活':'冻结' }</button>
                      <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该用户吗',
                      '${pageContext.request.contextPath}/admin/admin_user_del','${i.id}','ajax_no')">删除</button>
                    </td>
                    <td>${i.frozen == 1?'冻结':'激活'}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>

        </div>
      </div>
    </div>
  </div>

  <!--删除确认框-->
  <div class="modal" role="dialog" id="delConfirmModal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">操作</h5>
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