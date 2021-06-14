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

  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="row">
          <div class="col-md-1">
          </div>
          <div class="col-md-10">
            <div class="row">
              <div class="col-md-5">
                <div class="card">
                  <div class="card-header">
                    <!-- 搜索表单 -->
                    <form role="form" class="form-inline" method="post" action="admin_type?mode=sort">
                      <div class="form-group">
                        <input type="text" class="form-control" name="s_sort" placeholder="按分类名搜索"
                          value="${param.s_sort }" />
                      </div>
                      &nbsp;&nbsp;&nbsp;
                      <button type="submit" class="btn btn-outline-primary">搜索</button>
                      &nbsp;&nbsp;&nbsp;
                      <a href="admin_sort_add?mode=0" role="button" class="btn btn-outline-success">
                        添加分类
                      </a>
                    </form>
                  </div>
                  <div class="card-body" style="padding-top: 0;padding-bottom: 0;">
                    <table class="table table-hover table-striped">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>分类名称</th>
                          <th>操作</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="i" items="${sort }" varStatus="vs">
                          <tr>
                            <th>${vs.count }</th>
                            <td>${i.sortname }</td>
                            <td>
                              <a href="admin_type_edit?id=1" role="button" class="btn btn-outline-warning btn-sm">修改</a>
                              <button class="btn btn-outline-danger btn-sm"
                                onclick="delConfirm('确定要删除该分类吗(分类下无种类)',
                      		  '${pageContext.request.contextPath}/admin/admin_type_del?mode=sort','${i.id}','ajax_no')">删除</button>
                            </td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              <div class="col-md-7">
                <div class="card">
                  <div class="card-header">
                    <form role="form" class="form-inline" method="post" action="admin_type?mode=type">
                      <div class="form-group">
                        <input type="text" class="form-control" name="s_type" placeholder="按种类名搜索"
                          value="${param.s_type }" />
                      </div>
                      &nbsp;&nbsp;&nbsp;
                      <button type="submit" class="btn btn-outline-primary">搜索</button>
                      &nbsp;&nbsp;&nbsp;
                      <a href="admin_type_add?mode=0" role="button" class="btn btn-outline-success">
                        添加种类
                      </a>
                    </form>
                  </div>
                  <div class="card-body" style="padding-top: 0;padding-bottom: 0;">
                    <table class="table table-hover table-striped">
                      <thead>
                        <tr>
                          <th>分类名称</th>
                          <th>种类名称</th>
                          <th>操作</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="i" items="${type }">
                          <tr>
                            <th>${i.sortname }</th>
                            <td>${i.typename }</td>
                            <td>
                              <a href="admin_type_edit?id=1" role="button" class="btn btn-outline-warning btn-sm">修改</a>
                              <button class="btn btn-outline-danger btn-sm"
                                onclick="delConfirm('确定要删除该种类吗(种类下无商品)',
                      		  '${pageContext.request.contextPath}/admin/admin_type_del?mode=type','${i.id}','ajax_no')">删除</button>
                            </td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-1"></div>
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
          <button type="button" class="btn btn-danger" data-dismiss="modal" id="delButtonConfirm">删除</button>
        </div>
      </div>
    </div>
  </div>

  <script>
    function delConfirm(prompt, delAddr, id, ajaxRequest) {
      $('#prompt').html(prompt);
      $('#url').val(delAddr + '&id=' + id);
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