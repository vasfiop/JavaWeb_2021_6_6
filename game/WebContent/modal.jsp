<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 登陆模态框 -->
<div class="modal fade" id="login">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- 模态框头部 -->
      <div class="modal-header">
        <h4>欢迎登陆</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <form action="login" method="POST">
        <!-- 模态框主体 -->
        <div class="modal-body">
          <h5 class="text-center">账户登陆</h5>
          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text">@</span>
            </div>
            <input type="text" class="form-control" placeholder="用户名/手机号" name="username" required>
          </div>
          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text">%</span>
            </div>
            <input type="password" class="form-control" placeholder="密码" name="password" required>
          </div>
          <a type="button" class="btn btn-outline-primary btn-block btn-sm" href="quick_log">
            我有快捷登陆口令
          </a>
        </div>
        <!-- 模态框底部 -->
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">登 陆</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">取
            消</button>
        </div>
      </form>

    </div>
  </div>
</div>

<!-- 注册模态框 -->
<div class="modal fade" id="register">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- 模态框头部 -->
      <div class="modal-header">
        <h4>欢迎注册</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <form action="register" method="POST">
        <!-- 模态框主体 -->
        <div class="modal-body">
          <h5 class="text-center">账户注册</h5>
          <div class="input-group mt-3 mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text">手机号</span>
            </div>
            <input type="text" class="form-control" placeholder="建议使用常用手机号" name="phone" required>
          </div>

          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text">用户名</span>
            </div>
            <input type="text" class="form-control" placeholder="您的账户名和登陆名" name="username" required>
          </div>
          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text">设置密码</span>
            </div>
            <input type="text" class="form-control" placeholder="建议使用两种或两种以上字符组合" name="password" required>
          </div>

        </div>

        <!-- 模态框底部 -->
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">注 册</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">取
            消</button>
        </div>
      </form>

    </div>
  </div>
</div>