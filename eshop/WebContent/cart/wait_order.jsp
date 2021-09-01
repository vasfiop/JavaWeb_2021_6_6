<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <title>随意购商城首页</title>
  <%@ include file="../header.jsp"%>
  <script type="text/javascript">
    function cancel(order_id) {
      $.post("${pageContext.request.contextPath}/cart/cancel.cart", {
          "order_id": order_id
        },
        function (res) {
          $('#list_group_' + res.order_id).remove();
        }, "json");
    };
  </script>
</head>

<body>
  <%@ include file="../nav.jsp"%>

  <div class="container mt-4">
    <div class="row">
      <div class="col-md-12">
        <div class="row">
          <div class="col-md-2">
            <%@ include file="./left_nav.jsp"%>
          </div>
          <div class="col-md-10">
            <%@ include file="./right_list_group.jsp"%>
          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="../footer.jsp"%>

</body>

</html>