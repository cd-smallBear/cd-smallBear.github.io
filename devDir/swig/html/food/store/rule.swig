{% set target ="餐饮管理" %}
{% set selectedMenu = {caption:'餐饮管理',child : '菜品仓库',subChild : "菜品规格"} %}

{% extends "../../../layout/_layout-admin.swig" %}


{% block title -%}
{% parent %}-{{target}}
{%- endblock %}

{%- block style %}
<link rel="stylesheet" href="{{css.root + 'admin.css'}}">
<link rel="stylesheet" href="{{css.pages + 'food.css'}}">
{% endblock -%}

{% block content %}
<div class="g-content">
	<div class="food-panel">
		<div class="search-container">
			<div class="search" id="search-bar">
				<div class="search-item">
					<a href="javascript:;" class="btn btn-subsidiary" id="addMenuRule">+新增规格</a>
				</div>
				<div class="search-item search-input">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="输入要查询的关键字/词">
						<span class="input-group-btn">
							<button type="button" class="btn btn-primary btn-search"><i class="iconfont-search"></i>查找</button>
						</span>
					</div>
				</div>
			</div>
		</div>
		<!-- data table -->
		<div class="data-table menuRule-data">
			<table class="table table-head table-striped table-hover">
				<thead>
					<tr>
						<td width="200">规格名称</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>份</td>
						<td>
							<a href="" class="btn-link text-success">查看</a>
							<a href="" class="btn-link text-primary">编辑</a>
							<a href="javascript:;" class="btn-link text-danger del" data-id="id1212">删除</a>
						</td>
					</tr>
					<tr>
						<td>份</td>
						<td>
							<a href="" class="btn-link text-success">查看</a>
							<a href="" class="btn-link text-primary">编辑</a>
							<a href="javascript:;" class="btn-link text-danger del" data-id="id1212">删除</a>
						</td>
					</tr>
					<tr>
						<td>份</td>
						<td>
							<a href="" class="btn-link text-success">查看</a>
							<a href="" class="btn-link text-primary">编辑</a>
							<a href="javascript:;" class="btn-link text-danger del" data-id="id1212">删除</a>
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
<script src="{{js.lib.root + 'require.js'}}" data-main="{{js.pages + 'food-menu.js'}}"></script>
{% endblock %}
