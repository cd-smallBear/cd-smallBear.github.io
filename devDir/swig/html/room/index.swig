<script src="../../../../hotel/js/pages/webWorker.js"></script>{% set target ="房态管理" %}
{% set selectedMenu = {caption:'房态管理'} %}

{% extends "../../layout/_layout-admin.swig" %}


{% block title -%}
  {% parent %}-{{target}}
{%- endblock %}

{%- block style %}
<link rel="stylesheet" href="{{css.root + 'admin.css'}}">  
<link rel="stylesheet" href="{{css.pages + 'room.css'}}">
{% endblock -%}

{% block content %}
<div class="g-content">
	<div class="room-panel">
	 	<div class="room-deck clearfix">
		 	  <div class="room-meta clearfix">
		 	  	 <div class="item">
		 	  	 		<p class="txt">
		 	  	 			<span class="float-sm-right text-sm-right">空间房间<br/>
		 	  	 				<strong class="text-info">195</strong> 间
		 	  	 			</span>
		 	  	 			<span class="room-status-icon">
			 	  	 	 		<i class="iconfont-open"></i>
			 	  	 	 	</span>
		 	  	 		</p>
		 	  	 	 <div class="room-info">
		 	  	 	 		<i class="iconfont-repair"></i> 维修中的房间 3 间
		 	  	 	 </div>
		 	  	 </div>
		 	  	 <div class="item">
		 	  	 	<p class="txt">
		 	  	 			<span class="float-sm-right text-sm-right">预订 / <b class="text-info">已入住</b><br/>
		 	  	 				<span>25 / <strong class="text-danger">195</strong> 间</span>
		 	  	 			</span>
		 	  	 			<span class="room-status-icon">
			 	  	 	 		<i class="iconfont-close"></i>
			 	  	 	 	</span>
		 	  	 		</p>
		 	  	 	 <div class="room-info">
		 	  	 	 		<i class="iconfont-besom"></i> 请求打扫的房间 3 间
		 	  	 	 </div>
		 	  	 </div>
		 	  </div>
		 	  <form action="" class="search-form" autocomplete="off">
		 	  	<div class="search" id="search">
			 	  	<!-- 楼层 -->
			 	  	<div class="search-item">
				 	  	<div class="m-select">
								<input type="text" class="form-control select-txt" value="楼层筛选" readonly data-toggle="dropdown" data-name="floorNumer">
								<input type="hidden" name="floorNumer">
								<span class="select-caret"></span>
								<div class="dropdown-menu">
									<a href="javascript:;" class="dropdown-item" data-value="0">全部</a>
									<a href="javascript:;" class="dropdown-item" data-value="1">1楼</a>
									<a href="javascript:;" class="dropdown-item" data-value="2">2楼</a>
									<a href="javascript:;" class="dropdown-item" data-value="3">3楼</a>
								</div>
							</div>
						</div>
						<!-- 房型 -->
						<div class="search-item">
				 	  	<div class="m-select">
								<input type="text" class="form-control select-txt" value="房型筛选" readonly data-toggle="dropdown" data-name="houseCate">
								<input type="hidden" name="houseCate">
								<span class="select-caret"></span>
								<div class="dropdown-menu">
									<a href="javascript:;" class="dropdown-item" data-value="0">全部</a>
									<a href="javascript:;" class="dropdown-item" data-value="1">单间</a>
									<a href="javascript:;" class="dropdown-item" data-value="2">双单</a>
									<a href="javascript:;" class="dropdown-item" data-value="3">组合间</a>
								</div>
							</div>
						</div>
						<!-- 房号 -->
						<div class="search-item">
				 	  	<div class="m-select">
								<input type="text" class="form-control select-txt" value="房型筛选" readonly data-toggle="dropdown" data-name="houseNumer">
								<input type="hidden" name="houseNumer">
								<span class="select-caret"></span>
								<div class="dropdown-menu">
									<a href="javascript:;" class="dropdown-item" data-value="0">全部</a>
									<a href="javascript:;" class="dropdown-item" data-value="1">1号房</a>
									<a href="javascript:;" class="dropdown-item" data-value="2">2号房</a>
									<a href="javascript:;" class="dropdown-item" data-value="3">3号房</a>
								</div>
							</div>
						</div>
					</div>
				  <div class="search">
				  	<!-- search -->
						<div class="search-item mr-4">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="输入要查询的关键字/词">
								<span class="input-group-btn">
									<button type="button" class="btn btn-primary btn-search"><i class="iconfont-search"></i>查找</button>
								</span>
							</div>
						</div>
						<div class="search-item ml-4">
							<span class="btns">
							 <button type="button" class="btn btn-subsidiary" id="add-room">+添加房间</button>
							 <button type="button" class="btn btn-subsidiary" id="add-roomCate">+添加房型</button>
							 <button type="button" class="btn btn-subsidiary" id="add-floor">+添加楼层</button>
							</span>
						</div>
				  </div>
		 	  </form>
		</div>
		<div class="room-page">
			<ul class="nav navbar-nav clearfix">
				<li class="nav-item"><a class="nav-link active" href="javascript:;">1楼</a></li>
				<li class="nav-item"><a class="nav-link" href="javascript:;">2楼</a></li>
				<li class="nav-item"><a class="nav-link" href="javascript:;">3楼</a></li>
				<li class="nav-item"><a class="nav-link" href="javascript:;">4楼</a></li>
			</ul>
			<div class="room-container">
				 <div class="room-item room-entry">
				 	<p>房号：111</p>
				 	<p>
				 		类型：<span class="tag-line mr-2">单间</span>
				 		<i class="iconfont-entry entry"></i>
				 	</p>
				 </div>
				 <div class="room-item room-check">
				 	<p>房号：111</p>
				 	<p>类型：<span class="tag-line mr-2">标准间</span>
				 		<i class="iconfont-check check"></i>
				 	</p>
				 </div>
				 <div class="room-item room-besom">
				 	<p>房号：111</p>
				 	<p>
				 		类型：<span class="tag-line mr-2">标准间</span>
				 		<i class="iconfont-besom"></i>
				 	</p>
				 </div>
				 <div class="room-item room-repair">
				 	<p>房号：111</p>
				 	<p>
				 		类型：<span class="tag-line mr-2">标准间</span>
				 		<i class="iconfont-repair"></i>
				 	</p>
				 </div>
			</div>
			<div class="room-bar">
				<div class="room-status">
					 <span class="mr-2">
					 	<i class="iconfont-entry entry"></i>
					 	<span class="mark">可入住</span>
					 </span>
					 <span class="mr-2">
					 	<i class="iconfont-check check"></i>
					 	<span class="mark">已入住</span>
					 </span>
					 <span class="mr-2">
					 	<i class="iconfont-besom"></i>
					 	<span class="mark">打扫中</span>
					 </span>
					 <span class="mr-2">
					 	<i class="iconfont-repair"></i>
					 	<span class="mark">修理中</span>
					 </span>
				</div>
			</div>
		</div>
	</div>
	<!--<iframe src="https://cd-smallbear.github.io/hotel/room/index.html" frameborder="0"></iframe>-->
</div>
{% endblock %}
{% block scripts %}
<script src="{{js.lib.root + 'require.js'}}" data-main="{{js.pages + 'room.js'}}"></script>

{% endblock %}
