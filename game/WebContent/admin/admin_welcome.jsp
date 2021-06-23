<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>管理员登陆界面</title>

  <%@ include file="../head.jsp" %>
</head>

<body>
  <h3 class="text-center m-4">
    欢迎&nbsp;${user.nickname }&nbsp;登陆后台管理系统
  </h3>
   <h3 class="text-center m-4">
    您最后一次登录的时间是&nbsp;${user.lastlogtime }&nbsp;
  </h3>
</body>

</html>