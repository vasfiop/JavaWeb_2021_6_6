<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>修改个人资料</title>

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
                <img src="../resources/img/nav_logo.jpg" style="width: 190px; height: 120px;">
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
                        <a class="dropdown-item" href="index.personal">个人信息</a> <a class="dropdown-item"
                          href="safe.personal">账户安全</a> <a class="dropdown-item" href="#">收货地址</a> <a
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
                  href="user_car?id=${user.id }">
                  我的购物车 </a>

              </div>
            </div>

          </div>
          <div class="col-md-1"></div>
        </div>
      </div>
    </div>

  </div>

  <div class="container-fluid  bg-gray">
    <div class="row">
      <div class="col-md-1"></div>
      <div class="col-md-10">
        <div class="row">
          <div class="col-md-2">
            <div class="card bg-default">
              <div class="list-group">
                <div class="list-group-item">
                  <h5>账户设置</h5>
                </div>
                <a href="index.personal" class="list-group-item list-group-item-action">个人信息</a> <a href="safe.personal"
                  class="list-group-item list-group-item-action text-danger">账户安全</a>
                <a href="#" class="list-group-item list-group-item-action">收货地址</a>
                <a href="#" class="list-group-item list-group-item-action">我的银行卡</a>
                <a href="#" class="list-group-item list-group-item-action">账号绑定</a>
                <a href="#" class="list-group-item list-group-item-action">分享绑定</a>
                <a href="#" class="list-group-item list-group-item-action">我的尺码</a>
                <a href="#" class="list-group-item list-group-item-action">健康档案</a>
                <a href="#" class="list-group-item list-group-item-action">邮件订阅</a>
                <a href="#" class="list-group-item list-group-item-action">授权管理</a>
              </div>
            </div>
          </div>
          <div class="col-md-10">
            <div class="d-inline-flex p-3 text-white">
              <div class="p-2 text-center bg-white m-1" style="width: 240px;">
                <img src="../resources/img/phone.png" />
                <p class="text-center text-dark p-2">手机号</p>
                <small class="text-center text-dark">${newtel }</small>
                <a type="button" class="btn btn-md btn-outline-primary btn-block"
                  style="width:200px;margin:10px auto;" href="tel.safe">
                  修改手机号</a>
              </div>
              <div class="p-2 text-center bg-white m-1" style="width: 240px;">
                <img src="../resources/img/computer.png" />
                <p class="text-center text-dark p-2">登陆密码</p>
                <small class="text-center text-dark">定期更改密码有助于账号安全</small>
                <a type="button" class="btn btn-md btn-outline-primary btn-block"
                  style="width:200px;margin:10px auto;" href="password.safe">
                  修改登陆密码</a>
              </div>

              <div class="p-2 text-center bg-white m-1" style="width: 240px;">
                <img src="../resources/img/lock.png" />
                <p class="text-center text-dark p-2">账号冻结管理</p>
                <small class="text-center text-dark">紧急冻结账户停止账户的一切操作</small>
                <a type="button" class="btn btn-md btn-outline-primary btn-block"
                  style="width:200px;margin:10px auto;" href="frozen.safe">
                  紧急冻结</a>
              </div>

              <div class="p-2 text-center bg-white m-1" style="width: 240px;">
                <img src="../resources/img/zhuxiao.png" />
                <p class="text-center text-dark p-2">注销账号</p>
                <small class="text-center text-dark">彻底关闭不再使用京东账号</small>
                <a type="button" class="btn btn-md btn-outline-primary btn-block"
                  style="width:200px;margin:10px auto;" href="delete.safe">
                  注销账号</a>
              </div>
            </div>
            <div class="d-inline-flex p-3 text-white">
              <div class="p-2 text-center bg-white m-1" style="width: 240px;">
                <img src="../resources/img/zhang.png" />
                <p class="text-center text-dark p-2">快捷口令</p>
                <small class="text-center text-dark">获得快捷登陆口令代码</small>
                <a type="button" class="btn btn-md btn-outline-primary btn-block"
                  style="width:200px;margin:10px auto;" href="quick.safe">
                  快速获得</a>
              </div>
            </div>

          </div>
        </div>
      </div>
      <div class="col-md-1"></div>
    </div>
  </div>

  <%@ include file="../footer.jsp"%>
</body>

</html>