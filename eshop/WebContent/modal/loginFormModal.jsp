<%@ page pageEncoding="UTF-8" %>
  <script type="text/javascript">
    $(function () {
      var username;
      var password;

      $('#loginform').submit(function () {
        username = $('#username').val();
        password = $('#password').val();

        $.post("${pageContext.request.contextPath}/login.home",
          { "username": username, "password": password },
          function (res) {
            if (res.login) {
              $('#loginFormModal').modal('hide');
              $('#info').html(
                '<li class="breadcrumb-item"><span>' + username + ' 您好，欢迎来到随意购商城！</span>  </li>' +
                '<li class="breadcrumb-item"><a href="#">购物车</a></li>' +
                '<li class="breadcrumb-item"><a href="#">我的订单</a></li>' +
                '<li class="breadcrumb-item"><a href="#">个人中心</a></li>' +
                '<li class="breadcrumb-item"><a href="logout.home">退出登录</a></li>');
            } else {
              $('#loginPrompt').html(
                '<div class="alert alert-warning alert-dismissible fade show" role="alert">' +
                '用户名或密码错误' +
                '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
                '<span aria-hidden="true">&times;</span></button></div>'
              );
            }
          },
          "json");
        return false;
      });
    });
  </script>
  <div class="modal" id="loginFormModal" role="dialog">
    <form role="form" action="${pageContext.request.contextPath}/login.home" method="post" id="loginform">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">用户登录</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <label>用户名</label><input type="text" class="form-control" id="username" required />
            </div>
            <div class="form-group">
              <label>密码</label><input type="password" class="form-control" id="password" required />
            </div>
            <div id="loginPrompt"></div>
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary" type="submit">登录</button>
            <button class="btn btn-default" type="button" data-dismiss="modal" <c:if
              test="${!empty backUrl}">onclick=closeLogForm('${backUrl}')</c:if> >
              关闭窗口
            </button>
          </div>
        </div>
      </div>
    </form>
  </div>