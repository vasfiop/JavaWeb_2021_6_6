<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <title>随意购商城首页</title>
  <%@ include file="../header.jsp"%>
  <script type="text/javascript">
    function old_pass() {
      var password = $('#user_old_pass').val();
      if (password != "") {
        $.post("${pageContext.request.contextPath}/user/checkOldPass.person", {
            "old_pass": password
          },
          function (res) {
            if (res.success) {
              console.log("成功");
            } else {
              console.log("失败");
              alert("旧密码错误");
              $('#user_old_pass').val("");
            }
          }, "json");
      }
    };

    function new_pass() {
      var first_pass = $('#user_new_pass').val();
      var next_pass = $('#user_confirm_pass').val();
      if (next_pass != "" && Number(first_pass) != Number(next_pass)) {
        alert("两次密码输入不一样");
        $('#user_new_pass').val("");
        $('#user_confirm_pass').val("");
      }
    };
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
            <form role="form" action="changePass.person?user_id=${user.user_id }" method="post">
              <div class="form-group">
                <label for="user_name">
                  <strong>旧密码</strong>
                </label>
                <input type="password" class="form-control" id="user_old_pass" value="" onblur="old_pass()" required />
              </div>
              <div class="form-group">
                <label for="user_new_pass">
                  <strong>新密码</strong>
                </label>
                <input type="password" class="form-control" id="user_new_pass" name="user_new_pass" value="" onblur="" required />
              </div>
              <div class="form-group">
                <label for="user_confirm_pass">
                  <strong>新密码确认</strong>
                </label>
                <input type="password" class="form-control" id="user_confirm_pass" value="" onblur="new_pass()"
                  required />
              </div>
              <button type="submit" class="btn btn-primary">
                提交
              </button>
            </form>
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