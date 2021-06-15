<%@ page pageEncoding="utf-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!doctype html>
    <html lang="en">

    <head>
      <title>管理员分类菜品信息</title>

      <%@ include file="../head.jsp" %>

    </head>

    <body>
      <%@ include file="admin_nav.jsp" %>

        <div class="container">
          <div class="row">

            <div class="col-md-3"></div>

            <div class="col-md-6">
              <div class="card">
                <div class="card-header">
                  <!-- 搜索表单 -->
                  <form role="form" class="form-inline" method="post" action="admin_type_list">
                    <div class="form-group">
                      <input type="text" class="form-control" id="exampleInputEmail1" name="s_tn" placeholder="按分类名搜索"
                        value="${param.s_tn }" />
                    </div>
                    &nbsp;&nbsp;&nbsp;
                    <button type="submit" class="btn btn-outline-primary">搜索</button>
                    &nbsp;&nbsp;&nbsp;
                    <a href="admin_type_add.jsp" role="button" class="btn btn-outline-success">
                      添加分类
                    </a>
                  </form>
                </div>
                <div class="card-body">
                  <!-- table -->

                  <table class="table table-hover table-striped">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>分类名称</th>
                        <th>操作</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="t" items="${types }" varStatus="vs">
                        <tr>
                          <th>${vs.count }</th>
                          <td>${t.typename }</td>
                          <td>
                            <a href="admin_type_edit?id=${t.id }" role="button"
                              class="btn btn-outline-warning btn-sm">修改</a>
                            <button class="btn btn-outline-danger btn-sm"
                              onclick="delConfirm('确定要删除该分类吗(分类下无菜品)','${pageContext.request.contextPath}/admin/admin_type_del',
                              '${t.id}','ajax_no')">删除</button>
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>

                </div>
              </div>
            </div>

            <div class="col-md-3"></div>

          </div>
        </div>

        <jsp:include page="/del_modal.jsp" />

    </body>

    </html>