<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
  <title>京东</title>

  <%@ include file="head.jsp" %>

</head>

<body>
  <%@ include file="nav.jsp" %>

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
                <img src="./resources/img/test_190_120.jpg">
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

                <form>
                  <div class="input-group mb-3">
                    <input type="text" class="form-control" id="demo">
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
                <img src="./resources/img/test_190_120.jpg">
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
                  <c:forEach var="i" items="${type }">
                    <li class="list-item">
                      <a class="text-secondary btn-link" href="shoptype_item?id=${i.id }">${i.typename }</a>
                    </li>
                  </c:forEach>
                </ul>

              </div>
              <div class="col-md-8">
                <div class="float-left">
                  <img src="./resources/img/test_590_470.jpg">
                </div>

                <div class="float-right">
                  <img src="./resources/img/test_190_140.jpg" style="display: flex; margin-bottom: 7px;"> <img
                    src="./resources/img/test_190_140.jpg" style="display: flex; margin-bottom: 7px"> <img
                    src="./resources/img/test_190_140.jpg">
                </div>

              </div>
              <div class="col-md-2">
                <!-- TODO 还没想好要写啥 -->
                <nav class="breadcrumb">
                  <a class="breadcrumb-item" href="#">Home</a> <a class="breadcrumb-item" href="#">Library</a> <a
                    class="breadcrumb-item" href="#">Data</a>
                  <span class="breadcrumb-item active">Bootstrap</span>
                </nav>
              </div>
            </div>

          </div>

          <div class="col-md-1"></div>

        </div>

        <p></p>

      </div>
    </div>
  </div>

  <%@ include file="footer.jsp" %>

  <%@ include file="modal.jsp" %>

</body>

</html>