<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <title>Insert title here</title>
  <%@ include file="header.jsp"%>
</head>

<body>
  <%@ include file="nav.jsp"%>

  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="carousel slide" id="carousel-471086" style="height:376px;">
          <ol class="carousel-indicators">
            <li data-slide-to="0" data-target="#carousel-471086" class="active">
            </li>
            <li data-slide-to="1" data-target="#carousel-471086">
            </li>
            <li data-slide-to="2" data-target="#carousel-471086">
            </li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="d-block w-100" alt="Carousel Bootstrap First"
                src="${pageContext.request.contextPath}/resources/images/adver/1.jpg" />
              <div class="carousel-caption">
                <h4>
                  随意购商城
                </h4>
                <p>
                  SYG
                </p>
              </div>
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" alt="Carousel Bootstrap Second"
                src="${pageContext.request.contextPath}/resources/images/adver/2.jpg" />
              <div class="carousel-caption">
                <h4>
                  美丽女人
                </h4>
                <p>
                  SYG
                </p>
              </div>
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" alt="Carousel Bootstrap Third"
                src="${pageContext.request.contextPath}/resources/images/adver/3.jpg" />
              <div class="carousel-caption">
                <h4>
                  满减活动
                </h4>
                <p>
                  SYG
                </p>
              </div>
            </div>
          </div>
          <a class="carousel-control-prev" href="#carousel-471086" data-slide="prev">
            <span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carousel-471086" data-slide="next">
            <span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span>
          </a>
        </div>

      </div>
    </div>
  </div>


  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="d-inline-flex mt-2">
          <div class="">
            <img src="${pageContext.request.contextPath}/resources/images/goods/today.png" />
          </div>
          <div class="p-2 bg-warning">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/goods/1_1.jpg">
          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="footer.jsp"%>
</body>

</html>