<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div aria-live="polite" aria-atomic="true">
        <div class="toast" style="position: absolute; top: 0; right: 0; z-index: 9;" data-animation="true"
          data-delay="3000">
          <div class="toast-header">
            <strong id="toastTitle" class="mr-auto"></strong>
            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="toast-body text-success" id="toastBody"></div>
        </div>
      </div>
    </div>
  </div>
</div>