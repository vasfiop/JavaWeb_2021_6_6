<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>管理员种类添加界面</title>

  <%@ include file="../head.jsp" %>
</head>

<body>

  <div class="container-fluid">
    <div class="row">
      <div class="col-md-3">
      </div>
      <div class="col-md-6">
        <div class="card">
          <form role="form" action="new.admin_type" method="POST">
            <h5 class="card-header bg-success text-center text-white">
              添加种类
            </h5>
            <div class="card-body">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <label class="input-group-text" for="inputGroupSelect01">所属分类名称</label>
                </div>
                <select class="custom-select" name="sortid">
                  <c:forEach var="i" items="${sorts }">
                    <option value="${i.id }">${i.sortname }</option>
                  </c:forEach>
                </select>
              </div>

              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">种类名称</span>
                </div>
                <input type="text" class="form-control" name="typename">
              </div>

            </div>
            <div class="card-footer text-center">
              <button type="submit" class="btn btn-success">
                确认添加
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