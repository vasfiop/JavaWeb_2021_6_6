<%@ page pageEncoding="utf-8" %>
  <!doctype html>
  <html lang="en">

  <head>
    <title>管理员查看用户点餐</title>

    <%@ include file="../head.jsp" %>

  </head>

  <body>
    <%@ include file="admin_nav.jsp" %>

      <p></p>

      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">
          </div>
          <div class="col-md-6">
            <form role="form" class="form-inline">
              <div class="form-group">
                <!-- <label>点餐用户名</label> -->
                <input type="text" class="form-control" id="exampleInputEmail1" name="s_un" placeholder="按用户名搜索" />
              </div>
              &nbsp;&nbsp;&nbsp;
              <a href="admin_food_list.html" role="button" class="btn btn-outline-primary">
                搜索
              </a>
            </form>
          </div>
          <div class="col-md-3">
          </div>
        </div>

        <p></p>

        <div class="row">

          <div class="col-md-3">
          </div>

          <div class="col-md-6">
            <!-- 每个点餐用户一块 -->
            <div class="card border-primary">
              <div class="card-body">
                <div class="list-group">
                  <div href="#" class="list-group-item list-group-item-action active">admin</div>
                  <div class="list-group-item">
                    西红柿炒鸡蛋 <span class="badge badge-success badge-pill float-right">14元</span>
                  </div>
                  <div class="list-group-item">
                    瘦身苹果牛奶饮 <span class="badge badge-success badge-pill float-right">14元</span>
                  </div>
                  <div href="#" class="list-group-item list-group-item-action active justify-content-between">
                    合计<span class="badge badge-success badge-pill float-right">28元</span>
                  </div>
                </div>
              </div>
            </div>

            <div class="card border-primary">
              <div class="card-body">
                <div class="list-group">
                  <div href="#" class="list-group-item list-group-item-action active">user1</div>
                  <div class="list-group-item">
                    菠菜炒鸡蛋 <span class="badge badge-success badge-pill float-right">14元</span>
                  </div>
                  <div class="list-group-item">
                    瘦身苹果牛奶饮 <span class="badge badge-success badge-pill float-right">14元</span>
                  </div>
                  <div href="#" class="list-group-item list-group-item-action active justify-content-between">
                    合计<span class="badge badge-success badge-pill float-right">28元</span>
                  </div>
                </div>
              </div>
            </div>

          </div>

          <div class="col-md-3">
          </div>

        </div>
      </div>

  </body>

  </html>