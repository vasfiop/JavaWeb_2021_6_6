<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>管理员商品列表界面</title>

  <%@ include file="../head.jsp" %>
</head>

<body>
  <!-- 首页导航栏 -->
  <%@ include file="admin_nav.jsp" %>

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
              &nbsp;&nbsp;&nbsp;
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
              </div> --%>
              &nbsp;&nbsp;&nbsp;
              <button type="submit" class="btn btn-outline-primary">
                搜索</button>
              &nbsp;&nbsp;&nbsp; <a href="admin_shop_add?mode=1" role="button" class="btn btn-outline-success">
                添加商品 </a>
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
                    <td><a href="admin_food_edit" role="button" class="btn btn-outline-warning btn-sm">修改</a> <a
                        type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#myModal">
                        删除 </a></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>

  <%-- 模态框 --%>
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- 模态框头部 -->
        <div class="modal-header">
          <h4 class="modal-title">模态框头部</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <!-- 模态框主体 -->
        <div class="modal-body">模态框内容..</div>
        <!-- 模态框底部 -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
        </div>
      </div>
    </div>
  </div>
</body>

</html>