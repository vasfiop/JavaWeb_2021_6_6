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
      <div class="col-md-2 todaygoods">
        <img class="d-flex justify-content-center"
          src="${pageContext.request.contextPath}/resources/images/goods/1_1.jpg" style="width: 160px;">
        <p class="mb-2 d-flex justify-content-center" style="color:red;">￥&nbsp;213.0</p>
        <p class="mb-0 d-flex justify-content-center">asoidjfaosfjoiasjd</p>
      </div>
    </div>
  </div>

  <div class="container mt-3">
    <div class="row">
      <div class="col-md-12">
        <ul class="nav">
          <li class="nav-item">
            <h2>食品 <span style="font-size:14px;">来来来，干翻</span></h2>
          </li>
          <li class="nav-item ml-md-auto">
            <div class="btn-group btn-group-sm" role="group">
              <button class="btn btn-outline-secondary ml-1" type="button">
                小类
              </button>
            </div>
          </li>
          <li class="nav-item ml-2">
            <button type="button" class="btn btn-outline-primary">
              更多商品
            </button>
          </li>
        </ul>
        <hr class="mt-0" style="border:1px solid;background:black;" />
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-2">
              <figure class="figure homegoods">
                <img src="${pageContext.request.contextPath}/resources/images/goods/1_1.jpg" style="width: 160px;">
                <figcaption class="figure-caption text-center caption-style">
                  <p class="pb-2 mb-0 pt-2 d-flex justify-content-center">恰饭</p>
                  <p class="pb-2 mb-0 d-flex justify-content-center" style="color:red;">￥&nbsp;2.0</p>
                </figcaption>
              </figure>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <h5 class="card-header">热销商品</h5>
          <div class="card-body">
            <div class="col-md-2">
              <figure class="figure homegoods mb-0">
                <img src="${pageContext.request.contextPath }/resources//images/goods/tj_2.jpg"
                  class="figure-img img-fluid rounded">
                <figcaption class="figure-caption text-center caption-style">
                  <p class="mb-0">榛子</p>
                  <p style="color: red;" class="mb-0">￥&nbsp;213.0</p>
                </figcaption>
              </figure>
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