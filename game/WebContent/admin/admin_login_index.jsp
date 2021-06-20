<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>管理员登陆界面</title>

  <%@ include file="../head.jsp" %>
</head>

<body>
  <div class="d-flex p-3 bg-gray" style="height:100vh;">
    <div class="p-5 bg-white" style="margin:auto;">
      <form action="admin_login_check" method="POST">
        <h3 class="text-center mb-4">
          后台管理员系统
        </h3>
        <div class="input-group mb-4">
          <div class="input-group-prepend">
            <span class="input-group-text">账号</span>
          </div>
          <input type="text" class="form-control" placeholder="用户名" name="username">
        </div>
        <div class="input-group mb-4">
          <div class="input-group-prepend">
            <span class="input-group-text">密码</span>
          </div>
          <input type="password" class="form-control" placeholder="密码" name="password">
        </div>
        <button type="submit" class="btn btn-outline-primary btn-block mb-3">
          登陆
        </button>
      </form>
    </div>
  </div>
</body>

</html>