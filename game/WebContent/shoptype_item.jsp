<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <title>typename</title>

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
                <img src="./resources/img/test_190_120.jpg">
              </div>
              <div class="col-md-10">
                <h4 style="margin-top: 80px;" class="float-left">家用电器</h4>
                <!-- 下面是右面 -->
                <a type="button" class="btn btn-link float-right text-secondary" style="margin-top: 70px;"> 我的购物车 </a>
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
      <div class="col-md-12">
        <div class="row">
          <div class="col-md-1"></div>

          <div class="col-md-10">

            <h3 class="text-center">热销爆款</h3>
            <div class="tabbable">
              <ul class="nav nav-tabs">
                <c:set var="count" value="1" />
                <c:forEach var="i" items="${type }">
                  <c:if test="${count == 1 }">
                    <li class="nav-item">
                      <a class="nav-link active" href="#tab${count }" data-toggle="tab">${i.typename}</a>
                    </li>
                  </c:if>
                  <c:if test="${count != 1 }">
                    <li class="nav-item">
                      <a class="nav-link" href="#tab${count }" data-toggle="tab">${i.typename }</a>
                    </li>
                  </c:if>
                  <c:set var="count" value="${count+1 }" />
                </c:forEach>
              </ul>
              <div class="tab-content">
              
                <c:set var="count" value="1" />
                <c:forEach var="i" items="${type }">
                  <c:if test="${count == 1 }">
                    <div class="tab-pane active" id="tab${count }">
                      <table class="table">
                        <thead>
                          <tr>
                            <c:forEach var="l" items="${shops }">
                              <th><img src="./resources/img/test_180_180.jpg"></th>
                            </c:forEach>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <c:forEach var="l" items="${shops }">
                              <td>${l.title }</td>
                            </c:forEach>
                          </tr>
                          <tr>
                            <c:forEach var="l" items="${shops }">
                              <td>￥${l.price }</td>
                            </c:forEach>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </c:if>

                  <c:if test="${count != 1 }">
                    <div class="tab-pane" id="tab${count }">
                      <table class="table">
                        <thead>
                          <tr>
                            <th><img src="./resources/img/test_180_180.jpg"></th>
                            <th><img src="./resources/img/test_180_180.jpg"></th>
                            <th><img src="./resources/img/test_180_180.jpg"></th>
                            <th><img src="./resources/img/test_180_180.jpg"></th>
                            <th><img src="./resources/img/test_180_180.jpg"></th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>测试语句${count }</td>
                            <td>测试语句${count }</td>
                            <td>测试语句${count }</td>
                            <td>测试语句${count }</td>
                            <td>测试语句${count }</td>
                          </tr>
                          <tr>
                            <td>测试语句${count }</td>
                            <td>测试语句${count }</td>
                            <td>测试语句${count }</td>
                            <td>测试语句${count }</td>
                            <td>测试语句${count }</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </c:if>
                  <c:set var="count" value="${count+1 }" />

                </c:forEach>
              </div>
            </div>
          </div>
          <div class="col-md-1"></div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="footer.jsp"%>

  <%@ include file="modal.jsp"%>

</body>

</html>