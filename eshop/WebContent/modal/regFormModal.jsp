<%@ page pageEncoding="UTF-8" %>
  <script type="text/javascript">
    $(function () {
      var username;

      $('#regForm').submit(function () {
        username = $('#userName').val();

        $.post('${pageContext.request.contextPath}/reg.home',
          $('#regForm').serialize(),
          function (res) {
            if (res.value == 1) {
              $('#loginPrompt').html(
                '<div class="alert alert-danger alert-dismissible fade show" role="alert">' +
                '两次输入密码不一致' +
                '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
                '<span aria-hidden="true">&times;</span></button></div>'
              );
            } else if (res.value == 0) {
              $('#regFormModal').modal('hide');
              $('#info').html(
                '<li class="breadcrumb-item"><span>' + username + ' 您好，欢迎来到随意购商城！</span>  </li>' +
                '<li class="breadcrumb-item"><a href="#">购物车</a></li>' +
                '<li class="breadcrumb-item"><a href="#">我的订单</a></li>' +
                '<li class="breadcrumb-item"><a href="#">个人中心</a></li>' +
                '<li class="breadcrumb-item"><a href="logout.home">退出登录</a></li>');
            } else {
              $('#loginPrompt').html(
                '<div class="alert alert-danger alert-dismissible fade show" role="alert">' +
                '遇到未知错误' +
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

  <div class="modal" id="regFormModal" role="dialog">
    <form role="form" id="regForm" method="post" action="${pageContext.request.contextPath}/reg.home">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">新用户注册</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <label for="userName"> 用户名 </label> <input class="form-control" name="userName" id="userName" type="text"
                placeholder="用户名" required />
            </div>
            <div class="form-group">
              <label for="userPass"> 密码 </label> <input class="form-control" name="userPass" id="userPass"
                type="password" placeholder="密码" required />
            </div>
            <div class="form-group">
              <label for="userPass1"> 密码确认 </label> <input class="form-control" name="userPass1" id="userPass1"
                type="password" placeholder="密码确认" required />
            </div>
            <div class="form-group">
              <label for="userAge"> 年龄</label> <input class="form-control" name="userAge" id="userAge" type="number"
                placeholder="年龄" />
            </div>
            <div class="form-group">
              <label for="userSex"> 性别 </label>
              <div class="radio">
                <label> <input type="radio" name="userSex" id="sex1" value="0" checked> 男
                </label> <label> <input type="radio" name="userSex" id="sex2" value="1"> 女
                </label>
              </div>
            </div>
            <div class="form-group">
              <label for="userEmail"> 邮箱</label> <input class="form-control" name="userEmail" id="userEmail"
                type="email" placeholder="Email" />
            </div>
            <div id="loginPrompt"></div>
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary" type="submit">注册</button>
            <button class="btn btn-default" type="button" data-dismiss="modal">关闭窗口</button>
          </div>
        </div>
      </div>
    </form>
  </div>