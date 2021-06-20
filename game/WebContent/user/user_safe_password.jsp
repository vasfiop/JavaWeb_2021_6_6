<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>修改个人资料</title>

  <%@ include file="../head.jsp"%>
</head>

<body>
  <%@ include file="../nav.jsp"%>

  <div class="container-fluid">
    <!-- 标题 -->
    <div class="row">
      <div class="col-md-12" style="background-color: white;">
        <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-10">

            <div class="row">
              <div class="col-md-2">
                <img src="../resources/img/nav_logo.jpg" style="width: 190px; height: 120px;">
              </div>
              <div class="col-md-10">
                <h4 style="margin-top: 80px;" class="float-left">我的京东</h4>
              </div>
            </div>

          </div>
          <div class="col-md-1"></div>
        </div>
      </div>
    </div>

  </div>

  <div class="container-fluid bg-gray">
    <div class="row">
      <div class="col-md-1"></div>
      <div class="col-md-10">
        <div class="d-flex p-3 text-black">
          <div class="p-2" style="margin:0 auto;">
            <form role="form" action="pass_check.safe?mode=${mode }" method="POST">
              <h3 class="text-center m-3">
                您正在进行更改操作，为了安全请您输入登陆密码
              </h3>
              <div class="input-group m-3" style="width:500px;">
                <div class="input-group-prepend">
                  <span class="input-group-text">输入密码</span>
                </div>
                <input type="text" class="form-control" placeholder="您的密码" name="password">
              </div>
              <button type="submit" class="btn btn-outline-primary float-right m-3">
                确定
              </button>
            </form>
          </div>
        </div>
      </div>
      <div class="col-md-1"></div>
    </div>
  </div>

  <%@ include file="../footer.jsp"%>
</body>

</html>