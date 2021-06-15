<%@ page pageEncoding="utf-8"%>
<!--删除确认框-->
<div class="modal" role="dialog" id="delConfirmModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h5 class="modal-title">删除确认</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h5 class="text-danger" id="prompt"></h5>
			</div>
			<div class="modal-footer">
				<input type="hidden" id="url" />
				<button type="button" class="btn btn-default" data-dismiss="modal">放弃</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal"
					id="delButtonConfirm">删除</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>
	function delConfirm(prompt, delAddr, id, ajaxRequest) {
		$('#prompt').html(prompt);
		$('#url').val(delAddr + '?id=' + id);
		$('#delButtonConfirm').click(function() {
			if (ajaxRequest == 'ajax_no') {
				location.replace($('#url').val());
			} else if (ajaxRequest == 'ajax_yes') {
				$.ajax({
					type : "get",
					url : $('#url').val(),
					dataType : "json",
					success : function(data) {
						if (data.id != -1) {
							//删除页面节点
							$("button[name='delButton']").each(function() {
								if ($(this).attr('data-value') == data.id) {
									var tr = $(this).parent().parent();
									tr.remove();
								}
							});
						}
					}
				});
			}
		});
		$('#delConfirmModal').modal();
	}
</script>