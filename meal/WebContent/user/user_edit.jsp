<%@ page pageEncoding="utf-8" %>
  <!doctype html>
  <html lang="en">

  <head>
    <title>管理员添加菜品信息</title>
    <!-- Required meta tags -->
	<%@ include file="../head.jsp" %>

  </head>

  <body>
    <!-- 导航头 -->
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">

          <nav class="navbar navbar-expand-lg navbar-light bg-light">

            <button class="navbar-toggler" type="button" data-toggle="collapse"
              data-target="#bs-example-navbar-collapse-1">
              <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="admin_index.html"><span class="text-info">网络点餐系统</span></a>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="user_index.html">正在点餐</a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="user_dc_show.html">我的点餐</a>
                </li>
              </ul>

              <ul class="navbar-nav ml-md-auto">
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown">${用户名}</a>
                  <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="#">修改个人资料</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="homepage.html">退出登录</a>
                  </div>
                </li>
              </ul>
            </div>
          </nav>

        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row">

        <div class="col-md-2">
        </div>

        <div class="col-md-8">
          <div class="card bg-default border-warning">
            <!-- 卡片  -->
            <h5 class="card-header bg-warning text-center text-white">
              修改个人资料
            </h5>
            <form role="form" method="POST" action="user_update">
              <div class="card-body">

                <div class="form-group">
                  <label>
                    用户名称
                  </label>
                  <div class="alert alert-success">${用户名}</div>
                </div>
                <div class="form-group">
                  <label>
                    密码
                  </label>
                  <input type="password" class="form-control" name="password" value="${user.password}" required />
                </div>
                <div class="form-group">
                  <label>
                    电话
                  </label>
                  <input type="text" class="form-control" name="tel" value="${user.telephone}" required />
                </div>
                <div class="form-group">
                  <label>
                    地址
                  </label>
                  <input type="text" class="form-control" name="address" value="${user.address}" required />
                </div>
              </div>
              <div class="card-footer text-center">
                <button type="submit" class="btn btn-warning">
                  确认添加
                </button>
                &nbsp;&nbsp;
                <a href="javascript:history.back()">
                  放弃取消
                </a>
              </div>
            </form>
          </div>
        </div>

        <div class="col-md-2">
        </div>

      </div>
    </div>

  </body>

  </html>