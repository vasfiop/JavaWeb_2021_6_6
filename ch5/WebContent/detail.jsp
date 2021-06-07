<%@ page pageEncoding="utf-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <title>${food.foodname }</title>

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
                  <td class="text-center">${food.foodname }</td>
                </tr>
                <tr class="table-secondary">
                  <th class="text-center" width="20%">特 色</th>
                  <td class="text-center">
                    ${food.feature }
                  </td>
                </tr>
                <tr class="table-success">
                  <th class="text-center" width="20%">食 材</th>
                  <td class="text-center">${food.material }</td>
                </tr>
                <tr class="table-danger">
                  <th class="text-center" width="20%">类 型</th>
                  <td class="text-center">${food.typename }</td>
                </tr>
                <tr class="table-warning">
                  <th class="text-center" width="20%">价 格</th>
                  <td class="text-center">${food.price }</td>
                </tr>
                <tr class="table-info">
                  <th class="text-center" width="20%">图 片</th>
                  <td class="text-center"><img src="./resources/${food.picture }" class="rounded"></td>
                </tr>
                <tr class="table-danger">
                  <th class="text-center" width="20%">点 餐 率</th>
                  <td class="text-center">${food.hits }次</td>
                </tr>
                <tr class="table-success">
                  <th class="text-center" width="20%">备 注</th>
                  <td class="text-center">
					<c:choose>
						<c:when test="${food.comment == 0 }">厨师推荐</c:when>
						<c:when test="${food.comment > 0 }">特价${food.comment }元</c:when>
					</c:choose>
                  </td>
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