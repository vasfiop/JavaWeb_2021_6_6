<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
  <title>我的京东</title>

  <%@ include file="../head.jsp" %>

</head>

<body>

  <div class="container-fluid">
    <!-- 标题 -->
    <div class="row">
      <div class="col-md-12" style="background-color: white;">
        <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-10">

            <div class="row">
              <div class="col-md-2">
                <img src="./resources/img/nav_logo.jpg" style="width:190px;height:120px;">
              </div>
              <div class="col-md-10">
                <h4 style="margin-top: 80px;" class="float-left">欢迎登陆</h4>
              </div>
            </div>

          </div>
          <div class="col-md-1"></div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-md-12 bg-gray">

        <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-10">
            <form action="check.quick_log" method="POST">
              <div class="d-flex p-3">
                <div class="p-2" style="margin:40px auto;">
                  <h3 class="text-center m-2 text-black">
                    快捷登陆通道
                  </h3>
                  <div class="input-group mb-3 pt-3 pb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text">口令</span>
                    </div>
                    <input type="text" class="form-control" placeholder="您的快捷口令" name="quick">
                  </div>
                  <button type="submit" class="btn btn-outline-primary btn-md btn-block">
                    登陆
                  </button>
                </div>
              </div>
            </form>
          </div>
          <div class="col-md-1"></div>
        </div>

      </div>
    </div>

  </div>

  <%@ include file="../footer.jsp" %>

</body>

</html>