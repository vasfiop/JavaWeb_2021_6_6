<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
  <title>管理员管理菜品信息</title>

  <%@ include file="../head.jsp" %>

</head>

<body>
  
  <%@ include file="admin_nav.jsp" %>

  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
            <!-- 搜索表单 -->
            <form role="form" class="form-inline">
              <div class="form-group">
                <input type="text" class="form-control" id="exampleInputEmail1" name="s_fn" placeholder="按菜名搜索" />
              </div>
              &nbsp;&nbsp;&nbsp;
              <div class="form-group">
                <select class="form-control" name="s_type">
                  <option value="">所有分类</option>
                  <option value="1">家常</option>
                  <option value="2">凉菜</option>
                  <option value="3">主食</option>
                  <option value="4">饮品</option>
                </select>
              </div>
              &nbsp;&nbsp;&nbsp;
              <a href="admin_food_list.html" role="button" class="btn btn-outline-primary">
                搜索
              </a>
              &nbsp;&nbsp;&nbsp;
              <a href="admin_food_add.html" role="button" class="btn btn-outline-success">
                添加菜品
              </a>
            </form>
          </div>
          <div class="card-body">
            <!-- table -->
            <form action="user_dc_show.html" method="POST">
              <table class="table table-hover table-striped">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>菜名</th>
                    <th>特色</th>
                    <th>主料</th>
                    <th>价格</th>
                    <th>分类</th>
                    <th>图片</th>
                    <th>点餐率</th>
                    <th>备注</th>
                    <th>选择</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="i" items="${foods }" varStatus="vs">
                  <tr>
                    <th>${vs.count }</th>
                    <td>${i.foodname }</td>
                    <td>${i.feature }</td>
                    <td>${i.material }</td>
                    <td>${i.price }</td>
                    <td>${i.typename }</td>
                    <td><img alt="瘦身苹果牛奶饮" src="../resources/${i.picture }" class="rounded" /></td>
                    <td>${i.hits }次</td>
                    <c:if test="${i.comment == -1 }">
                    <td>正常菜</td>
                    </c:if>
                    <c:if test="${i.comment == 0 }">
                    <td>厨师推荐</td>
                    </c:if>
                    <c:if test="${i.comment > 0 }">
                    <td>${i.comment }</td>
                    </c:if>
                    <td>
                      <a href="admin_food_edit.html" role="button" class="btn btn-outline-warning btn-sm">修改</a>
                      <a href="#modal_del" role="button" class="btn btn-outline-danger btn-sm"
                        data-toggle="modal">删除</a>
                    </td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </form>
          </div>
          <div class="card-footer">
            <!-- 居右的分页处理 -->
            <nav>
              <ul class="pagination justify-content-center">
                <li class="page-item">
                  <a class="page-link" href="#">&lt;&lt;</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">4</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">5</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">&gt;&gt;</a>
                </li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 删除模态框 -->
  <div class="modal fade" id="modal_del" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-primary">
          <h5 class="modal-title text-white" id="myModalLabel">
            删除确认
          </h5>
          <button type="button" class="close" data-dismiss="modal">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <h4 class="text-danger">
            确定要删除该菜品吗？
          </h4>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">
            取消
          </button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">
            确定
          </button>
        </div>
      </div>
    </div>
  </div>

</body>

</html>