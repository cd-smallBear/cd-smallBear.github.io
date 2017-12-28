{% set target ="餐饮管理" %}
{% set selectedMenu = {caption:'餐饮管理',child : '菜单管理',subChild : "菜品分组"} %}

{% extends "../../../layout/_layout-admin.swig" %}


{% block title -%}
{% parent %}-{{target}}
{%- endblock %}

{%- block style %}
<link rel="stylesheet" href="{{css.root + 'admin.css'}}">
<link rel="stylesheet" href="{{css.pages + 'catering.css'}}">
{% endblock -%}

{% block content %}
<div class="g-content">
	<div class="catering-panel">
		<div class="search-container">
			<div class="search" id="search-bar">
				<div class="search-item">
					<span class="check-option">调整分组顺序</span>
				</div>
				<div class="search-item">
					<a href="javascript:;" class="btn btn-subsidiary" id="addMenuGroup">+增加分组</a>
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
		<div class="menuGroup-data" id="menuGroup-data">
			<ul class="menuGroup-list clearfix">
				<li class="menuGroup-item">
					<h3>会议室</h3>
					<p class="intro">
						<span class="state float-sm-left">上架：20</span>
						<span class="operate">
							<a href="javascript:;" class="btn-link text-success">修改</a>
							<a href="javascript:;" class="btn-link text-danger">删除</a>
						</span>
					</p>
				</li>
				<li class="menuGroup-item">
					<h3>会议室</h3>
					<p class="intro">
						<span class="state float-sm-left">上架：20</span>
						<span class="operate">
							<a href="javascript:;" class="btn-link text-success">修改</a>
							<a href="javascript:;" class="btn-link text-danger">删除</a>
						</span>
					</p>
				</li>
				<li class="menuGroup-item">
					<h3>会议室</h3>
					<p class="intro">
						<span class="state float-sm-left">上架：20</span>
						<span class="operate">
							<a href="javascript:;" class="btn-link text-success">修改</a>
							<a href="javascript:;" class="btn-link text-danger">删除</a>
						</span>
					</p>
				</li>
				<li class="menuGroup-item">
					<h3>会议室</h3>
					<p class="intro">
						<span class="state float-sm-left">上架：20</span>
						<span class="operate">
							<a href="javascript:;" class="btn-link text-success">修改</a>
							<a href="javascript:;" class="btn-link text-danger">删除</a>
						</span>
					</p>
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
<script src="{{js.lib.root + 'require.js'}}" data-main="{{js.pages + 'catering-menu.js'}}"></script>
{% endblock %}
