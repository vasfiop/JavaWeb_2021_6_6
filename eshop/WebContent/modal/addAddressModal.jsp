<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal fade" id="add_new_address" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <form action="${pageContext.request.contextPath}/user/addAddress.person" method="post" id="form_address_change">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="myModalLabel">
            添加修改收货地址
          </h5>
          <button type="button" class="close" data-dismiss="modal">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-md-6">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">省</span>
                </div>
                <input type="text" class="form-control" placeholder="省" id="addr_province" name="addr_province"
                  required>
              </div>
            </div>
            <div class="col-md-6">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">市</span>
                </div>
                <input type="text" class="form-control" placeholder="市" id="addr_city" name="addr_city" required>
              </div>
            </div>
            <div class="col-md-6">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">区</span>
                </div>
                <input type="text" class="form-control" placeholder="区" id="addr_area" name="addr_area" required>
              </div>
            </div>
            <div class="col-md-6">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">街道</span>
                </div>
                <input type="text" class="form-control" placeholder="街道" id="addr_content" name="addr_content" required>
              </div>
            </div>
            <div class="col-md-6">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">收件人</span>
                </div>
                <input type="text" class="form-control" placeholder="收件人" id="addr_receiver" name="addr_receiver"
                  required>
              </div>
            </div>
            <div class="col-md-6">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">联系电话</span>
                </div>
                <input type="text" class="form-control" placeholder="联系电话" id="addr_tel" name="addr_tel" required>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">
            确定
          </button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">
            关闭窗口
          </button>
        </div>
      </div>
      <input value="" id="addr_id" name="addr_id" type="hidden">
    </form>
  </div>
</div>