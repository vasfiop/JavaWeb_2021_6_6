<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
  <title>我的京东</title>

  <%@ include file="../head.jsp"%>

</head>

<body>
  <%@ include file="../nav.jsp"%>

  <div class="container-fluid">
    <!-- 标题 -->
    <div class="row">
      <div class="col-md-12" style="background-color: white;">
        <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-10">

            <div class="row">
              <div class="col-md-2">
                <img src="../resources/img/test_190_120.jpg">
              </div>
              <div class="col-md-10">
                <h4 style="margin-top: 80px;" class="float-left">我的京东</h4>
                <div class="dropdown">
                  <a class="btn dropdown-toggle float-left btn-lg" href="user_homepage" type="button" id="shouye"
                    data-toggle="dropdown" style="margin-top: 70px; margin-left: 10%;"> 首页 </a>
                  <div class="dropdown-menu" aria-labelledby="shouye">
                    <a class="dropdown-item" href="user_car?userid=${user.id }">购物车</a>
                    <a class="dropdown-item" href="#">我的钱包</a> <a class="dropdown-item" href="#">我的关注</a> <a
                      class="dropdown-item" href="#">我的活动</a> <a class="dropdown-item" href="#">客户服务</a>
                  </div>
                </div>

                <div class="dropdown">
                  <a class="btn dropdown-toggle float-left btn-lg" type="button" id="zhanghushezhi"
                    data-toggle="dropdown" style="margin-top: 70px; margin-left: 2%;"> 账户设置 </a>
                  <div class="dropdown-menu" aria-labelledby="zhanghushezhi">
                    <div class="row">
                      <div class="col-md-6">
                        <a class="dropdown-item" href="index.personal">个人信息</a>
                        <a class="dropdown-item" href="#">账户安全</a> <a class="dropdown-item" href="#">收货地址</a> <a
                          class="dropdown-item" href="#">我的银行卡</a> <a class="dropdown-item" href="#">账号绑定</a>
                      </div>
                      <div class="col-md-6">
                        <a class="dropdown-item" href="#">分享绑定</a> <a class="dropdown-item" href="#">我的尺码</a> <a
                          class="dropdown-item" href="#">健康档案</a> <a class="dropdown-item" href="#">邮件订阅</a> <a
                          class="dropdown-item" href="#">授权管理</a>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- 下面是右面 -->
                <a type="button" class="btn btn-link float-right text-secondary" style="margin-top: 70px;"
                  href="user_car?userid=${user.id }">
                  我的购物车 </a>

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

    <div class="row">
      <div class="col-md-12 bg-gray">

        <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-10">
            <div class="row">
              <div class="col-md-2">
                <!-- 左侧 -->
                <ul class="list-group">
                  <li class="list-group-item">
                    <h5>订单中心</h5>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"
                      href="user_order_center?id=${user.id }"> 我的订单 </a></li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 评价嗮单 </a>
                  </li>
                </ul>

                <p></p>

                <ul class="list-group">
                  <li class="list-group-item">
                    <h5>我的钱包</h5>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 优惠卷 </a></li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 京豆 </a></li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 白条 </a></li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 红包 </a></li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 礼品卡 </a></li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 更多> </a></li>
                </ul>

                <p></p>

                <ul class="list-group">
                  <li class="list-group-item">
                    <h5>我的关注</h5>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 关注商品 </a>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 关注店铺 </a>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 内容收藏 </a>
                  </li>
                </ul>

                <p></p>

                <ul class="list-group">
                  <li class="list-group-item">
                    <h5>我的活动</h5>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 我的预约 </a>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 我的拍卖 </a>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 我的回收单 </a>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 我的必购码 </a>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 我的口令 </a>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 更多> </a></li>
                </ul>

                <p></p>

                <ul class="list-group">
                  <li class="list-group-item">
                    <h5>客户服务</h5>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 返修退还货 </a>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 价格保护 </a>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 我的发票 </a>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 购买咨询 </a>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 交易纠纷 </a>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 更多> </a></li>
                </ul>

                <p></p>

                <ul class="list-group">
                  <li class="list-group-item">
                    <h5>特色业务</h5>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 我的营业厅 </a>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 京东通信 </a>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 医疗服务 </a>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 流量加油站 </a>
                  </li>
                  <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 更多> </a></li>
                </ul>
              </div>
              <div class="col-md-10">
                <div class="card bg-default">
                  <div class="card-header">
                    <h5 class="text-center">我的购物车</h5>
                  </div>
                  <div class="card-body" style="padding-top: 0; padding-bottom: 0;">
                    <form>
                      <table class="table table-hover">
                        <thead>
                          <tr>
                            <th>商品</th>
                            <th>单价</th>
                            <th>数量</th>
                            <th>小计</th>
                            <th>操作</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:set var="sum" />
                          <c:forEach var="i" items="${shops }">
                            <tr>
                              <td><img src="../resources/img/test_180_180.jpg" style="width: 100px; height: 100px;"
                                  class="float-left" />
                                <span style="width: 350px; display: inline-block; margin-left: 10px;"
                                  class="float-left">${i.title }</span></td>
                              <td>￥${i.comment == 0 ? i.price : 'i.comment' }</td>
                              <td>
                                <%-- 
                                FIXME --%> <%-- <input type="number" value="${i.count }" style="width: 80px;"> --%>
                                ${i.count }
                              </td>
                              <td>￥${i.price*i.count }</td>
                              <td>
                                <button class="btn btn-outline-danger btn-sm"
                                  onclick="delConfirm('确定要将商品删除吗',
                            '${pageContext.request.contextPath}/user/user_car_del','${i.id}&mode=1','ajax_no')">删除</button>
                                <br>
                                <button class="btn btn-outline-danger btn-sm"
                                  onclick="delConfirm('确定要将该商品删除并添加到关注吗',
                            '${pageContext.request.contextPath}/user/user_add.follow','${i.id}','ajax_no')">移入关注</button>
                              </td>
                            </tr>
                            <c:set var="sum" value="${sum+i.price*i.count }" />
                          </c:forEach>

                        </tbody>
                      </table>
                    </form>
                  </div>
                  <div class="card-footer">
                    <button class="btn btn-outline-danger btn-sm"
                      onclick="delConfirm('确定要将购物车清空吗',
                            '${pageContext.request.contextPath}/user/user_car_del','${user.id }&mode=2','ajax_no')">清空购物车</button>
                    <%-- 右面 --%>
                    <button class="btn btn-outline-dark btn-sm float-right">去结算</button>
                    <p class="float-right btn-sm" style="margin-bottom: 0; margin-right: 40px;">合计:${sum }</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-1"></div>
        </div>

      </div>
    </div>

  </div>

  <%@ include file="../footer.jsp"%>

  <!--删除确认框-->
  <div class="modal" role="dialog" id="delConfirmModal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">操作</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <h5 class="text-danger" id="prompt"></h5>
        </div>
        <div class="modal-footer">
          <input type="hidden" id="url" />
          <button type="button" class="btn btn-default" data-dismiss="modal">放弃</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal" id="delButtonConfirm">删除</button>
        </div>
      </div>
    </div>
  </div>

  <script>
    function delConfirm(prompt, delAddr, id, ajaxRequest) {
      $('#prompt').html(prompt);
      $('#url').val(delAddr + '?id=' + id);
      $('#delButtonConfirm').click(function () {
        if (ajaxRequest == 'ajax_no') {
          location.replace($('#url').val());
        } else if (ajaxRequest == 'ajax_yes') {
          $.ajax({
            type: "get",
            url: $('#url').val(),
            dataType: "json",
            success: function (data) {
              if (data.id != -1) {
                //删除页面节点
                $("button[name='delButton']").each(function () {
                  if ($(this).attr('data-value') == data.id) {
                    var tr = $(this).parent().parent();
                    tr.remove();
                  }
                });
              }
            }
          });
        }
      });
      $('#delConfirmModal').modal();
    }
  </script>

</body>

</html>