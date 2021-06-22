<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <%@ include file="head.jsp"%>

  <title>${search }</title>

</head>

<body>
  <%@ include file="nav.jsp"%>
  <!-- 搜索条 -->
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-10">

            <div class="row">
              <div class="col-md-2">
                <img src="./resources/img/nav_logo.jpg" style="width: 190px; height: 120px;">
              </div>
              <div class="col-md-10">
                <!-- 下面是右面 -->
                <a type="button" class="btn btn-link float-right text-secondary" style="margin-top: 70px;"> 我的购物车 </a>
                <form class="form-inline float-right" style="margin-top: 70px; margin-right: 10px;" method="post"
                  action="search">
                  <div class="input-group mb-3">
                    <input type="text" class="form-control" name="search" value="${search }">
                    <div class="input-group-append">
                      <button class="input-group-text" type="submit">搜索</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>

          </div>
          <div class="col-md-1"></div>
        </div>
      </div>
    </div>
  </div>


  <div class="container-fluid bg-gray">
    <div class="row">
      <div class="col-md-1"></div>
      <div class="col-md-10">
        <div class="row">
          <p class="mt-3 mb-3" style="width: 100%"></p>
          <c:forEach var="i" items="${shops }">
            <div class="d-flex text-black">
              <div class="p-3 bg-white" style="width: 240px;">
                <img src="./resources/img/${i.picture }" style="width: 208px; height: 208px;" />
                <p class="text-red mt-2 mb-0" style="font-size: 20px;">￥${i.price }</p>
                <a href="">
                  <p style="width: 208px; overflow: hidden; text-overflow: ellipsis; font-size: 12px; white-space: nowrap; color:black;"
                    class="m-0"><span class="text-red">${i.shopname }</span>&nbsp;${i.title }</p>
                </a>
                <p style="font-size:12px;">${i.home }</p>
                <button type="button" class="btn btn-light">关注</button>
                <button type="button" class="btn btn-light">加入购物车</button>
              </div>
            </div>
          </c:forEach>
          <p class="mt-3 mb-3" style="width: 100%"></p>
        </div>
      </div>
      <div class="col-md-1"></div>
    </div>

  </div>


  <%@ include file="footer.jsp"%>

</body>

</html>