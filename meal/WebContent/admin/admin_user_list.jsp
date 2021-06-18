<%@ page pageEncoding="utf-8" %>
  <!doctype html>
  <html lang="en">

  <head>
    <title>用户点餐列表</title>
    <%@ include file="../head.jsp" %>

  </head>

  <body>
    <%@ include file="admin_nav.jsp" %>

      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <!-- 搜索表单 -->
                <form role="form" class="form-inline">
                  <div class="form-group">
                    <input type="text" class="form-control" name="s_un" placeholder="按用户名搜索" />
                  </div>
                  &nbsp;&nbsp;&nbsp;
                  <button type="submit" class="btn btn-outline-primary">
                    搜索
                  </button>
                </form>
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
                      <td>null</td>
                      <td>null</td>
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
                      <td>041184835202</td>
                      <td>大连东软信息学院A3座117室</td>
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
                      <td>041184835207</td>
                      <td>大连理工大学计算机系</td>
                      <td>
                        <a href="#modal_del" role="button" class="btn btn-outline-danger" data-toggle="modal">
                          删除
                        </a>
                      </td>
                    </tr>
                                        <tr>
                      <th>4</th>
                      <td>user3</td>
                      <td>普通用户</td>
                      <td>041184832264</td>
                      <td>新新园100号2门103</td>
                      <td>
                        <a href="#modal_del" role="button" class="btn btn-outline-danger" data-toggle="modal">
                          删除
                        </a>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class="card-footer">
                <!-- 居右的分页处理 -->
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 删除模态框 -->
      <div class="modal fade" id="modal_del" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header bg-primary">
              <h5 class="modal-title text-white" id="myModalLabel">
                删除确认
              </h5>
              <button type="button" class="close" data-dismiss="modal">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
              <h4 class="text-danger">
                确定要删除该用户吗？
              </h4>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">
                取消
              </button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">
                确定
              </button>
            </div>
          </div>
        </div>
      </div>

  </body>

  </html>