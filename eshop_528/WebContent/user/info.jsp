<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <title>随意购商城首页</title>
  <%@ include file="../header.jsp"%>
</head>

<body>
  <%@ include file="../nav.jsp"%>

  <div class="container mt-4">
    <div class="row">
      <div class="col-md-12">
        <div class="row">
          <div class="col-md-2">
            <div class="list-group">
				<%@ include file="./left_nav.jsp"%>
            </div>
          </div>
          <div class="col-md-10">
            <form role="form" action="changPersonalInfo.person?user_id=${user.user_id }" method="post">
              <div class="form-group">
                <label for="user_name">
                  <strong>用户名</strong>
                </label>
                <input type="text" class="form-control" id="user_name" value="${user.user_name }" readonly />
              </div>
              <div class="form-group">
                <label for="user_sex">
                  <strong>性别</strong>
                </label>
                <div class="d-flex">
                  <div>
                    <div class="custom-control custom-radio">
                      <input type="radio" class="custom-control-input" id="man" name="user_sex" value="0"
                        ${user.user_sex==0? 'checked' : '' }>
                      <label class="custom-control-label" for="man">男</label>
                    </div>
                  </div>
                  <div class="ml-2">
                    <div class="custom-control custom-radio">
                      <input type="radio" class="custom-control-input" id="woman" name="user_sex" value="1"
                        ${user.user_sex==1? 'checked' : '' }>
                      <label class="custom-control-label" for="woman">女</label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="user_age">
                  <strong>年龄</strong>
                </label>
                <input type="number" class="form-control" id="user_age" name="user_age" value="${user.user_age   }" />
              </div>
              <div class="form-group">
                <label for="user_email">
                  <strong>邮箱</strong>
                </label>
                <input type="email" class="form-control" id="user_email" name="user_email" value="${user.user_email   }" />
              </div>
              <button type="submit" class="btn btn-primary">
                提交
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="../footer.jsp"%>
  
</body>

</html>