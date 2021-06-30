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
                        <p class="mb-0">${i.goods_name }</p>
                        <p style="color: red;" class="mb-0">￥&nbsp;${i.goods_price }</p>
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
  <%@ include file="../modal/loginFormModal.jsp"%>
  <%@ include file="../modal/regFormModal.jsp"%>
</body>

</html>