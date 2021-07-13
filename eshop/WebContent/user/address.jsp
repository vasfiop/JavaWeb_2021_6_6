<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <title>随意购商城首页</title>
  <%@ include file="../header.jsp"%>
  <script type="text/javascript">

  </script>
</head>

<body>
  <%@ include file="../nav.jsp"%>

  <div class="container mt-4">
    <div class="row">
      <div class="col-md-12">
        <div class="row">
          <div class="col-md-2">
            <div class="list-group">
              <%@ include file="./left_nav.jsp"%>
            </div>
          </div>
          <div class="col-md-10">
            <button type="button" class="btn btn-info">添加收货地址</button>
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
              <tbody>
                <tr>
                  <td>1</td>
                  <td>省-市-区</td>
                  <td>街道</td>
                  <td>收件人</td>
                  <td>电话</td>
                  <td>默认地址</td>
                  <td>
                    <a type="button" class="btn-link btn-sm">
                      修改
                    </a>
                    |
                    <a type="button" class="btn-link btn-sm">
                      删除
                    </a>
                    |
                    <a type="button" class="btn-link btn-sm">
                      设为默认地址
                    </a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="../footer.jsp"%>
  <%@ include file="../modal/loginFormModal.jsp"%>
  <%@ include file="../modal/regFormModal.jsp"%>
</body>

</html>