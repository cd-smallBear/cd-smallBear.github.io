{% set target ="预定管理" %}
{% set selectedMenu = {caption:'会议管理',child : '预定管理'} %}

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
					<label for="meetingName" class="search-label">名称</label>
					<div class="search-box">
						<input type="text" name="name" class="form-control meetingName" id="meetingName">
					</div>
				</div>
				<div class="search-item">
					<span class="search-label">价格</span>
					<div class="search-box">
						<div class="m-select" id="dropdown-price">
							<input type="text" class="form-control select-txt" value="请选择" readonly data-toggle="dropdown" data-name="price">
							<input type="hidden" name="price">
							<span class="select-caret"></span>
							<div class="dropdown-menu">
								<a href="javascript:;" class="dropdown-item" data-value="0">全部</a>
								<a href="javascript:;" class="dropdown-item" data-value="1">500以下</a>
								<a href="javascript:;" class="dropdown-item" data-value="2">500-1000</a>
							</div>
						</div>
					</div>
				</div>
				<div class="search-item">
					<span class="search-label">面积</span>
					<div class="search-box">
						<div class="m-select" id="dropdown-volume">
							<input type="text" class="form-control select-txt" value="请选择" readonly data-toggle="dropdown" data-name="volume">
							<input type="hidden" name="volume">
							<span class="select-caret"></span>
							<div class="dropdown-menu">
								<a href="javascript:;" class="dropdown-item" data-value="0">全部</a>
								<a href="javascript:;" class="dropdown-item" data-value="1">50M<sup>2</sup></a>
								<a href="javascript:;" class="dropdown-item" data-value="2">100M<sup>2</sup></a>
							</div>
						</div>
					</div>
				</div>
				<div class="search-item">
					<span class="search-label">状态</span>
					<div class="search-box">
						<div class="m-select" id="dropdown-status">
							<input type="text" class="form-control select-txt" value="请选择" readonly data-toggle="dropdown" data-name="status">
							<input type="hidden" name="status">
							<span class="select-caret"></span>
							<div class="dropdown-menu">
								<a href="javascript:;" class="dropdown-item" data-value="0">全部</a>
								<a href="javascript:;" class="dropdown-item" data-value="1">未使用</a>
								<a href="javascript:;" class="dropdown-item" data-value="2">使用中</a>
								<a href="javascript:;" class="dropdown-item" data-value="2">已结束</a>
								<a href="javascript:;" class="dropdown-item" data-value="2">已取消</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- search -->
			<div class="search btns">
			   <button type="button" class="btn btn-primary btn-search"><i class="iconfont-search"></i>搜索</button>
			</div>
		</div>
		<!-- data table -->
		<div class="book-head">
			<div class="book-status">
			    <span class="enable">未预定</span>
				<span class="disable">已预定</span>
			</div>
			<div class="choice-date"></div>
			<p>2017年11月19日</p>
		</div>
		<div class="book-data data-table" id="book-data">
			<table class="table table-head table-hover">
				<thead>
					<tr>
						<td width="60">
							<span class="ui-checkbox">
								<input type="checkbox" name="remove" class="ui-checkbox-normal" id="del-all">
								<label for="del-all" class="ui-checkbox-emulation"></label>
							</span>
						</td>
						<td width="300">名称</td>
						<td width="220">单位</td>
						<td width="200">数量</td>
						<td width="200">搭配会议室</td>
						<td width="200">赔偿金额</td>
						<td>操作</td>
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
						<td class="text-sm-left">会议椅子</td>
						<td>把</td>
						<td>20</td>
						<td>会议室一</td>
						<td>
							<span class="price">80.00</span>
						</td>
						<td>
							<a href="" class="btn-link edit">编辑</a>
							<a href="javascript:;" class="btn-link text-danger del" data-id="id1212">删除</a>
						</td>
					</tr>
					<tr>
						<td>
							<span class="ui-checkbox">
								<input type="checkbox" name="remove" class="ui-checkbox-normal" id="del-id12123" data-id="id12123">
								<label for="del-id12123" class="ui-checkbox-emulation"></label>
							</span>
						</td>
						<td class="text-sm-left">会议椅子</td>
						<td>把</td>
						<td>20</td>
						<td>会议室一</td>
						<td>
							<span class="price">80.00</span>
						</td>
						<td>
							<a href="" class="btn-link edit">编辑</a>
							<a href="javascript:;" class="btn-link text-danger del" data-id="id1213">删除</a>
						</td>
					</tr>
					<tr>
						<td>
							<span class="ui-checkbox">
								<input type="checkbox" name="remove" class="ui-checkbox-normal" id="del-id12124" data-id="id12124">
								<label for="del-id12124" class="ui-checkbox-emulation"></label>
							</span>
						</td>
						<td class="text-sm-left">会议椅子</td>
						<td>把</td>
						<td>20</td>
						<td>会议室一</td>
						<td>
							<span class="price">80.00</span>
						</td>
						<td>
							<a href="" class="btn-link edit">编辑</a>
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
<script src="{{js.lib.root + 'require.js'}}" data-main="{{js.pages + 'meeting.js'}}"></script>
{% endblock %}
