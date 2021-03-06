<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<title>点餐系统首页</title>

<%@ include file="head.jsp"%>

</head>

<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">

					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="navbar-toggler-icon"></span>
					</button>
					<a class="navbar-brand" href="homepage.html"><span
						class="text-info">网络点餐系统</span></a>

					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="navbar-nav ml-md-auto">
							<li class="nav-item"><a class="nav-link btn"
								href="#modal-login" data-toggle="modal">登 录</a></li>
							<li class="nav-item"><a class="nav-link btn"
								href="#modal-register" data-toggle="modal">注 册</a></li>
						</ul>
					</div>

				</nav>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">

			<div class="col-md-4">
				<!-- 第一个4 -->
				<div class="list-group">
					<div class="list-group-item list-group-item-action active">
						<h4>热点菜品</h4>
					</div>
					<c:forEach var="f" items="${hot }">
						<div class="list-group-item">
							<img alt="${f.foodname }" src="./resources/${f.picture }"
								class="rounded" /> <a href="detail?id=${f.id }" target="_blank">${f.foodname }</a>
							${f.price }元
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="col-md-4">
				<!-- 第2个4 -->
				<div class="list-group">
					<div class="list-group-item list-group-item-action active">
						<h4>今日特价</h4>
					</div>
					<c:forEach var="f" items="${today }">
						<div class="list-group-item">
							<img alt="${f.foodname }" src="./resources/${f.picture }"
								class="rounded" /> <a href="detail?id=${f.id }" target="_blank">${f.foodname }</a>
							${f.comment }元
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="col-md-4">
				<!-- 第3个4 -->
				<div class="list-group">
					<div class="list-group-item list-group-item-action active">
						<h4>厨师推荐</h4>
					</div>

					<c:forEach var="f" items="${cooker }">
						<div class="list-group-item">
							<img alt="${f.foodname }" src="./resources/${f.picture }"
								class="rounded" /> <a href="detail?id=${f.id }" target="_blank">${f.foodname }</a>
							${f.price }元
						</div>
					</c:forEach>

				</div>
			</div>

		</div>
	</div>

	<!-- 登录模态框 -->
	<div class="modal fade" id="modal-login" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title text-info">用户登录</h4>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
				</div>

				<form action="login" method="POST">

					<div class="modal-body">
						<div class="form-group">
							<label for="un">用户名</label> <input type="text"
								class="form-control" name="un" required>
						</div>
						<div class="form-group">
							<label for="pw">密码</label> <input type="password"
								class="form-control" name="pw" required>
						</div>
					</div>

					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">登 陆</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">取 消</button>
					</div>
				</form>

			</div>

		</div>
	</div>
	<!-- 注册模态框 -->
	<div class="modal fade" id="modal-register" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">用户注册</h4>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<form action="register" method="POST">
					<div class="modal-body">
						<div class="form-group">
							<label for="un">用户名</label> <input type="text"
								class="form-control" name="un" required>
						</div>
						<div class="form-group">
							<label for="pw">密码</label> <input type="password"
								class="form-control" name="pw" required>
						</div>
						<div class="form-group">
							<label for="dh">电话</label> <input type="text"
								class="form-control" name="dh" required>
						</div>
						<div class="form-group">
							<label for="addr">地址</label> <input type="text"
								class="form-control" name="addr" required>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">确 定</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">取 消</button>
					</div>
				</form>
			</div>

		</div>
	</div>

</body>

</html>