<%@ page pageEncoding="UTF-8" %>
<script type="text/javascript">
  $(function () {
    var username;

    $('#userName').blur(function () {
      username = $('#userName').val();
      if (username != '') {
        $.post('${pageContext.request.contextPath}/checkname.home', {
            "username": username
          },
          function (res) {
            if (res.value) {
              console.log("没有用户");
              $('#checkNameResult').html('');
            } else {
              console.log("有用户");
              $('#checkNameResult').html(
                '<div class="alert alert-danger alert-dismissible fade show" role="alert">' +
                '该用户名已被注册' +
                '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
                '<span aria-hidden="true">&times;</span></button></div>');
            }
          }, "json");
      }
    });

    $('#regForm').submit(function () {
      username = $('#userName').val();
      $.post('${pageContext.request.contextPath}/reg.home',
        $('#regForm').serialize(),
        function (res) {
          if (res.value == 1) {
            $('#regPrompt').html(
              '<div class="alert alert-danger alert-dismissible fade show" role="alert">' +
              '两次输入密码不一致' +
              '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
              '<span aria-hidden="true">&times;</span></button></div>'
            );
          } else if (res.value == 0) {
            $('#regFormModal').modal('hide');
            $('#info').html(
              '<li class="breadcrumb-item"><span>' + username + ' 您好，欢迎来到随意购商城！</span>  </li>' +
              '<li class="breadcrumb-item"><a href="#cartModal" data-toggle="modal">购物车</a><span class="badge badge-pill badge-success">0</span></li>' +
              '<li class="breadcrumb-item"><a href="#">我的订单</a></li>' +
              '<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/user/index.person">个人中心</a></li>' +
              '<li class="breadcrumb-item"><a href="logout.home">退出登录</a></li>');
            $(':input', '#checkNameResult',
                '#regForm')
              .not(
                ':button, :submit, :reset, :hidden')
              .val('')
              .removeAttr(
                'checked')
              .removeAttr(
                'selected');
            $("#toastTitle").html(
              "注册成功");
            $("#toastBody").html(
              "恭喜您，注册成功，已为您登录！");
            $(".toast").toast('show');
          } else {
            $('#regPrompt').html(
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
            <div id="checkNameResult"></div>
          </div>
          <div class="form-group">
            <label for="userPass"> 密码 </label> <input class="form-control" name="userPass" id="userPass" type="password"
              placeholder="密码" required />
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
            <label for="userEmail"> 邮箱</label> <input class="form-control" name="userEmail" id="userEmail" type="email"
              placeholder="Email" />
          </div>
          <div id="regPrompt"></div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary" type="submit">注册</button>
          <button class="btn btn-default" type="button" data-dismiss="modal">关闭窗口</button>
        </div>
      </div>
    </div>
  </form>
</div>