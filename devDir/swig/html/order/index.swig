{% set target ="订单详情" %}
{% set selectedMenu = {caption:'订单管理'} %}

{% extends "../../layout/_layout-admin.swig" %}


{% block title -%}
  {% parent %}-{{target}}
{%- endblock %}
 
{%- block style %}
<link rel="stylesheet" href="/css/admin.css"> 
<link rel="stylesheet" href="/css/pages/order.css">
{% endblock -%}

{% block content %}
<div class="g-content">
	<div class="order-panel">
	 	 <div class="search">
	 	 	 <div class="search-item">
		 	 	 <label for="orderNumber" class="search-label">　订单号</label>
		 	 	 <div class="search-box">
		 	 	 	  <input type="text" class="form-control orderNumber" id="orderNumber">
		 	 	 </div>
	 	 	 </div>
	 	 	 <div class="search-item">
		 	 	 <span class="search-label">　　状态</span>
		 	 	 <div class="search-box">
		 	 	 	  <div class="m-select" id="dropdown-status">
							<input type="text" class="form-control select-txt" value="请选择" readonly data-toggle="dropdown" data-name="orderState">
							<input type="hidden" name="orderState">
							<span class="select-caret"></span>
							<div class="dropdown-menu">
								<a href="javascript:;" class="dropdown-item" data-value="0">全部</a>
								<a href="javascript:;" class="dropdown-item" data-value="1">正常</a>
								<a href="javascript:;" class="dropdown-item" data-value="2">异常</a>
							</div>
						</div>
		 	 	 </div>
	 	 	 </div>
	 	 	 <div class="search-item">
		 	 	 <label for="userName" class="search-label">　　姓名</label>
		 	 	 <div class="search-box">
		 	 	 	  <input type="text" class="form-control userName" id="userName">
		 	 	 </div>
	 	 	 </div>
	 	 	 <div class="search-item">
		 	 	 <label for="userIdentity" class="search-label">身份证</label>
		 	 	 <div class="search-box">
		 	 	 	  <input type="text" class="form-control userIdentity" id="userIdentity">
		 	 	 </div>
	 	 	 </div>
	 	 </div>
	 	 <!-- search -->
	 	 <div class="search">
	 	 	 <div class="search-item">
		 	 	 <label for="entryStartDate" class="search-label">入住日期</label>
		 	 	 <div class="search-box">
		 	 	 	  <input type="text" class="form-control entryStartDate" id="entryStartDate">
		 	 	 </div>
	 	 	 </div>
	 	 	 <div class="search-item">
		 	 	 <label for="entryEndDate" class="search-label">退房日期</label>
		 	 	 <div class="search-box">
		 	 	 	  <input type="text" class="form-control entryEndDate" id="entryEndDate">
		 	 	 </div>
	 	 	 </div>
	 	 	 <div class="search-item">
		 	 	 <label for="createOrder" class="search-label">下单日期</label>
		 	 	 <div class="search-box">
		 	 	 	  <input type="text" class="form-control createOrder" id="createOrder" readonly>
		 	 	 </div>
	 	 	 </div>
	 	 	 <div class="search-item">
	 	 	 	 <button type="button" class="btn btn-primary btn-search"><i class="iconfont-search"></i>搜索</button>
	 	 	 </div>
	 	 </div>
	 	 <!-- data table -->
	 	  <div class="data-table">
		 	 	<table class="table table-separate">
		 	 		<thead>
		 	 			<tr>
		 	 				<td width="200">订单号</td>
		 	 				<td>房型</td>
		 	 				<td>房号</td>
		 	 				<td>天数</td>
		 	 				<td>入住时间</td>
		 	 				<td>退房时间</td>
		 	 				<td width="200">金额</td>
		 	 				<td>订单状态</td>
		 	 				<td>姓名</td>
		 	 				<td>下单时间</td>
		 	 				<td>付款状态</td>
		 	 				<td width="200">操作</td>
		 	 			</tr>
		 	 		</thead>
		 	 		<tbody>
			 	 		<tr>
			 	 			<td>HSLJD201709081235</td>
			 	 			<td>豪华标间</td>
			 	 			<td>2008</td>
			 	 			<td>2</td>
			 	 			<td>1</td>
			 	 			<td>2017-12-02</td>
			 	 			<td>
			 	 				总价：<span class="price text-subsidiary">265.32</span><br/>
			 	 				支付金额：<span class="price text-price">265.32</span><br/>
			 	 				折扣金额：<span class="price text-subsidiary">265.32</span><br/>
			 	 			</td>
			 	 			<td>
			 	 				<span class="text-danger">未支付</span><br/>
			 	 				<span class="text-info">预定成功</span>
			 	 				<span class="text-info">支付成功</span><br/>
			 	 				<span class="text-subsidiary">已取消</span>
			 	 				<span class="text-subsidiary">已退款</span>
			 	 				<span class="text-subsidiary">未退款</span>
			 	 			</td>
			 	 			<td>
			 	 				张三
			 	 			</td>
			 	 			<td>2017-12-12</td>
			 	 			<td>
			 	 				<span class="text-subsidiary">未付款</span>
			 	 				<span class="text-subsidiary">已付款</span>
			 	 			</td>
			 	 			<td>
			 	 				<span class="text-subsidiary">取消</span>
			 	 				<a href="/order/details.html" class="text-success">查看</a>
			 	 				<span class="text-danger">申请退款</span>
			 	 			</td>
			 	 		</tr>
			 	 		<tr>
			 	 			<td>HSLJD201709081235</td>
			 	 			<td>豪华标间</td>
			 	 			<td>2008</td>
			 	 			<td>2</td>
			 	 			<td>1</td>
			 	 			<td>2017-12-02</td>
			 	 			<td>
			 	 				总价：<span class="price text-subsidiary">265.32</span><br/>
			 	 				支付金额：<span class="price text-price">265.32</span><br/>
			 	 				折扣金额：<span class="price text-subsidiary">265.32</span><br/>
			 	 			</td>
			 	 			<td>
			 	 				<span class="text-danger">未支付</span><br/>
			 	 				<span class="text-info">预定成功</span>
			 	 				<span class="text-info">支付成功</span><br/>
			 	 				<span class="text-subsidiary">已取消</span>
			 	 				<span class="text-subsidiary">已退款</span>
			 	 				<span class="text-subsidiary">未退款</span>
			 	 			</td>
			 	 			<td>
			 	 				张三
			 	 			</td>
			 	 			<td>2017-12-12</td>
			 	 			<td>
			 	 				<span class="text-subsidiary">未付款</span>
			 	 				<span class="text-subsidiary">已付款</span>
			 	 			</td>
			 	 			<td>
			 	 				<span class="text-subsidiary">取消</span>
			 	 				<a href="/order/details.html" class="text-success">查看</a>
			 	 				<span class="text-danger">申请退款</span>
			 	 			</td>
			 	 		</tr>
		 	 		</tbody>
		 	 	</table>
		 	 	<div class="m-pagination">
			  	<ul class="pagination">
			  		<li class="page-pre disabled"><a href="#">‹</a></li>
			  		<li class="page-number active"><a href="javascript:;">1</a></li>
			  		<li class="page-number"><a href="javascript:;">2</a></li>
			  		<li class="page-next"><a href="javascript:;">›</a></li>
			  	</ul>
			  </div>
	 	  </div>
	</div>
</div>
{% endblock %}
{% block scripts %}
<script src="{{js.libPath + 'require.js'}}" data-main="/js/pages/order.js"></script>
{% endblock %}
