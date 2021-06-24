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
                    data-toggle="dropdown" style="margin-top: 70px; margin-left: 10%;">
                    首页 </a>
                  <div class="dropdown-menu" aria-labelledby="shouye">
                    <a class="dropdown-item" href="index.user_car">购物车</a> 
                    <a class="dropdown-item" href="index.user_collect">我的收藏</a> 
                    <a class="dropdown-item" href="#">我的订单</a> 
                    <a class="dropdown-item" href="#">我的活动</a> 
                    <a class="dropdown-item" href="#">客户服务</a>
                  </div>
                </div>

                <div class="dropdown">
                  <a class="btn dropdown-toggle float-left btn-lg" type="button" id="zhanghushezhi"
                    data-toggle="dropdown" style="margin-top: 70px; margin-left: 2%;"> 账户设置 </a>
                  <div class="dropdown-menu" aria-labelledby="zhanghushezhi">
                    <div class="row">
                      <div class="col-md-6">
                        <a class="dropdown-item" href="index.personal">个人信息</a>
                        <a class="dropdown-item" href="safe.personal">账户安全</a>
                        <a class="dropdown-item" href="index.user_talk">给管理员留言</a>
                        <a class="dropdown-item" href="#">我的银行卡</a>
                        <a class="dropdown-item" href="#">账号绑定</a>
                      </div>
                      <div class="col-md-6">
                        <a class="dropdown-item" href="#">分享绑定</a>
                        <a class="dropdown-item" href="#">我的尺码</a>
                        <a class="dropdown-item" href="#">健康档案</a>
                        <a class="dropdown-item" href="#">邮件订阅</a>
                        <a class="dropdown-item" href="#">授权管理</a>
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
                <a href="index.personal" class="list-group-item list-group-item-action text-danger">个人信息</a>
                <a href="safe.personal" class="list-group-item list-group-item-action">账户安全</a> <a href="#"
                  class="list-group-item list-group-item-action">收货地址</a>
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
            <form role="form" action="update.personal" method="POST">
              <div class="form-group">
                <label for="demo">您的用户名，该id唯一，且不可更改</label>
                <div class="input-group mb-3">
                  <div class="input-group-append">
                    <span class="input-group-text">用户名</span>
                  </div>
                  <input type="text" class="form-control" readonly value="${user.username }">
                </div>
              </div>
              <div class="form-group">
                <label for="demo">您的登陆名，用于登陆，请牢记呦~</label>
                <div class="input-group mb-3">
                  <div class="input-group-append">
                    <span class="input-group-text">登录名</span>
                  </div>
                  <input type="text" class="form-control" value="${user.signinname }" name="signinname">
                </div>
              </div>
              <div class="form-group">
                <label for="demo">您日常购物所使用的名字</label>
                <div class="input-group mb-3">
                  <div class="input-group-append">
                    <span class="input-group-text">昵称</span>
                  </div>
                  <input type="text" class="form-control" value="${user.nickname }" name="nickname">
                </div>
              </div>
              <div class="form-group">
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">性别</span>
                  </div>
                  <div class="input-group-text">
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="customRadioInline1" name="sex" class="custom-control-input" value="-1"
                        ${user.sex==-1? 'checked' :'' }>
                      <label class="custom-control-label" for="customRadioInline1">男</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="customRadioInline2" name="sex" class="custom-control-input" value="1"
                        ${user.sex==1? 'checked' :'' }>
                      <label class="custom-control-label" for="customRadioInline2">女</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="customRadioInline3" name="sex" class="custom-control-input" value="0"
                        ${user.sex==0? 'checked' :'' }>
                      <label class="custom-control-label" for="customRadioInline3">保密</label>
                    </div>
                  </div>
                </div>
              </div>
              <button type="submit" class="btn btn-outline-dark">提交</button>
            </form>
          </div>
        </div>
      </div>
      <div class="col-md-1"></div>
    </div>
  </div>

  <%@ include file="../footer.jsp"%>
</body>

</html>