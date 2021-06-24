<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>管理员界面</title>

  <%@ include file="../head.jsp"%>
</head>

<body style="height: 100vh">
  <%@ include file="admin_nav.jsp"%>

  <div class="container-fluid" style="height: 100%;">
    <div class="row" style="height: 100%;">
      <div class="col-md-2" style="padding: 0;">
        <div id="card-480791">

          <ul class="list-group">
            <li class="list-group-item">
				<h5 class="nowTime mt-1 mb-1"></h5>
            </li>
          </ul>

          <div class="list-group">
            <a class="card-link collapsed list-group-item" data-toggle="collapse" data-parent="#card-480791"
              href="#card-element-001">用户管理</a>
            <div id="card-element-001" class="collapse">
              <a href="admin_list.admin_user" class="list-group-item list-group-item-action" target="iframe"> 管理员管理 </a>
              <a href="user_list.admin_user" class="list-group-item list-group-item-action" target="iframe">用户管理 </a>
            </div>
          </div>

          <div class="list-group">
            <a class="card-link collapsed list-group-item" data-toggle="collapse" data-parent="#card-480791"
              href="#card-element-002">商品管理</a>
            <div id="card-element-002" class="collapse">
              <a href="shop_list.admin_shop" class="list-group-item list-group-item-action" target="iframe">商品列表 </a>
              <a href="sort_list.admin_sort" class="list-group-item list-group-item-action" target="iframe">分类列表 </a>
              <a href="list.admin_type" class="list-group-item list-group-item-action" target="iframe">种类列表 </a>
            </div>
          </div>

          <div class="list-group">
            <a class="card-link collapsed list-group-item" data-toggle="collapse" data-parent="#card-480791"
              href="#card-element-003">消息管理</a>
            <div id="card-element-003" class="collapse">
              <a href="#" class="list-group-item list-group-item-action">用户留言 </a>
            </div>
          </div>

        </div>
      </div>
      <div class="col-md-10" style="padding: 0;">
        <iframe src="admin_welcome.jsp" frameborder="0" scrolling="no" height="100%" width="100%" name="iframe">
        </iframe>
      </div>
    </div>
  </div>

	<script type="text/javascript">
		/* 计时器 */
		function showTime() {
					var now = new Date();
					var time = now.toLocaleDateString() + " " + now.toLocaleTimeString();
					document.getElementsByClassName('nowTime')[0].innerHTML = time;
		}
		setInterval(showTime, 1000);

	</script>
</body>

</html>