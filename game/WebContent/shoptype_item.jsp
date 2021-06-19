<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <title>${name.typename }</title>

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
                <img src="./resources/img/nav_logo.jpg" style="width:190px;height:120px;">
              </div>
              <div class="col-md-10">
                <h4 style="margin-top: 80px;" class="float-left">${name.typename }</h4>
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

                <div class="tab-pane active" id="tab1">
                  <table class="table">
                    <thead>
                      <tr>
                        <c:forEach var="l" items="${shops0 }">
                          <th><img src="./resources/img/${l.picture }" style="width:180px;height:180px;"></th>
                        </c:forEach>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <c:forEach var="l" items="${shops0 }">
                          <td>
                            <p style="width: 156px;">${l.title }</p>
                          </td>
                        </c:forEach>
                      </tr>
                      <tr>
                        <c:forEach var="l" items="${shops0 }">
                          <td>
                            <p style="width: 156px;">￥${l.price }</p>
                          </td>
                        </c:forEach>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <div class="tab-pane" id="tab2">
                  <table class="table">
                    <thead>
                      <tr>
                        <c:forEach var="l" items="${shops1 }">
                          <th><img src="./resources/img/${l.picture }" style="width:180px;height:180px;"></th>
                        </c:forEach>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <c:forEach var="l" items="${shops1 }">
                          <td>
                            <p style="width: 156px;">${l.title }</p>
                          </td>
                        </c:forEach>
                      </tr>
                      <tr>
                        <c:forEach var="l" items="${shops1 }">
                          <td>
                            <p style="width: 156px;">￥${l.price }</p>
                          </td>
                        </c:forEach>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <div class="tab-pane" id="tab3">
                  <table class="table">
                    <thead>
                      <tr>
                        <c:forEach var="l" items="${shops2 }">
                          <th><img src="./resources/img/${l.picture }" style="width:180px;height:180px;"></th>
                        </c:forEach>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <c:forEach var="l" items="${shops2 }">
                          <td>
                            <p style="width: 156px;">${l.title }</p>
                          </td>
                        </c:forEach>
                      </tr>
                      <tr>
                        <c:forEach var="l" items="${shops2 }">
                          <td>
                            <p style="width: 156px;">￥${l.price }</p>
                          </td>
                        </c:forEach>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <div class="tab-pane" id="tab4">
                  <table class="table">
                    <thead>
                      <tr>
                        <c:forEach var="l" items="${shops3 }">
                          <th><img src="./resources/img/${l.picture }" style="width:180px;height:180px;"></th>
                        </c:forEach>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <c:forEach var="l" items="${shops3 }">
                          <td>
                            <p style="width: 156px;">${l.title }</p>
                          </td>
                        </c:forEach>
                      </tr>
                      <tr>
                        <c:forEach var="l" items="${shops3 }">
                          <td>
                            <p style="width: 156px;">￥${l.price }</p>
                          </td>
                        </c:forEach>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <div class="tab-pane" id="tab5">
                  <table class="table">
                    <thead>
                      <tr>
                        <c:forEach var="l" items="${shops4 }">
                          <th><img src="./resources/img/${l.picture }" style="width:180px;height:180px;"></th>
                        </c:forEach>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <c:forEach var="l" items="${shops4 }">
                          <td>
                            <p style="width: 156px;">${l.title }</p>
                          </td>
                        </c:forEach>
                      </tr>
                      <tr>
                        <c:forEach var="l" items="${shops4 }">
                          <td>
                            <p style="width: 156px;">￥${l.price }</p>
                          </td>
                        </c:forEach>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <div class="tab-pane" id="tab6">
                  <table class="table">
                    <thead>
                      <tr>
                        <c:forEach var="l" items="${shops5 }">
                          <th><img src="./resources/img/${l.picture }" style="width:180px;height:180px;"></th>
                        </c:forEach>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <c:forEach var="l" items="${shops5 }">
                          <td>
                            <p style="width: 156px;">${l.title }</p>
                          </td>
                        </c:forEach>
                      </tr>
                      <tr>
                        <c:forEach var="l" items="${shops5 }">
                          <td>
                            <p style="width: 156px;">￥${l.price }</p>
                          </td>
                        </c:forEach>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <div class="tab-pane" id="tab7">
                  <table class="table">
                    <thead>
                      <tr>
                        <c:forEach var="l" items="${shops6 }">
                          <th><img src="./resources/img/${l.picture }" style="width:180px;height:180px;"></th>
                        </c:forEach>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <c:forEach var="l" items="${shops6 }">
                          <td>
                            <p style="width: 156px;">${l.title }</p>
                          </td>
                        </c:forEach>
                      </tr>
                      <tr>
                        <c:forEach var="l" items="${shops6 }">
                          <td>
                            <p style="width: 156px;">￥${l.price }</p>
                          </td>
                        </c:forEach>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <div class="tab-pane" id="tab8">
                  <table class="table">
                    <thead>
                      <tr>
                        <c:forEach var="l" items="${shops7 }">
                          <th><img src="./resources/img/${l.picture }" style="width:180px;height:180px;"></th>
                        </c:forEach>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <c:forEach var="l" items="${shops7 }">
                          <td>
                            <p style="width: 156px;">${l.title }</p>
                          </td>
                        </c:forEach>
                      </tr>
                      <tr>
                        <c:forEach var="l" items="${shops7 }">
                          <td>
                            <p style="width: 156px;">￥${l.price }</p>
                          </td>
                        </c:forEach>
                      </tr>
                    </tbody>
                  </table>
                </div>

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