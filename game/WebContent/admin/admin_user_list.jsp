<%@ page pageEncoding="utf-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <title>管理员用户列表界面</title>

    <%@ include file="../head.jsp" %>
  </head>

  <body>
    <!-- 首页导航栏 -->
    <%@ include file="admin_nav.jsp" %>

      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <div class="container">
                  <div class="row">
                    <div class="col-md-12">
                      <!-- 搜索表单 -->
                      <form role="form" class="form-inline" action="user_index" method="POST">
                        <div class="form-group">
                          <input type="text" class="form-control" name="s_sn" placeholder="按商品名搜索" value="" />
                        </div>
                        &nbsp;&nbsp;&nbsp;
                        <button type="submit" class="btn btn-outline-success">
                          搜索</button>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <!-- table -->
                <table class="table table-hover table-striped">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>用户名</th>
                      <th>角色</th>
                      <th>电话</th>
                      <th>地址</th>
                      <th>操作</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th>1</th>
                      <td>admin</td>
                      <td>管理员</td>
                      <td>0</td>
                      <td>0</td>
                      <td>
                        <a href="#modal_del" role="button" class="btn btn-outline-danger" data-toggle="modal">
                          删除
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <th>2</th>
                      <td>user1</td>
                      <td>普通用户</td>
                      <td>0411</td>
                      <td>地球</td>
                      <td>
                        <a href="#modal_del" role="button" class="btn btn-outline-danger" data-toggle="modal">
                          删除
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <th>3</th>
                      <td>user2</td>
                      <td>普通用户</td>
                      <td>0411</td>
                      <td>地球</td>
                      <td>
                        <a href="#modal_del" role="button" class="btn btn-outline-danger" data-toggle="modal">
                          删除
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

  </body>

  </html>