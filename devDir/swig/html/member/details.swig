
{% set target ="会员详情" %}
{% set selectedMenu = {caption:'会员查询'} %}

{% extends "../../layout/_layout-admin.swig" %}


{% block title -%}
  {% parent %}-{{target}}
{%- endblock %}
 
{%- block style %}
<link rel="stylesheet" href="/css/admin.css">  
<link rel="stylesheet" href="/css/pages/member.css">
{% endblock -%}

{% block content %}
<div class="g-content">
	<div class="member-panel">
		<!-- data table -->
 	  <div class="data-table">
	 	 	<table class="table table-bordered table-left">
 	 			<tr>
 	 				<td>姓名: 张三</td>
 	 				<td>电话: 15108565249</td>
 	 				<td colspan="2">身份证: 5113231977140205896</td>
 	 				<td>会员等级: 5</td>
 	 				<td colspan="2">联系地址: 金牛区XXX路11号</td>
 	 			</tr>
	 	 	  <tr>
 	 				<td colspan="2">邮箱: 287654829@qq.com</td>
 	 				<td>出生年月: 1988/05/09</td>
 	 				<td>兴趣：旅游、听歌</td>
 	 				<td>职业: 金融</td>
 	 				<td>注册日期: 2017/02/05</td>
 	 				<td>入住总天数：33</td>
 	 			</tr>
 	 			<tr>
 	 				<td colspan="2">总消费: <span class="price text-price">2155</span></td>
 	 				<td>推荐人: 李四</td>
 	 				<td colspan="4">关联酒店：XXX酒店</td>
 	 			</tr>
	 	 	</table>
 	  </div>
 	  <!-- 记录 -->
 	  <div class="data-records">
 	  	<p class="m-title"><span class="title">入住记录</span></p>
	  	<ul class="nav records-list">
	  		<li class="record-item">
	  			 <div class="record-head">
	  			 	<span class="order-number">订单号：<strong class="text-title">12345789</strong></span>
	  			 	<span class="order-hotel">XXxX</span>
	  			 	<span class="order-date">2017-10-25 10:20</span>
	  			 </div>
	  			 <div class="record-body">
	  			 	 <table class="table table-fixed">
	  			 	 	<tr>
	  			 	 		<td>姓名：张三</td>
	  			 	 		<td>联系方式：15108653259</td>
	  			 	 	</tr>
	  			 	 	<tr>
	  			 	 		<td>预订房间：标准套房</td>
	  			 	 		<td>订单金额：<span class="price text-price">562</span></td>
	  			 	 	</tr>
	  			 	 	<tr>
	  			 	 		<td>预订日期：2017/09/12</td>
	  			 	 		<td>入住日期：2017/12/14</td>
	  			 	 	</tr>
	  			 	 	<tr>
	  			 	 		<td>离店日期：2017/12/25</td>
	  			 	 		<td>备注：无</td>
	  			 	 	</tr>
	  			 	 </table>
	  			 </div>
	  		</li>
	  		<li class="record-item">
	  			 <div class="record-head">
	  			 	<span class="order-number">订单号：<strong class="text-title">12345789</strong></span>
	  			 	<span class="order-hotel">订单号：12345789</span>
	  			 	<span class="order-date">2017-10-25 10:20</span>
	  			 </div>
	  			 <div class="record-body">
	  			 	 <table class="table table-fixed">
	  			 	 	<tr>
	  			 	 		<td>姓名：张三</td>
	  			 	 		<td>联系方式：15108653259</td>
	  			 	 	</tr>
	  			 	 	<tr>
	  			 	 		<td>预订房间：标准套房</td>
	  			 	 		<td>订单金额：<span class="price text-price">562</span></td>
	  			 	 	</tr>
	  			 	 	<tr>
	  			 	 		<td>预订日期：2017/09/12</td>
	  			 	 		<td>入住日期：2017/12/14</td>
	  			 	 	</tr>
	  			 	 	<tr>
	  			 	 		<td>离店日期：2017/12/25</td>
	  			 	 		<td>备注：无</td>
	  			 	 	</tr>
	  			 	 </table>
	  			 </div>
	  		</li>
	  		<li class="record-item">
	  			 <div class="record-head">
	  			 	<span class="order-number">订单号：<strong class="text-title">12345789</strong></span>
	  			 	<span class="order-hotel">订单号：12345789</span>
	  			 	<span class="order-date">2017-10-25 10:20</span>
	  			 </div>
	  			 <div class="record-body">
	  			 	 <table class="table table-fixed">
	  			 	 	<tr>
	  			 	 		<td>姓名：张三</td>
	  			 	 		<td>联系方式：15108653259</td>
	  			 	 	</tr>
	  			 	 	<tr>
	  			 	 		<td>预订房间：标准套房</td>
	  			 	 		<td>订单金额：<span class="price text-price">562</span></td>
	  			 	 	</tr>
	  			 	 	<tr>
	  			 	 		<td>预订日期：2017/09/12</td>
	  			 	 		<td>入住日期：2017/12/14</td>
	  			 	 	</tr>
	  			 	 	<tr>
	  			 	 		<td>离店日期：2017/12/25</td>
	  			 	 		<td>备注：无</td>
	  			 	 	</tr>
	  			 	 </table>
	  			 </div>
	  		</li>
	  	</ul>
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
<!-- <script src="{{js.libPath + 'require.js'}}" data-main="/js/pages/member.js"></script> -->
{% endblock %}
