<%@ page pageEncoding="UTF-8"%>
<a href="${pageContext.request.contextPath }/user/info.person"
  class="list-group-item list-group-item-action ${personkey == 'info' ? 'active' : '' }">
  修改个人信息
</a>
<a href="${pageContext.request.contextPath }/user/password.person"
  class="list-group-item list-group-item-action ${personkey == 'password' ? 'active' : '' }">
  修改密码
</a>
<a href="${pageContext.request.contextPath }/user/address.person"
  class="list-group-item list-group-item-action ${personkey == 'address' ? 'active' : '' }">
  管理收货地址
</a>