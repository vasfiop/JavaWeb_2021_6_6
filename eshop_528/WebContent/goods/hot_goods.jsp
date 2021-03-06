<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <title>随意购商城首页</title>
  <%@ include file="../header.jsp"%>
</head>

<body>
  <%@ include file="../nav.jsp"%>

  <div class="container mt-4">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-body">
            <div class="row">
              <c:forEach var="i" items="${goods }">
                <div class="col-md-2 mb-3">
                  <a href="${pageContext.request.contextPath}/goods/gooditem.goods?goodsid=${i.goods_id }">
                    <figure class="figure homegoods mb-0">
                      <img src="${pageContext.request.contextPath }/resources${i.goods_pic }"
                        class="figure-img img-fluid rounded">
                      <figcaption class="figure-caption text-center caption-style">
                        <p class="mb-0" style="color: black;">${i.goods_name }</p>
                        <p style="color: black;" class="mb-0">原价￥&nbsp;${i.goods_price }</p>
                        <p class="m-0 pt-2 pb-2" style="color: black;">现售&nbsp;<span class="badge badge-pill badge-success">￥${i.goods_discount }</span></p>
                        <p class="m-0 pt-2 pb-2" style="color: black;">共出售${i.goods_sales } </p>
                      </figcaption>
                    </figure>
                  </a>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="../footer.jsp"%>
</body>

</html>