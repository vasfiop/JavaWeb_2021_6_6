<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <title>随意购商城首页</title>
  <%@ include file="header.jsp"%>
</head>

<body>
  <%@ include file="nav.jsp"%>

  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="carousel slide" id="carousel-471086" style="height: 376px;">
          <ol class="carousel-indicators">
            <li data-slide-to="0" data-target="#carousel-471086" class="active"></li>
            <li data-slide-to="1" data-target="#carousel-471086"></li>
            <li data-slide-to="2" data-target="#carousel-471086"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="d-block w-100" alt="Carousel Bootstrap First"
                src="${pageContext.request.contextPath}/resources/images/adver/1.jpg" />
              <div class="carousel-caption">
                <h4>随意购商城</h4>
                <p>SYG</p>
              </div>
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" alt="Carousel Bootstrap Second"
                src="${pageContext.request.contextPath}/resources/images/adver/2.jpg" />
              <div class="carousel-caption">
                <h4>美丽女人</h4>
                <p>SYG</p>
              </div>
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" alt="Carousel Bootstrap Third"
                src="${pageContext.request.contextPath}/resources/images/adver/3.jpg" />
              <div class="carousel-caption">
                <h4>满减活动</h4>
                <p>SYG</p>
              </div>
            </div>
          </div>
          <a class="carousel-control-prev" href="#carousel-471086" data-slide="prev"> <span
              class="carousel-control-prev-icon"></span>
            <span class="sr-only">Previous</span>
          </a> <a class="carousel-control-next" href="#carousel-471086" data-slide="next"> <span
              class="carousel-control-next-icon"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

      </div>
    </div>
  </div>

  <div class="container">
    <div class="row">
      <div class="col-md-2">
        <img src="${pageContext.request.contextPath}/resources/images/goods/today.png" />
      </div>
      <c:forEach var="i" items="${today }">
        <div class="col-md-2 todaygoods">
          <a href="${pageContext.request.contextPath}/goods/gooditem.goods?goodsid=${i.goods_id }">
            <img class="d-flex justify-content-center" src="${pageContext.request.contextPath}/resources${i.goods_pic }"
              style="width: 160px;">
            <p class="mb-2 d-flex justify-content-center" style="color:red;">￥&nbsp;${i.goods_price }</p>
            <p class="mb-0 d-flex justify-content-center" style="color:black">${i.goods_name }</p>
          </a>
        </div>
      </c:forEach>
    </div>
  </div>

  <c:forEach var="i" items="${cates }">
    <div class="container mt-4">
      <div class="row">
        <div class="col-md-12">
          <ul class="nav">
            <li class="nav-item">
              <h2>${i.cate_name }&nbsp;<span style="font-size:14px;">${i.cate_desc }</span></h2>
            </li>
            <li class="nav-item ml-md-auto">
              <div class="btn-group btn-group-sm" role="group">
                <c:forEach var="j" items="${i.childlist }">
                  <button class="btn btn-outline-secondary ml-1" type="button">
                    ${j.cate_name }
                  </button>
                </c:forEach>
              </div>
            </li>
            <li class="nav-item ml-2">
              <a type="button" class="btn btn-outline-primary">
                更多商品
              </a>
            </li>
          </ul>
          <hr class="mt-0" style="border:1px solid;background:black;" />
          <div class="container-fluid">
            <div class="row">
              <c:forEach var="j" items="${i.goodslist }">
                <div class="col-md-2">
                  <a href="${pageContext.request.contextPath}/goods/gooditem.goods?goodsid=${j.goods_id }">
                    <figure class="figure homegoods">
                      <img src="${pageContext.request.contextPath}/resources${j.goods_pic }" style="width: 160px;">
                      <figcaption class="figure-caption text-center caption-style">
                        <p class="pb-2 mb-0 pt-2 d-flex justify-content-center">${j.goods_name }</p>
                        <p class="pb-2 mb-0 d-flex justify-content-center" style="color:red;">￥&nbsp;${j.goods_price }
                        </p>
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
  </c:forEach>

  <div class="container mt-4">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <h5 class="card-header">热销商品</h5>
          <div class="card-body">
            <div class="row">
              <c:forEach var="i" begin="0" end="5">
                <div class="col-md-2 mb-3">
                  <a href="${pageContext.request.contextPath}/goods/gooditem.goods?goodsid=${hots[i].goods_id }">
                    <figure class="figure homegoods mb-0">
                      <img src="${pageContext.request.contextPath }/resources${hots[i].goods_pic }"
                        class="figure-img img-fluid rounded">
                      <figcaption class="figure-caption text-center caption-style">
                        <p class="mb-0">${hots[i].goods_name }</p>
                        <p style="color: red;" class="mb-0">￥&nbsp;${hots[i].goods_price }</p>
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

  <%@ include file="footer.jsp"%>
  <%@ include file="./modal/loginFormModal.jsp"%>
  <%@ include file="./modal/regFormModal.jsp"%>
</body>

</html>