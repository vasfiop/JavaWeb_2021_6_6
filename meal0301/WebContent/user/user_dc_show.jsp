<%@ page pageEncoding="utf-8" %>
  <!doctype html>
  <html lang="en">

  <head>
    <title>我的点餐</title>

    <%@ include file="../head.jsp" %>

  </head>

  <body>
    <%@ include file="user_nav.jsp" %>

      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <!-- 搜索表单 -->
              </div>
              <div class="card-body">
                <!-- table -->
                <form action="user_dc_show.html" method="POST">
                  <table class="table table-hover table-striped">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>菜名</th>
                        <th>特色</th>
                        <th>主料</th>
                        <th>价格</th>
                        <th>分类</th>
                        <th>图片</th>
                        <th>点餐率</th>
                        <th>备注</th>
                        <th>选择</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th>1</th>
                        <td>瘦身苹果牛奶饮</td>
                        <td>特色：*****************</td>
                        <td>主料：苹果250g,牛奶200g</td>
                        <td>15</td>
                        <td>主食</td>
                        <td><img alt="瘦身苹果牛奶饮" src="./resources/images/yinpin/03.jpg" class="rounded" /></td>
                        <td>24次</td>
                        <td>特价13元</td>
                        <td align="center"><input type="checkbox" class="form-check-input" value="1" name="ids"></td>
                      </tr>
                    </tbody>
                  </table>
                  <button type="submit" class="btn btn-outline-danger btn-block">将 菜 品 从 点 餐 车 删 除</button>
                </form>
              </div>
              <div class="card-footer">
                <!-- 居右的分页处理 -->
                <nav>
                  <ul class="pagination justify-content-center">
                    <li class="page-item">
                      <a class="page-link" href="#">&lt;&lt;</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#">1</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#">2</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#">3</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#">4</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#">5</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#">&gt;&gt;</a>
                    </li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
        </div>
      </div>

  </body>

  </html>