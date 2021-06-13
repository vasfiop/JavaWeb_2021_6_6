<%@ page pageEncoding="utf-8" %>
<!doctype html>
<html lang="en">

<head>
  <title>管理员添加菜品信息</title>

  <%@ include file="../head.jsp" %>

</head>

<body>
  <%@ include file="admin_nav.jsp" %>

  <div class="container-fluid">
    <div class="row">

      <div class="col-md-2">
      </div>

      <div class="col-md-8">
        <div class="card bg-default border-warning">
          <!-- 卡片  -->
          <h5 class="card-header bg-warning text-center text-white">
            修改菜品
          </h5>
          <form role="form">
            <div class="card-body">

              <div class="form-group">
                <label>
                  菜品名称
                </label>
                <input type="text" class="form-control" name="foodname" value="窝窝头" />
              </div>
              <div class="form-group">
                <label>
                  菜品特色
                </label>
                <textarea class="form-control" rows="5" name="fea">一块钱四个</textarea>
              </div>
              <div class="form-group">
                <label>
                  主要原料
                </label>
                <textarea class="form-control" rows="3" name="mat">嘿嘿</textarea>
              </div>
              <div class="form-group">
                <label>
                  所属分类
                </label>
                <select class="form-control" name="type">
                  <option value="1">家常</option>
                  <option value="2">凉菜</option>
                  <option value="3">主食</option>
                  <option value="4" selected>饮品</option>
                </select>
              </div>
              <div class="form-group">
                <label>
                  菜品价格
                </label>
                <input type="text" class="form-control" name="price" value="1元" />
                <p class="text-info help-block">单位:元</p>
              </div>
              <div class="form-group">
                <label>
                  菜品图片
                </label>
                <input type="file" class="form-control-file" name="pic" />
                <p></p>
                <img alt="瘦身苹果牛奶饮" src="./resources/images/yinpin/03.jpg" class="rounded" />
              </div>
              <div class="form-group">
                <label>
                  菜品备注
                </label>
                <input type="text" class="form-control" name="comm" value="-1" />
                <p class="help-block">-1代表正常菜，0代表厨师推荐，正整数代表特价菜价格。</p>
              </div>
            </div>
            <div class="card-footer text-center">
              <button type="submit" class="btn btn-warning">
                确认添加
              </button>
              &nbsp;&nbsp;
              <a href="javascript:history.back()">
                放弃取消
              </a>
            </div>
          </form>
        </div>
      </div>

      <div class="col-md-2">
      </div>

    </div>
  </div>

</body>

</html>