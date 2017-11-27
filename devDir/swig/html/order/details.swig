{% set target ="订单管理" %}
{% set selectedMenu = {caption:'订单管理'} %}

{% extends "../../layout/_layout-admin.swig" %}


{% block title -%}
  {% parent %}-{{target}}
{%- endblock %}
 
{%- block style %}
<link rel="stylesheet" href="{{css.root + 'admin.css'}}">  
<link rel="stylesheet" href="{{css.pages + 'order.css'}}">
{% endblock -%}

{% block content %}
<div class="g-content">
	<div class="order-panel">
		<div class="details">
			<!-- 订单 -->
			 <p class="m-caption">
		 	 		<span>订单信息</span>
		 	 </p>
		 	 <div class="data-table mt-0">
		 	 	<table class="table table-left">
		 	 		<tr>
		 	 			<td>订单号：JSHDF201810025355</td>
		 	 			<td>入住时间：2017/01/01</td>
		 	 			<td>退房时间: 2017/01/03</td>
		 	 			<td>入住天数：2</td>
		 	 			<td>入住方式: 正常入住</td>
		 	 		</tr>
		 	 		<tr>
		 	 			<td colspan="5">备注：she is my sin</td>
		 	 		</tr>
		 	 	</table>
		 	 </div>
		 	 <!-- 客户 -->
		 	 <p class="m-caption">
		 	 		<span>客户信息</span>
		 	 </p>
		 	 <div class="data-table mt-0">
		 	 	<table class="table table-left">
		 	 		<tr>
		 	 			<td>客人姓名：张三</td>
		 	 			<td>手机号码：15108236059</td>
		 	 			<td>证件号码: 5113231988052059457</td>
		 	 			<td>实名认证: 是</td>
		 	 			<td>同来宾客：2</td>
		 	 		</tr>
		 	 		<tr>
		 	 			<td colspan="5">备注：she is my sin</td>
		 	 		</tr>
		 	 	</table>
		 	 </div>
		 	 <!-- 房间 -->
		 	 <p class="m-caption">
		 	 		<span>房间信息</span>
		 	 </p>
		 	 <div class="data-table house-info-box">
		 	 	<table class="table table-bordered table-head">
		 	 		<thead>
		 	 			<tr>
			 	 			<td>房号</td>
			 	 			<td>房型</td>
			 	 			<td>同住宾客</td>
			 	 			<td>门市价格</td>
			 	 			<td>支付价格</td>
			 	 			<td>入住状态</td>
			 	 			<td>结帐状态</td>
			 	 			<td>操作</td>
			 	 		</tr>
		 	 		</thead>
		 	 		<tbody>
		 	 			<td>11</td>
		 	 			<td>豪华标间</td>
		 	 			<td>朋友</td>
		 	 			<td>
		 	 				<span class="price text-subsidiary">198.00</span>
		 	 			</td>
		 	 			<td>
		 	 				<span class="price text-price">120.00</span>
		 	 			</td>
		 	 			<td>在住</td>
		 	 			<td>未结</td>
		 	 			<td>
		 	 				<a href="javascript:;" class="btn-link">支付</a>
		 	 			</td>
		 	 		</tbody>
		 	 	</table>
		 	 </div>
		</div>
	</div>
</div>
{% endblock %}
{% block scripts %}
<script src="{{js.libPath + 'require.js'}}" data-main="/js/pages/room.js"></script>
{% endblock %}