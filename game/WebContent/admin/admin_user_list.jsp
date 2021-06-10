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

      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="row">
              <div class="col-md-1">
              </div>
              <div class="col-md-10">
                <div class="row">
                  <div class="col-md-5">
                    <div class="card">
                      <div class="card-header">
                        <!-- 搜索表单 -->
                        <form role="form" class="form-inline" method="post" action="admin_type_list">
                          <div class="form-group">
                            <input type="text" class="form-control" name="s_tn" placeholder="按分类名搜索" value="" />
                          </div>
                          &nbsp;&nbsp;&nbsp;
                          <button type="submit" class="btn btn-outline-primary">搜索</button>
                          &nbsp;&nbsp;&nbsp;
                          <a href="admin_type_add.jsp" role="button" class="btn btn-outline-success">
                            添加分类
                          </a>
                        </form>
                      </div>
                      <div class="card-body" style="padding-top: 0;padding-bottom: 0;">
                        <table class="table table-hover table-striped">
                          <thead>
                            <tr>
                              <th>#</th>
                              <th>分类名称</th>
                              <th>操作</th>
                            </tr>
                          </thead>
                          <tbody>

                            <tr>
                              <th>1</th>
                              <td>家用电器</td>
                              <td>
                                <a href="admin_type_edit?id=1" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '1','ajax_no')">删除</button>
                              </td>
                            </tr>

                            <tr>
                              <th>2</th>
                              <td>手机</td>
                              <td>
                                <a href="admin_type_edit?id=2" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '2','ajax_no')">删除</button>
                              </td>
                            </tr>

                            <tr>
                              <th>3</th>
                              <td>电脑</td>
                              <td>
                                <a href="admin_type_edit?id=3" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '3','ajax_no')">删除</button>
                              </td>
                            </tr>

                            <tr>
                              <th>4</th>
                              <td>家具</td>
                              <td>
                                <a href="admin_type_edit?id=4" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '4','ajax_no')">删除</button>
                              </td>
                            </tr>

                            <tr>
                              <th>5</th>
                              <td>男装</td>
                              <td>
                                <a href="admin_type_edit?id=4" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '4','ajax_no')">删除</button>
                              </td>
                            </tr>
                            <tr>
                              <th>6</th>
                              <td>女装</td>
                              <td>
                                <a href="admin_type_edit?id=4" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '4','ajax_no')">删除</button>
                              </td>
                            </tr>
                            <tr>
                              <th>7</th>
                              <td>运动</td>
                              <td>
                                <a href="admin_type_edit?id=4" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '4','ajax_no')">删除</button>
                              </td>
                            </tr>
                            <tr>
                              <th>8</th>
                              <td>母婴</td>
                              <td>
                                <a href="admin_type_edit?id=4" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '4','ajax_no')">删除</button>
                              </td>
                            </tr>
                            <tr>
                              <th>9</th>
                              <td>食品</td>
                              <td>
                                <a href="admin_type_edit?id=4" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '4','ajax_no')">删除</button>
                              </td>
                            </tr>
                            <tr>
                              <th>10</th>
                              <td>图书</td>
                              <td>
                                <a href="admin_type_edit?id=4" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '4','ajax_no')">删除</button>
                              </td>
                            </tr>

                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-7">
                    <div class="card">
                      <div class="card-header">
                        <form role="form" class="form-inline" method="post" action="admin_type_list">
                          <div class="form-group">
                            <input type="text" class="form-control" name="s_tn" placeholder="按种类名搜索" value="" />
                          </div>
                          &nbsp;&nbsp;&nbsp;
                          <button type="submit" class="btn btn-outline-primary">搜索</button>
                          &nbsp;&nbsp;&nbsp;
                          <a href="admin_type_add.jsp" role="button" class="btn btn-outline-success">
                            添加种类
                          </a>
                        </form>
                      </div>
                      <div class="card-body" style="padding-top: 0;padding-bottom: 0;">
                        <table class="table table-hover table-striped">
                          <thead>
                            <tr>
                              <th>分类名称</th>
                              <th>种类名称</th>
                              <th>操作</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <th>家用电器</th>
                              <td>平板电脑</td>
                              <td>
                                <a href="admin_type_edit?id=1" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '1','ajax_no')">删除</button>
                              </td>
                            </tr>
                            <tr>
                              <th>家用电器</th>
                              <td>冰箱洗衣机</td>
                              <td>
                                <a href="admin_type_edit?id=1" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '1','ajax_no')">删除</button>
                              </td>
                            </tr>
                            <tr>
                              <th>家用电器</th>
                              <td>空调</td>
                              <td>
                                <a href="admin_type_edit?id=1" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '1','ajax_no')">删除</button>
                              </td>
                            </tr>
                            <tr>
                              <th>家用电器</th>
                              <td>厨卫大电</td>
                              <td>
                                <a href="admin_type_edit?id=1" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '1','ajax_no')">删除</button>
                              </td>
                            </tr>
                            <tr>
                              <th>家用电器</th>
                              <td>厨房小点</td>
                              <td>
                                <a href="admin_type_edit?id=1" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '1','ajax_no')">删除</button>
                              </td>
                            </tr>
                            <tr>
                              <th>家用电器</th>
                              <td>生活电器</td>
                              <td>
                                <a href="admin_type_edit?id=1" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '1','ajax_no')">删除</button>
                              </td>
                            </tr>
                            <tr>
                              <th>家用电器</th>
                              <td>个护健康</td>
                              <td>
                                <a href="admin_type_edit?id=1" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '1','ajax_no')">删除</button>
                              </td>
                            </tr>
                            <tr>
                              <th>家用电器</th>
                              <td>店铺热销</td>
                              <td>
                                <a href="admin_type_edit?id=1" role="button"
                                  class="btn btn-outline-warning btn-sm">修改</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','/ch5/admin/admin_type_del',
                                    '1','ajax_no')">删除</button>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-1">
              </div>
            </div>
          </div>
        </div>
      </div>
  </body>

  </html>