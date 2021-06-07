<%@ page pageEncoding="utf-8" %>
  <!doctype html>
  <html lang="en">

  <head>
    <title>我的京东</title>

    <%@ include file="../head.jsp" %>

  </head>

  <body>
    <%@ include file="../nav.jsp" %>

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
                      <a class="btn dropdown-toggle float-left btn-lg" type="button" id="shouye" data-toggle="dropdown"
                        style="margin-top: 70px; margin-left: 10%;"> 首页 </a>
                      <div class="dropdown-menu" aria-labelledby="shouye">
                        <a class="dropdown-item" href="#">订单中心</a> <a class="dropdown-item" href="#">我的钱包</a> <a
                          class="dropdown-item" href="#">我的关注</a> <a class="dropdown-item" href="#">我的活动</a> <a
                          class="dropdown-item" href="#">客户服务</a>
                      </div>
                    </div>

                    <div class="dropdown">
                      <a class="btn dropdown-toggle float-left btn-lg" type="button" id="zhanghushezhi"
                        data-toggle="dropdown" style="margin-top: 70px; margin-left: 2%;"> 账户设置 </a>
                      <div class="dropdown-menu" aria-labelledby="zhanghushezhi">
                        <div class="row">
                          <div class="col-md-6">
                            <a class="dropdown-item" href="#">个人信息</a> <a class="dropdown-item" href="#">账户安全</a> <a
                              class="dropdown-item" href="#">收货地址</a> <a class="dropdown-item" href="#">我的银行卡</a> <a
                              class="dropdown-item" href="#">账号绑定</a>
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
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 我的订单 </a>
                      </li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 评价嗮单 </a>
                      </li>
                    </ul>

                    <p></p>

                    <ul class="list-group">
                      <li class="list-group-item">
                        <h5>我的钱包</h5>
                      </li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 优惠卷 </a>
                      </li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 京豆 </a>
                      </li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 白条 </a>
                      </li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 红包 </a>
                      </li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 礼品卡 </a>
                      </li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 更多> </a>
                      </li>
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
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 我的回收单
                        </a></li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 我的必购码
                        </a></li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 我的口令 </a>
                      </li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 更多> </a>
                      </li>
                    </ul>

                    <p></p>

                    <ul class="list-group">
                      <li class="list-group-item">
                        <h5>客户服务</h5>
                      </li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 返修退还货
                        </a></li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 价格保护 </a>
                      </li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 我的发票 </a>
                      </li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 购买咨询 </a>
                      </li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 交易纠纷 </a>
                      </li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 更多> </a>
                      </li>
                    </ul>

                    <p></p>

                    <ul class="list-group">
                      <li class="list-group-item">
                        <h5>特色业务</h5>
                      </li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 我的营业厅
                        </a></li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 京东通信 </a>
                      </li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 医疗服务 </a>
                      </li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 流量加油站
                        </a></li>
                      <li class="list-group-item"><a type="button" class="btn btn-sm btn-link text-secondary"> 更多> </a>
                      </li>
                    </ul>

                  </div>
                  <div class="col-md-10">
                    <!-- 右侧 -->
                    <div class="card">
                      <h5 class="card-header">我的钱包</h5>
                      <div class="card-body" style="padding: 0;">
                        <table class="table">
                          <thead>
                            <tr>
                              <th>0</th>
                              <th>63</th>
                              <th>0.00</th>
                              <th>0.00</th>
                              <th>0.00</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>优惠卷</td>
                              <td>京豆</td>
                              <td>余额</td>
                              <td>白条本月待还</td>
                              <td>小金库昨日收益</td>
                            </tr>

                          </tbody>
                        </table>
                      </div>
                      <!-- <div class="card-footer">Card footer</div> -->
                    </div>

                    <p></p>

                    <div class="row">
                      <div class="col-md-8">
                        <div class="card">
                          <h5 class="card-header">我的订单</h5>
                          <div class="card-body" style="padding: 0;">
                            <table class="table">
                              <thead>
                                <tr>
                                  <th>0</th>
                                  <th>0</th>
                                  <th>0</th>
                                  <th>0</th>
                                  <th>0</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>代付款</td>
                                  <td>待收货</td>
                                  <td>待评价</td>
                                  <td>退还/售后</td>
                                  <td>全部订单</td>
                                </tr>

                              </tbody>
                            </table>
                            <p></p>
                            <h6 class="text-center text-muted">
                              您买的东西太少了，这里都空空的，快去挑选合适的商品把！
                            </h6>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="card">
                          <div class="card-header">我的关注</div>
                          <div class="card-body" style="padding: 0;">
                            <table class="table">
                              <thead>
                                <tr>
                                  <th>0</th>
                                  <th>0</th>
                                  <th>0</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>商品关注</td>
                                  <td>店铺关注</td>
                                  <td>收藏内容</td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
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

      <%@ include file="../footer.jsp" %>

  </body>

  </html>