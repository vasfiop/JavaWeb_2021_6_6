<%@ page pageEncoding="utf-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <title>Bootstrap 实例</title>

    <%@ include file="head.jsp" %>

  </head>

  <body>
    <p></p>
    <div class="container-fluid">
      <div class="row">

        <div class="col-md-3">
        </div>

        <div class="col-md-6">
          <table class="table table-bordered">
            <tbody>
              <tr class="table-primary">
                <th class="text-center" width="20%">菜 名</th>
                <td class="text-center">瘦身苹果牛奶饮</td>
              </tr>
              <tr class="table-secondary">
                <th class="text-center" width="20%">特 色</th>
                <td class="text-center">
                  特色：苹果有安眠养神、补中益气、消食化积值特长。瘦身苹果牛奶饮让你是偶先感觉到的是苹果的香甜，然后是牛奶的浓郁、香滑。临睡前喝一碗，不但可以帮助睡眠，也不会长胖。
                </td>
              </tr>
              <tr class="table-success">
                <th class="text-center" width="20%">食 材</th>
                <td class="text-center">主料：苹果250g，牛奶200g</td>
              </tr>
              <tr class="table-danger">
                <th class="text-center" width="20%">类 型</th>
                <td class="text-center">主食</td>
              </tr>
              <tr class="table-warning">
                <th class="text-center" width="20%">价 格</th>
                <td class="text-center">15元</td>
              </tr>
              <tr class="table-info">
                <th class="text-center" width="20%">图 片</th>
                <td class="text-center"><img src="./resources/images/yinpin/03.jpg" class="rounded"></td>
              </tr>
              <tr class="table-danger">
                <th class="text-center" width="20%">点 餐 率</th>
                <td class="text-center">24次</td>
              </tr>
              <tr class="table-success">
                <th class="text-center" width="20%">备 注</th>
                <td class="text-center">特价13元</td>
              </tr>
            </tbody>
          </table>
          <button type="button" class="btn btn-outline-danger btn-block">将 菜 品 添 加 到 点 餐 车</button>
        </div>

        <div class="col-md-3">
        </div>

      </div>
    </div>
  </body>

  </html>