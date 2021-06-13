<%@ page pageEncoding="utf-8" %>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">

					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="navbar-toggler-icon"></span>
					</button>
					<a class="navbar-brand" href="homepage"><span class="text-info">网络点餐系统</span></a>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="navbar-nav">
							<li class="nav-item active">
								<a class="nav-link" href="admin_user_list">用户管理</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="admin_type_list">菜品分类管理</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="admin_food_list">菜品管理</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="admin_dc_show">查看用户点餐情况</a>
							</li>
						</ul>
						<ul class="navbar-nav ml-md-auto">
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown">${用户名 }</a>
								<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="../logout">退出登录</a>
								</div>
							</li>
						</ul>
					</div>

				</nav>
			</div>
		</div>
	</div>