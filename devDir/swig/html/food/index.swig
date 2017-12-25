{% set target ="餐饮管理" %}
{% set selectedMenu = {caption:'餐饮管理',child : '订单管理'} %}

{% extends "../../layout/_layout-admin.swig" %}


{% block title -%}
{% parent %}-{{target}}
{%- endblock %}

{%- block style %}
<link rel="stylesheet" href="{{css.root + 'admin.css'}}">
<link rel="stylesheet" href="{{css.pages + 'meeting.css'}}">
{% endblock -%}

{% block content %}
<div class="g-content">
	<div class="meeting-panel">
		<div class="search-box">
			<div class="search" id="search-bar">
				<div class="search-item">
					<label for="name" class="search-label">快捷查询</label>
					<div class="search-box">
						<input type="text" name="name" class="form-control meetingName" id="name" placeholder="订单号/用户名">
					</div>
				</div>
				<div class="search-item">
					<label for="tradeDate" class="search-label">支付时间</label>
					<div class="search-box">
						<input type="text" name="date" class="form-control" id="tradeDate" readonly>
					</div>
				</div>
				<div class="search-item">
					<span class="search-label">订餐类型</span>
					<div class="search-box">
						<div class="m-select" id="dropdown-price">
							<input type="text" class="form-control select-txt" value="请选择" readonly data-toggle="dropdown" data-name="type">
							<input type="hidden" name="type">
							<span class="select-caret"></span>
							<div class="dropdown-menu">
								<a href="javascript:;" class="dropdown-item" data-value="0">全部</a>
								<a href="javascript:;" class="dropdown-item" data-value="1">类型一</a>
								<a href="javascript:;" class="dropdown-item" data-value="2">类型二</a>
							</div>
						</div>
					</div>
				</div>

				<div class="search-item">
					<span class="search-label">价格范围</span>
					<div class="search-box">
						<div class="m-dateRange">
							<input type="text" name="startPrice" class="form-control">
							<span class="time-gutter"></span>
							<input type="text" name="endPrice" class="form-control">
						</div>
					</div>
				</div>
			</div>
			<!-- search -->
			<div class="search btns">
			   <button type="button" class="btn btn-primary btn-search"><i class="iconfont-search"></i>搜索</button>
			   <button type="button" class="btn btn-secondary" id="export">导出</button>
			</div>
		</div>
		<!-- data table -->
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link active" href="#meeting-all" data-toggle="tab">全部</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#meeting-unused" data-toggle="tab">未使用</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#meeting-use" data-toggle="tab">使用中</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#meeting-done" data-toggle="tab">已结束</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#meeting-cancel" data-toggle="tab">已取消</a>
			</li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="meeting-all">
				<div class="data-table">
					<table class="table table-head table-hover">
						<thead>
							<tr>
								<td width="300">名称</td>
								<td width="220">图片</td>
								<td width="200">价格</td>
								<td width="200">配置</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="text-sm-left"><a href="">HSLJD201709081235</a></td>
								<td>
									<div class="img-wrap">
										<img src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=671505305,1685601327&fm=27&gp=0.jpg" class="img-fluid" alt="">
									</div>
								</td>
								<td>
									<span class="price">186</span>
								</td>
								<td>婚宴</td>
								<td>
									<a href="" class="btn-link">编辑</a>
									<a href="" class="btn-link text-primary">查看</a>
									<a href="" class="btn-link text-subsidiary">取消</a>
									<a href="" class="btn-link text-danger">删除</a>
								</td>
							</tr>
							<tr>
								<td class="text-sm-left"><a href="">HSLJD201709081235</a></td>
								<td>
									<div class="img-wrap">
										<img src="http://www.sinaimg.cn/dy/slidenews/78_img/2016_21/77017_1801578_995970.jpg" class="img-fluid" alt="">
									</div>
								</td>
								<td>
									<span class="price">186</span>
								</td>
								<td>婚宴</td>
								<td>
									<a href="" class="btn-link">编辑</a>
									<a href="" class="btn-link text-primary">查看</a>
									<a href="" class="btn-link text-subsidiary">取消</a>
									<a href="" class="btn-link text-danger">删除</a>
								</td>
							</tr>
							<tr>
								<td class="text-sm-left"><a href="">HSLJD201709081235</a></td>
								<td>
									<div class="img-wrap">
										<img src="http://www.sinaimg.cn/dy/slidenews/78_img/2016_21/77017_1801574_545002.jpg" class="img-fluid" alt="">
									</div>
								</td>
								<td>
									<span class="price">186</span>
								</td>
								<td>婚宴</td>
								<td>
									<a href="" class="btn-link">编辑</a>
									<a href="" class="btn-link text-primary">查看</a>
									<a href="" class="btn-link text-subsidiary">取消</a>
									<a href="" class="btn-link text-danger">删除</a>
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
			<div class="tab-pane" id="meeting-unused">2222</div>
			<div class="tab-pane" id="meeting-use">3333</div>
			<div class="tab-pane" id="meeting-done">4444</div>
			<div class="tab-pane" id="meeting-cancel">5555</div>
		</div>
	</div>
</div>
{% endblock %}
{% block scripts %}
<script src="{{js.lib.root + 'require.js'}}" data-main="{{js.pages + 'food.js'}}"></script>
{% endblock %}
