<%@ page pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">

<head>
<title>管理员添加菜品信息</title>
<%@ include file="../head.jsp"%>

</head>

<body>
	<%@ include file="admin_nav.jsp"%>

	<div class="container-fluid">
		<div class="row">

			<div class="col-md-2"></div>

			<div class="col-md-8">
				<div class="card bg-default border-warning">
					<!-- 卡片  -->
					<h5 class="card-header bg-warning text-center text-white">
						修改分类</h5>
					<form role="form" method="post" action="admin_type_update">
						<input type="hidden" name="id" value="${type.id }">
						<div class="card-body">
							<div class="form-group">
								<label> 分类名称 </label> <input type="text" class="form-control"
									name=fn value="${type.typename }" />
							</div>
						</div>
						<div class="card-footer text-center">
							<button type="submit" class="btn btn-warning">确认修改</button>
							&nbsp;&nbsp; <a href="javascript:history.back()"> 放弃取消 </a>
						</div>
					</form>
				</div>
			</div>

			<div class="col-md-2"></div>

		</div>
	</div>

</body>

</html>