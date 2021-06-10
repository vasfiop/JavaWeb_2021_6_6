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

        <div class="container-fluid">
          <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
              <div class="row">
                <div class="col-md-5">
                  <img src="./resources/img/test_350_350.jpg" style="float: right;" />
                </div>
                <div class="col-md-7">
                  <table class="table">
                    <tbody>
                      <tr>
                        <td>
                          <h6>Apple iPad Pro 11英寸平板电脑 2021年新款(128G
                            WLAN版/M1芯片Liquid视网膜屏/MHQR3CH/A) 深空灰色</h6>
                        </td>
                      </tr>
                      <tr>
                        <td>京东价:￥6669<small>[<del>￥9766</del>]</small></td>
                      </tr>
                      <tr>
                        <td>
                          <button type="button" class="btn btn-primary btn-lg btn-block">
                            加入购物车
                          </button>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="col-md-1"></div>
          </div>
        </div>

    </body>

    </html>