
{% set target ="会员查询" %}
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
		 <form action="" class="form-search">
		 	 <div class="search pb-0">
		 	 	 <div class="search-item">
			 	 	 <label for="userName" class="search-label">　　　姓名</label>
			 	 	 <div class="search-box">
			 	 	 	  <input type="text" name="userName" class="form-control userName" id="userName">
			 	 	 </div>
		 	 	 </div>
		 	 	 <div class="search-item">
			 	 	 <label for="userPhone" class="search-label">电话</label>
			 	 	 <div class="search-box">
			 	 	 	  <input type="text" name="userPhone" class="form-control userPhone" id="userPhone">
			 	 	 </div>
		 	 	 </div>
		 	 	 <div class="search-item">
			 	 	 <label for="userName" class="search-label">总天数</label>
			 	 	 <div class="search-box">
			 	 	 	  <div class="m-dateRange">
				 	 	 	  <input type="text" name="startDay" class="form-control">
				 	 	 	  <span class="time-gutter"></span>
				 	 	 	  <input type="text" name="emdDay" class="form-control">
			 	 	 	  </div>
			 	 	 </div>
		 	 	 </div>
		 	 	 <div class="search-item">
			 	 	 <label for="userName" class="search-label">总价格</label>
			 	 	 <div class="search-box">
			 	 	 	  <div class="m-dateRange">
				 	 	 	  <input type="text" name="startPrice" class="form-control">
				 	 	 	  <span class="time-gutter"></span>
				 	 	 	  <input type="text" name="emdPrice" class="form-control">
			 	 	 	  </div>
			 	 	 </div>
		 	 	 </div>
		 	 	 <div class="search-item">
			 	 	 <label for="userName" class="search-label">　总日期</label>
			 	 	 <div class="search-box">
			 	 	 	  <div class="m-dateRange">
				 	 	 	  <input type="text" name="startDate" class="form-control" readonly id="startDate">
				 	 	 	  <span class="time-gutter"></span>
				 	 	 	  <input type="text" name="emdDate" class="form-control" readonly id="emdDate">
			 	 	 	  </div>
			 	 	 </div>
		 	 	 </div>
		 	 </div>
		 	 <!-- search -->
		 	 <div class="search mt-0 pl-1">
		 	 	 <div class="search-item">
			 	 	 <label for="entryStartDate" class="search-label">会员等级</label>
			 	 	 <div class="search-box">
			 	 	 	  <div class="m-select" id="dropdown-level">
								<input type="text" class="form-control select-txt" value="请选择" readonly data-toggle="dropdown" data-name="userLevel">
								<input type="hidden" name="userLevel">
								<span class="select-caret"></span>
								<div class="dropdown-menu">
									<a href="javascript:;" class="dropdown-item" data-value="0">全部</a>
									<a href="javascript:;" class="dropdown-item" data-value="1">1级</a>
									<a href="javascript:;" class="dropdown-item" data-value="2">2级</a>
								</div>
							</div>
			 	 	 </div>
		 	 	 </div>
		 	 	 <div class="search-item">
		 	 	 	 <button type="button" class="btn btn-primary btn-search"><i class="iconfont-search"></i>搜索</button>
		 	 	 </div>
		 	 	 <div class="search-item">
			 	 	 <div class="search-box">
			 	 	 	  <a href="javascript:;" class="btn btn-subsidiary ml-4" id="add-member">创建新会员</a>
			 	 	 </div>
		 	 	 </div>
		 	 </div>
	 	 </form>
	 	 <!-- data table -->
	 	  <div class="data-table">
		 	 	<table class="table table-separate table-hover">
		 	 		<thead>
		 	 			<tr>
		 	 				<td width="100">姓名</td>
		 	 				<td width="150">电话</td>
		 	 				<td width="120">支付方式</td>
		 	 				<td>入住日期</td>
		 	 				<td>离店日期</td>
		 	 				<td>入住天数</td>
		 	 				<td>总消费</td>
		 	 				<td>总天数</td>
		 	 				<td>会员等级</td>
		 	 				<td width="250">备注</td>
		 	 				<td width="120">操作</td>
		 	 			</tr>
		 	 		</thead>
		 	 		<tbody>
			 	 		<tr>
			 	 			<td>张三</td>
			 	 			<td>15108265024</td>
			 	 			<td>线上支付</td>
			 	 			<td>2017/08/25</td>
			 	 			<td>2017/09/25</td>
			 	 			<td>30</td>
			 	 			<td>
			 	 				<span class="price text-price">265.32</span><br/>
			 	 			</td>
			 	 			<td>30</td>
			 	 			<td>5</td>
			 	 			<td>she is my sin</td>
			 	 			<td>
			 	 				<a href="/member/details.html" class="text-success">查看</a>
			 	 				<a href="javascript:;" class="text-danger">删除</span>
			 	 			</td>
			 	 		</tr>
			 	 		<tr>
			 	 			<td>张三</td>
			 	 			<td>15108265024</td>
			 	 			<td>线上支付</td>
			 	 			<td>2017/08/25</td>
			 	 			<td>2017/09/25</td>
			 	 			<td>30</td>
			 	 			<td>
			 	 				<span class="price text-price">265.32</span><br/>
			 	 			</td>
			 	 			<td>30</td>
			 	 			<td>5</td>
			 	 			<td>she is my sin</td>
			 	 			<td>
			 	 				<a href="/member/details.html" class="text-success">查看</a>
			 	 				<a href="javascript:;" class="text-danger">删除</span>
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
<script src="{{js.libPath + 'require.js'}}" data-main="/js/pages/member.js"></script>
{% endblock %}
