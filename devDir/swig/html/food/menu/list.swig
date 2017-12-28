{% set target ="餐饮管理" %}
{% set selectedMenu = {caption:'餐饮管理',child : '菜单管理',subChild : "菜品列表"} %}

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
					<span class="check-option">批量启用</span>
					<span class="check-option">批量停用</span>
				</div>
				<div class="search-item">
					<a href="./addMenu.html" class="btn btn-subsidiary">+新增菜品</a>
				</div>
				<div class="search-item">
					<a href="./addMeal.html" class="btn btn-subsidiary">+新增套餐</a>
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
		<div class="data-table menuList-data" id="menuList-data">
			<table class="table table-head table-striped table-hover">
				<thead>
					<tr>
						<td width="40">
							<span class="ui-checkbox">
								<input type="checkbox" name="remove" class="ui-checkbox-normal" id="check-all">
								<label for="check-all" class="ui-checkbox-emulation"></label>
							</span>
						</td>
						<td width="300">菜品名称</td>
						<td>总销量</td>
						<td>价格</td>
						<td>总库存</td>
						<td>点餐开启</td>
						<td width="220">操作</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<span class="ui-checkbox">
								<input type="checkbox" name="remove" class="ui-checkbox-normal" id="del-id1212" data-id="id1212">
								<label for="del-id1212" class="ui-checkbox-emulation"></label>
							</span>
						</td>
						<td class="text-sm-left">
							<a href="">
								<span class="img-wrap">
									<img src="http://www.028yxx.com/uploads/image/20170508/thumb_20170508143923_3583.jpg" alt="">
								</span>四川舌尖张三李四
							</a>
						</td>
						<td>2312</td>
						<td>
							<span class="price">85.00</span>
						</td>
						<td>20</td>
						<td>
							<div class="m-switch">
								<input type="checkbox" class="ui-checkbox-normal switch-check menu-enable" id="switch-id1212" data-id="a121212">
								<label for="switch-id1212"></label>
							</div>
						</td>
						<td>
							<a href="" class="btn-link text-success">查看</a>
							<a href="" class="btn-link text-primary">编辑</a>
							<a href="javascript:;" class="btn-link text-danger del" data-id="id1212">删除</a>
						</td>
					</tr>
					<tr>
						<td>
							<span class="ui-checkbox">
								<input type="checkbox" name="remove" class="ui-checkbox-normal" id="del-id1213" data-id="id1213">
								<label for="del-id1213" class="ui-checkbox-emulation"></label>
							</span>
						</td>
						<td class="text-sm-left">
							<a href="">
								<span class="img-wrap">
									<img src="http://www.028yxx.com/uploads/image/20170508/thumb_20170508143245_0272.jpg" alt="">
								</span>四川舌尖张三李四
							</a>
						</td>
						<td>2312</td>
						<td>
							<span class="price">85.00</span>
						</td>
						<td>20</td>
						<td>
							<div class="m-switch">
								<input type="checkbox" class="ui-checkbox-normal switch-check menu-enable" id="switch-id1213" data-id="a121213">
								<label for="switch-id1213"></label>
							</div>
						</td>
						<td>
							<a href="" class="btn-link text-success">查看</a>
							<a href="" class="btn-link text-primary">编辑</a>
							<a href="javascript:;" class="btn-link text-danger del" data-id="id1213">删除</a>
						</td>
					</tr>
					<tr>
						<td>
							<span class="ui-checkbox">
								<input type="checkbox" name="remove" class="ui-checkbox-normal" id="del-id1214" data-id="id1214">
								<label for="del-id1214" class="ui-checkbox-emulation"></label>
							</span>
						</td>
						<td class="text-sm-left">
							<a href="">
								<span class="img-wrap">
									<img src="http://www.028yxx.com/uploads/image/20170508/thumb_20170508143524_5843.jpg" alt="">
								</span>四川舌尖张三李四
							</a>
						</td>
						<td>2312</td>
						<td>
							<span class="price">85.00</span>
						</td>
						<td>20</td>
						<td>
							<div class="m-switch">
								<input type="checkbox" class="ui-checkbox-normal switch-check menu-enable" id="switch-id1214" data-id="a121214">
								<label for="switch-id1214"></label>
							</div>
						</td>
						<td>
							<a href="" class="btn-link text-success">查看</a>
							<a href="" class="btn-link text-primary">编辑</a>
							<a href="javascript:;" class="btn-link text-danger del" data-id="id1214">删除</a>
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
