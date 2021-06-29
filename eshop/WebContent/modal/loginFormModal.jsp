<%@ page pageEncoding="UTF-8"%>

<div class="modal" id="loginFormModal" role="dialog">
	<form role="form"
		action="${pageContext.request.contextPath}/login.action" method="post">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">用户登录</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label>用户名</label><input type="text"
							class="form-control" id="username" />
					</div>
					<div class="form-group">
						<label>密码</label><input
							type="password" class="form-control" id="password" />
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" type="button"
						onclick="login('${redirUrl}','${pageContext.request.contextPath}')">登录</button>
					<button class="btn btn-default" type="button" data-dismiss="modal"
						<c:if test="${!empty backUrl}">onclick=closeLogForm('${backUrl}')</c:if>>关闭窗口</button>
				</div>
			</div>
		</div>
	</form>
</div>
