<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
  <title>京东</title>

  <%@ include file="head.jsp"%>

</head>

<body>
  <%@ include file="nav.jsp"%>

  <p></p>

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

              <div class="col-md-8">
                <nav>
                  <ol class="breadcrumb bg-light" style="padding: 0; margin-bottom: 0;">
                    <li class="breadcrumb-item"><a href="#" class="btn-link text-secondary btn-sm">家电预售</a></li>
                    <li class="breadcrumb-item"><a href="#" class="btn-link text-secondary btn-sm">潮流上新</a></li>
                    <li class="breadcrumb-item"><a href="#" class="btn-link text-secondary btn-sm">电竞神装</a></li>
                    <li class="breadcrumb-item"><a href="#" class="btn-link text-secondary btn-sm">好物1元</a></li>
                    <li class="breadcrumb-item"><a href="#" class="btn-link text-secondary btn-sm">冰洗放价</a></li>
                    <li class="breadcrumb-item"><a href="#" class="btn-link text-secondary btn-sm">时令水果</a></li>
                    <li class="breadcrumb-item"><a href="#" class="btn-link text-secondary btn-sm">爆豆曲奇</a></li>
                  </ol>
                </nav>

                <form method="post" action="search">
                  <div class="input-group">
                    <input type="text" class="form-control" name="search">
                    <div class="input-group-append">
                      <button type="submit" class="btn btn-primary">搜索</button>
                    </div>
                  </div>
                </form>

                <nav>
                  <ol class="breadcrumb bg-light" style="padding: 0;">
                    <li class="breadcrumb-item"><a href="#" class="btn-link text-secondary">秒杀</a></li>
                    <li class="breadcrumb-item"><a href="#" class="btn-link text-secondary">优惠卷</a></li>
                    <li class="breadcrumb-item"><a href="#" class="btn-link text-secondary">PLUS会员</a></li>
                    <li class="breadcrumb-item"><a href="#" class="btn-link text-secondary">品牌闪购</a></li>
                    <li class="breadcrumb-item"><a href="#" class="btn-link text-secondary">拍卖</a></li>
                    <li class="breadcrumb-item"><a href="#" class="btn-link text-secondary">京东家电</a></li>
                    <li class="breadcrumb-item"><a href="#" class="btn-link text-secondary">京东超市</a></li>
                    <li class="breadcrumb-item"><a href="#" class="btn-link text-secondary">京东生鲜</a></li>
                    <li class="breadcrumb-item"><a href="#" class="btn-link text-secondary">京东国际</a></li>
                  </ol>
                </nav>

              </div>

              <div class="col-md-2">
                <img src="./resources/img/right_nav.png" style="width: 190px; height: 120px;">
              </div>
            </div>

          </div>
          <div class="col-md-1"></div>
        </div>
      </div>
    </div>
  </div>

  <p></p>

  <!-- 轮播图+超复杂的列表 -->
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12" style="background-color: #dfdfdf;">
        <p></p>
        <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-10">
            <div class="row">
              <div class="col-md-2">
                <!-- 最左面的列表 -->
                <ul class="list-unstyled bg-white" style="padding: 5px 10px;">
                  <c:forEach var="i" items="${sort }">
                    <li class="list-item"><a class="text-secondary btn-link"
                        href="shoptype_item?id=${i.id }">${i.sortname }</a></li>
                  </c:forEach>
                </ul>

              </div>
              <div class="col-md-8">
                <%-- 中央baner图 --%>
                <div class="float-left">
                  <div class="carousel slide" id="carousel-279293">
                    <ol class="carousel-indicators">
                      <li data-slide-to="0" data-target="#carousel-279293" class="active"></li>
                      <li data-slide-to="1" data-target="#carousel-279293"></li>
                      <li data-slide-to="2" data-target="#carousel-279293"></li>
                    </ol>
                    <div class="carousel-inner" style="width: 590px; height: 470px;">
                      <div class="carousel-item  active">
                        <img class="d-block" alt="Carousel Bootstrap First" src="./resources/img/baner_1.jpg"
                          style="width: 590px; height: 470px;" />
                      </div>
                      <div class="carousel-item">
                        <img class="d-block" alt="Carousel Bootstrap Second" src="./resources/img/baner_2.jpg"
                          style="width: 590px; height: 470px;" />
                      </div>
                      <div class="carousel-item">
                        <img class="d-block" alt="Carousel Bootstrap Third" src="./resources/img/baner_3.jpg"
                          style="width: 590px; height: 470px;" />
                      </div>
                    </div>
                    <a class="carousel-control-prev" href="#carousel-279293" data-slide="prev"> <span
                        class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a
                      class="carousel-control-next" href="#carousel-279293" data-slide="next"> <span
                        class="carousel-control-next-icon"></span> <span class="sr-only">Next</span>
                    </a>
                  </div>
                </div>

                <div class="float-right">
                  <div class="carousel slide" id="right">
                    <ol class="carousel-indicators">
                      <li data-slide-to="0" data-target="#right" class="active"></li>
                      <li data-slide-to="1" data-target="#right"></li>
                      <li data-slide-to="2" data-target="#right"></li>
                    </ol>
                    <div class="carousel-inner" style="width: 190px; height: 470px;">
                      <div class="carousel-item  active">
                        <img class="d-block" alt="Carousel Bootstrap First" src="./resources/img/right_baner_11.png"
                          style="width: 190px; height: 150px;" /> <img class="d-block" alt="Carousel Bootstrap First"
                          src="./resources/img/right_baner_12.jpg"
                          style="width: 190px; height: 150px; margin-top: 10px" /> <img class="d-block"
                          alt="Carousel Bootstrap First" src="./resources/img/right_baner_13.jpg"
                          style="width: 190px; height: 150px; margin-top: 10px" />
                      </div>
                      <div class="carousel-item">
                        <img class="d-block" alt="Carousel Bootstrap Second" src="./resources/img/right_baner_21.jpg"
                          style="width: 190px; height: 150px;" /> <img class="d-block" alt="Carousel Bootstrap Second"
                          src="./resources/img/right_baner_22.png"
                          style="width: 190px; height: 150px; margin-top: 10px" /> <img class="d-block"
                          alt="Carousel Bootstrap Second" src="./resources/img/right_baner_23.jpg"
                          style="width: 190px; height: 150px; margin-top: 10px" />
                      </div>
                      <div class="carousel-item">
                        <img class="d-block" alt="Carousel Bootstrap Third" src="./resources/img/right_baner_31.jpg"
                          style="width: 190px; height: 150px;" /> <img class="d-block" alt="Carousel Bootstrap Third"
                          src="./resources/img/right_baner_32.png"
                          style="width: 190px; height: 150px; margin-top: 10px" /> <img class="d-block"
                          alt="Carousel Bootstrap Third" src="./resources/img/right_baner_33.jpg"
                          style="width: 190px; height: 150px; margin-top: 10px" />
                      </div>
                    </div>
                    <a class="carousel-control-prev" href="#right" data-slide="prev"> <span
                        class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span>
                    </a> <a class="carousel-control-next" href="#right" data-slide="next"> <span
                        class="carousel-control-next-icon"></span> <span class="sr-only">Next</span>
                    </a>
                  </div>
                </div>

              </div>
              <div class="col-md-2">
                <ul class="list-unstyled bg-white" style="padding: 5px 10px;">
                  <c:forEach var="i" items="${type }">
                    <li class="list-item"><a class="text-secondary btn-link"
                        href="shoptype_item?id=${i.id }">${i.typename }</a></li>
                  </c:forEach>
                </ul>
              </div>

              <p class="mt-3 mb-3" style="width: 100%"></p>

              <div class="d-flex bg-white text-black">
                <div>
                  <img src="./resources/img/homepage_kill.png" style="width: 190px; height: 260px" />
                </div>
                <c:forEach var="i" items="${killshop }">
                  <div class="p-3">
                    <img src="./resources/img/${i.picture }" style="width: 168px;height:168px;" class="mb-1" /> <a
                      href="shop_item?shopid=${i.id }" style="color: black;">
                      <p style="width: 168px; overflow: hidden; text-overflow: ellipsis; font-size: 12px; white-space: nowrap;"
                        class="mb-1">${i.title }</p>
                    </a>
                    <p class="m-0">
                      <del>￥${i.price }</del>
                      ￥${i.comment }
                    </p>
                  </div>
                </c:forEach>
                <div>
                  <img src="./resources/img/homepage_kill.png" style="width: 76px; height: 260px" />
                </div>
              </div>

              <p class="mt-3 mb-3" style="width: 100%"></p>

            </div>

          </div>

          <div class="col-md-1"></div>

        </div>

        <p></p>

      </div>
    </div>
  </div>

  <%@ include file="footer.jsp"%>

  <%@ include file="modal.jsp"%>

</body>

</html>