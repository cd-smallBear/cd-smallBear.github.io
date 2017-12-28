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
		<div class="search-container">
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
		<div class="book-box">
			<div class="book-head">
				<div class="book-status">
					<span class="enable"><i class="enable-badge"></i>未预定</span>
					<span class="disable"><i class="disable-badge"></i>已预定</span>
				</div>
				<div class="choice-date">
					<a href="javascript:;" class="pre"><i class="iconfont-arrow-left"></i></a>
					<a href="javascript:;" class="next"><i class="iconfont-arrow-right"></i></a>
				</div>
				<p>2017年11月19日</p>
			</div>
			<!-- data table -->
			<div class="book-body carousel-box">
				<table class="table table-head">
					<thead>
						<tr>
							<td width="120">会议室名称<span class="prev-arrow" id="carouselPrev"></span></td>
							<td colspan="9">
								<div class="carousel-gallery" id="carousel-box">
									<div class="carousel-inner"></div>
								</div>
							</td>
							<td width="50">
								<span class="next-arrow" id="carouselNext"></span>
							</td>
						</tr>
					</thead>
					<tbody class="tbody" id="book-data">
						<tr>
							<td>会议室一</td>
							<td colspan="9">
								<div class="carousel-gallery" id="table-carousel-gallery">
									<div class="carousel-inner"></div>
								</div>
							</td>
							<td></td>
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
			<div class="book-head"><p>订单详情</p></div>
			<div class="book-body order-box">
				<table class="table">
					<tr>
						<td>预订号：顶替顶替李春雷虽</td>
						<td>会议室名称：辊奈</td>
						<td>预约价格：1200.00/天</td>
						<td>预约时期：2017-12-25 12:00 - 13:00</td>
					</tr>
					<tr>
						<td>面积：130m <sup>2</sup></td>
						<td>参会人数：20</td>
						<td>布置方式：婚宴</td>
						<td>LED：启用</td>
					</tr>
					<tr>
						<td>预订人：张三</td>
						<td>联系电话：15108231055</td>
						<td>支付状态：<span class="text-success">已支付</span><span class="text-danger">未支付</span></td>
						<td>订单状态：未筹备</td>
					</tr>
				</table>
				<div class="order-operate btns">
					<button type="button" class="btn btn-subsidiary ml-1">立即筹备</button>
					<button type="button" class="btn btn-subsidiary">取消</button>
					<button type="button" class="btn btn-subsidiary">删除</button>
				</div>
			</div>
		</div>
	</div>
</div>
{% endblock %}
{% block scripts %}
<script src="{{js.lib.root + 'require.js'}}" data-main="{{js.pages + 'meeting-book.js'}}"></script>
{% endblock %}
