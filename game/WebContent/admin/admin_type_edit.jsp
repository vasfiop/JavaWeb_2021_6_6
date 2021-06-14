<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>管理员种类修改界面</title>

  <%@ include file="../head.jsp" %>
</head>

<body>
  <!-- 首页导航栏 -->
  <%@ include file="admin_nav.jsp" %>

  <div class="container-fluid">
    <div class="row">
      <div class="col-md-3">
      </div>
      <div class="col-md-6">
        <div class="card">
          <form role="form" action="admin_type_edit?id=${param.id }&mode=1" method="POST">
            <h5 class="card-header bg-warning text-center text-white">
              修改种类
            </h5>
            <div class="card-body">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <label class="input-group-text" for="inputGroupSelect01">所属分类名称</label>
                </div>
                <select class="custom-select" name="typeid">
                  <c:forEach var="i" items="${sort }">
                    <option value="${i.id }" ${i.id == type.typeid ? 'selected' : '' }>${i.sortname }</option>
                  </c:forEach>
                </select>
              </div>

              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">种类名称</span>
                </div>
                <input type="text" class="form-control" name="typename" value="${type.typename }">
              </div>

            </div>
            <div class="card-footer text-center">
              <button type="submit" class="btn btn-warning">
                确认修改
              </button>
              &nbsp;&nbsp;
              <a href="javascript:history.back()">
                放弃返回
              </a>
            </div>
          </form>
        </div>
      </div>
      <div class="col-md-3">
      </div>
    </div>
  </div>

</body>

</html>