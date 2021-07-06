<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <title>随意购商城首页</title>
  <%@ include file="../header.jsp"%>
  <style>
    .radio_group input[type="radio"]:checked+label {
      padding: 0.2em 1em;
      border: 1px solid #6c757d;
      background: #6c757d;
      color: white;
    }

    .radio_group input[type="radio"]+label {
      padding: 0.2em 1em;
      border: 1px solid #CCCCCC;
      color: #999;
    }

    .radio_group_title {
      padding: 0.2em 0;
      padding-right: 1em;
      color: #000;
    }
  </style>
</head>

<body>
  <%@ include file="../nav.jsp"%>

  <div class="container mt-4">
    <div class="row">
      <div class="col-md-12">
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">首页</a></li>
            <li class="breadcrumb-item"><a href="#">女装</a></li>
            <li class="breadcrumb-item active">阿坝吧阿坝吧吧</li>
          </ol>
        </nav>
      </div>
    </div>
  </div>

  <div class="container">
    <div class="row">
      <div class="col-md-4">
        <img src="" />
      </div>
      <div class="col-md-8">
        <h5>h3. Lorem ipsum dolor sit amet.</h5>
        <div class="p-4 bg-light border">
          <p class="text-secondary">
            促销价：<span class="text-danger">￥<strong style="font-size: 20px;">233</strong></span>
          </p>
          <p class="text-secondary">
            原价：
            <del class="">￥233</del>
          </p>
          <p class="mb-0 text-secondary">已售出11件</p>
        </div>

        <form class="">

          <div class="input-group mb-3 radio_group">
            <div class="input-group-prepend">
              <div class="radio_group_title">颜色:</div>

              <input type="radio" name="color" id="color_1" style="display: none;"> <label for="color_1">红色</label>

              <input type="radio" name="color" id="color_2" style="display: none;"> <label for="color_2">黑色</label>

              <input type="radio" name="color" id="color_3" style="display: none;"> <label for="color_3">黑色</label>
            </div>
          </div>

          <div class="input-group mb-3 radio_group">
            <div class="input-group-prepend">
              <div class="radio_group_title">尺寸:</div>

              <input type="radio" name="size" id="size_1" style="display: none;"> <label for="size_1">女士S</label>

              <input type="radio" name="size" id="size_2" style="display: none;"> <label for="size_2">女士M</label>

              <input type="radio" name="size" id="size_3" style="display: none;"> <label for="size_3">女士L</label>
            </div>
          </div>

          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <div class="radio_group_title">数量:</div>

              <input type="number" name="count" value="1" min="1" max="99">
            </div>
          </div>

          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <div class="radio_group_title">运费:</div>

              <div class="radio_group_title">￥120</div>
            </div>
          </div>

          <div class="mb-3">
            <button type="button" class="btn btn-primary mr-2 btn-sm">
              立即购买
            </button>
            <button type="button" class="btn btn-primary btn-sm">
              加入购物车
            </button>
          </div>

        </form>
      </div>
    </div>
  </div>

  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <h5 class="card-header">商品详情</h5>
          <div class="card-body  p-0">
            <table class="table mb-0">
              <tbody>
                <tr>
                  <th>宝贝详情</th>
                  <td>TB - Monthly</td>
                </tr>
                <tr>
                  <th>产地</th>
                  <td>TB - Monthly</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="card-footer">
          	<img>
          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="../footer.jsp"%>
  <%@ include file="../modal/loginFormModal.jsp"%>
  <%@ include file="../modal/regFormModal.jsp"%>
</body>

</html>