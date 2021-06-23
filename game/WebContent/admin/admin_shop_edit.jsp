<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>管理员商品添加界面</title>

  <%@ include file="../head.jsp" %>
</head>

<body>

  <div class="container-fluid">
    <div class="row">
      <div class="col-md-3">
      </div>
      <div class="col-md-6">
        <div class="card">
          <form role="form" action="admin_shop_edit?shopid=${shop.id }" method="POST" enctype="multipart/form-data">
            <h5 class="card-header bg-warning text-center text-white">
              修改商品
            </h5>
            <div class="card-body">

              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">商品名称</span>
                </div>
                <input type="text" class="form-control" name="shopname" value="${shop.shopname }">
              </div>

              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">商品标题</span>
                </div>
                <input type="text" class="form-control" name="shoptitle"  value="${shop.title }">
              </div>

              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">所属种类</span>
                </div>
                <select class="form-control" name="shoptype">
                  <c:forEach var="i" items="${types }">
                    <option value="${i.id }" ${i.id == shop.type? 'selected' : '' }>${i.typename }</option>
                  </c:forEach>
                </select>
              </div>

              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">商品价格</span>
                </div>
                <input type="number" class="form-control" name="shopprice"  value="${shop.price }">
              </div>

              <!-- FIXME 这里需要改一下文件上传后的回馈 -->
              <div class="custom-file mb-3">
                <input type="file" class="custom-file-input" id="validatedCustomFile" required name="shopfile">
                <label class="custom-file-label" for="validatedCustomFile">选择文件</label>
              </div>

              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">商品备注</span>
                </div>
                <input type="text" class="form-control" name="shopcomm"  value="${shop.comment }">
              </div>

            </div>
            <div class="card-footer text-center">
              <button type="submit" class="btn btn-warning">
                确认修改
              </button>
              &nbsp;&nbsp;
              <a href="javascript:history.back()">
                放弃返回
              </a>
            </div>
          </form>
        </div>
      </div>
      <div class="col-md-3">
      </div>
    </div>
  </div>

</body>

</html>