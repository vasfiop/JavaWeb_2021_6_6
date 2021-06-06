<%@ page pageEncoding="utf-8" %>
  <!doctype html>
  <html lang="en">

  <head>
    <title>管理员添加菜品信息</title>

    <%@ include file="../head.jsp" %>

  </head>

  <body>

    <%@ include file="admin_nav.jsp" %>

      <div class="container-fluid">
        <div class="row">

          <div class="col-md-2">
          </div>

          <div class="col-md-8">
            <div class="card bg-default border-success">
              <!-- 卡片  -->
              <h5 class="card-header bg-success text-center text-white">
                添加菜品
              </h5>
              <form role="form" method="POST" action="admin_type_add">
                <div class="card-body">
                  <div class="form-group">
                    <label>
                      分类名称
                    </label>
                    <input type="text" class="form-control" name="typename" />
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

          <div class="col-md-2">
          </div>

        </div>
      </div>

  </body>

  </html>