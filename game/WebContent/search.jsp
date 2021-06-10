<%@ page pageEncoding="utf-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <%@ include file="head.jsp" %>

        <title>商品</title>

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
                    <div class="col-md-10">
                      <!-- 下面是右面 -->
                      <a type="button" class="btn btn-link float-right text-secondary" style="margin-top: 70px;"> 我的购物车
                      </a>
                      <form class="form-inline float-right" style="margin-top: 70px; margin-right: 10px;">
                        <div class="input-group mb-3">
                          <input type="text" class="form-control">
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
        <p></p>

    </body>

    </html>