<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
  <title>正在点餐</title>

  <%@ include file="../head.jsp" %>

</head>

<body>
  <%@ include file="user_nav.jsp" %>

  <!-- 搜索+下部分内容 -->
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
            <!-- 搜索表单 -->
            <form role="form" class="form-inline" action="user_index" method="POST">
              <div class="form-group">
                <input type="text" class="form-control" name="s_fn" placeholder="按菜名搜索" value="${param.s_fn }" />
              </div>
              &nbsp;&nbsp;&nbsp;
              <div class="form-group">
                <div class="form-group">
                  <select class="form-control" name="s_type">
                    <option value="">所有分类</option>
                    <c:forEach var="i" items="${types }">
                      <option value="${i.id }" ${param.s_type==i.id? 'selected' :'' }>${i.typename }</option>
                    </c:forEach>
                  </select>
                </div>
              </div>
              &nbsp;&nbsp;&nbsp;
              <button type="submit" class="btn btn-outline-success">
                搜索
              </button>
            </form>
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
                  <c:forEach var="f" items="${food }" varStatus="vs">
                    <tr>
                      <th>${vs.count }</th>
                      <td>${f.foodname }</td>
                      <td>${f.feature }</td>
                      <td>${f.material }</td>
                      <td>${f.price }</td>
                      <td>${f.typename }</td>
                      <td><img alt="${f.foodname }" src="../resources/${f.picture }" class="rounded" /></td>
                      <td>${f.hits }</td>
                      <c:if test="${f.comment ==0 }">
                        <td>厨师推荐</td>
                      </c:if>
                      <c:if test="${f.comment > 0 }">
                        <td>特价${f.comment }</td>
                      </c:if>
                      <c:if test="${f.comment < 0 }">
                        <td> </td>
                      </c:if>

                      <td align="center"><input type="checkbox" class="form-check-input" value="${f.id }" name="ids">
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
              <button type="submit" class="btn btn-outline-success btn-block">将 菜 品 添 加 到 点 餐 车</button>
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