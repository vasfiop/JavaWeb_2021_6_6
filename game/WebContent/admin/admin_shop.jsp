<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>管理员商品列表界面</title>

  <%@ include file="../head.jsp"%>
</head>

<body>
  <!-- 首页导航栏 -->
  <%@ include file="admin_nav.jsp"%>

  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="card bg-default">
          <div class="card-header">
            <form role="form" class="form-inline" action="admin_shop" method="POST">
              <div class="form-group">
                <input type="text" class="form-control" name="s_name" placeholder="按商品名搜索" value="${param.s_name }" />
              </div>
              &nbsp;&nbsp;&nbsp;
              <div class="form-group">
                <select class="form-control" name="s_sort">
                  <option value="">所有分类</option>
                  <c:forEach var="i" items="${sort }">
                    <option value="${i.id }" ${param.s_sort==i.id? 'selected' :'' }>${i.sortname }</option>
                  </c:forEach>
                </select>
              </div>
              <!-- FIXME 这里可能需要ajax进行异步加载 -->

              <!-- &nbsp;&nbsp;&nbsp;
              <div class="form-group">
                <select class="form-control" name="s_type">
                  <option value="">所有种类</option>
                  <option value="1">平板电脑</option>
                  <option value="2">冰箱洗衣机</option>
                  <option value="3">空调</option>
                  <option value="4">厨卫大电</option>
                  <option value="5">厨房小电</option>
                  <option value="6">生活电器</option>
                  <option value="7">个护健康</option>
                  <option value="8">店铺热销</option>
                </select>
              </div>  -->

              &nbsp;&nbsp;&nbsp;
              <button type="submit" class="btn btn-outline-primary">
                搜索</button>
              &nbsp;&nbsp;&nbsp; <a href="admin_shop_add?mode=1" role="button" class="btn btn-outline-success"> 添加商品
              </a>
            </form>
          </div>
          <div class="card-body" style="padding-top: 0; padding-bottom: 0;">
            <table class="table table-hover table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>名称</th>
                  <th style="width: 500px;">标题</th>
                  <th>商品分类</th>
                  <th>商品种类</th>
                  <th>价格</th>
                  <th>图片</th>
                  <th>备注</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="i" items="${shops }" varStatus="vs">
                  <tr>
                    <td>${vs.count }</td>
                    <td>${i.shopname }</td>
                    <td style="width: 500px;">${i.title }</td>
                    <td>${i.sortname }</td>
                    <td>${i.typename }</td>
                    <td>${i.price }</td>
                    <td><img src="../resources/img/test_180_180.jpg" style="width: 100px; height: 100px;"></td>
                    <c:if test="${i.comment == 0 }">
                      <td></td>
                    </c:if>
                    <c:if test="${i.comment != 0 }">
                      <td>京东秒杀${i.comment }</td>
                    </c:if>
                    <td>
                      <a href="admin_shop_edit?id=${i.id }&mode=0" role="button"
                        class="btn btn-outline-warning btn-sm">修改</a>
                      <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该商品吗',
                      '${pageContext.request.contextPath}/admin/admin_shop_del','${i.id}','ajax_no')">删除</button>
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