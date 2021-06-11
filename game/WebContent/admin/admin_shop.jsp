<%@ page pageEncoding="utf-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <title>管理员商品列表界面</title>

    <%@ include file="../head.jsp" %>
  </head>

  <body>
    <!-- 首页导航栏 -->
    <%@ include file="admin_nav.jsp" %>

      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card bg-default">
              <div class="card-header">
                <form role="form" class="form-inline" action="user_index" method="POST">
                  <div class="form-group">
                    <input type="text" class="form-control" name="s_sn" placeholder="按商品名搜索" value="" />
                  </div>
                  &nbsp;&nbsp;&nbsp;
                  <div class="form-group">
                    <select class="form-control" name="s_sort">
                      <option value="">所有分类</option>
                      <option value="1">家用电器</option>
                      <option value="2">手机</option>
                      <option value="3">电脑</option>
                      <option value="4">家具</option>
                      <option value="5">男装</option>
                      <option value="6">女装</option>
                      <option value="7">运动</option>
                      <option value="8">母婴</option>
                      <option value="9">食品</option>
                      <option value="10">图书</option>
                    </select>
                  </div>
                  &nbsp;&nbsp;&nbsp;
                  <div class="form-group">
                    <select class="form-control" name="s_sort">
                      <option value="">所有种类</option>
                      <option value="1">平板电脑</option>
                      <option value="2">冰箱洗衣机</option>
                      <option value="3">空调</option>
                      <option value="4">厨卫大电</option>
                      <option value="5">厨房小电</option>
                      <option value="6">生活电器</option>
                      <option value="7">个护健康</option>
                      <option value="8">店铺热销</option>
                    </select>
                  </div>
                  &nbsp;&nbsp;&nbsp;
                  <button type="submit" class="btn btn-outline-success">
                    搜索</button>
                </form>
              </div>
              <div class="card-body" style="padding-top: 0;padding-bottom: 0;">
                <table class="table table-hover table-striped">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>名称</th>
                      <th>标题</th>
                      <th>商品分类</th>
                      <th>商品种类</th>
                      <th>价格</th>
                      <th>图片</th>
                      <th>备注</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>海信</td>
                      <td>海信（Hisense）65E7G-PRO 65英寸电视4K超清液晶智能平板超薄全面屏ULED量子点120Hz游戏社交智慧屏以旧换新</td>
                      <td>家用电器</td>
                      <td>平板电脑</td>
                      <td>6399</td>
                      <td><img src="../resources/img/test_180_180.jpg"></td>
                      <td>京东秒杀</td>
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