<script src="../../../../../../utf8-php/ueditor.all.js"></script>{% set target ="会议管理" %}
{% set selectedMenu = {caption:'会议管理',child : '会议室管理'} %}
{% extends "../../layout/_layout-admin.swig" %}


{% block title -%}
{% parent %}-{{target}}
{%- endblock %}

{%- block style %}
<link rel="stylesheet" href="{{css.root + 'admin.css'}}">
<link rel="stylesheet" href="{{css.pages + 'meeting.css'}}">
{% endblock -%}

{% block content %}
<div class="g-content" id="content" data-page="meeting-addRoom">
	<div class="meeting-panel">
		<form action="" class="form addRoom-form" id="addRoom-form">
			<div class="form-group row">
				<label for="roomName" class="offset-sm-label col-form-label">会议室名称</label>
				<div class="offset-sm-input">
					<input type="text" name="name" class="form-control w200" id="roomName">
				</div>
			</div>
			<div class="form-group row">
				<span class="offset-sm-label col-form-label">会议室图片</span>
				<div class="offset-sm-input">
					<div class="upload-container menuCate-logo clearfix">
						<label class="btn btn-sm btn-primary upload-btn" id="uploadRoomImage" data-name="url">上传图片</label>
						<strong class="upload-help">建议尺寸 600px * 600px</strong>
						<div class="upload-img-wrapper" id="uploadRoomImageContainer"></div>
					</div>
				</div>
			</div>
			<div class="form-group row search">
				<div class="search-item">
					<span class="offset-sm-label col-form-label">全天参考价</span>
					<div class="offset-sm-input">
						<div class="input-group">
							<input type="text" name="price" class="form-control">
							<span class="input-group-addon">天</span>
						</div>
					</div>
				</div>
				<div class="search-item text-danger">
					<span class="offset-sm-label col-form-label">半天参考价</span>
					<div class="offset-sm-input">
						<div class="input-group">
							<input type="text" name="halfPrice" class="form-control">
							<span class="input-group-addon">天</span>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<span class="offset-sm-label col-form-label">最多容纳</span>
				<div class="offset-sm-input search row">
					<div class="col-md-6 col-mdc-12">
						<div class="search-item">
							<input type="text" class="form-control w100">
						</div>
						<div class="search-item">
							<span class="search-label">院剧式</span>
							<div class="search-box">
								<input type="text" class="form-control w100">
							</div>
						</div>
						<div class="search-item">
							<span class="search-label">课桌式</span>
							<div class="search-box">
								<input type="text" class="form-control w100">
							</div>
						</div>
						<div class="search-item">
							<span class="search-label">回字式</span>
							<div class="search-box">
								<input type="text" class="form-control w100">
							</div>
						</div>
					</div>
					<div class="col-md-4 col-mdc-8 mdc-mb2">
						<div class="search-item">
							<span class="search-label">U字式</span>
							<div class="search-box">
								<input type="text" class="form-control w100">
							</div>
						</div>
						<div class="search-item">
							<span class="search-label">宴会式</span>
							<div class="search-box">
								<input type="text" class="form-control w100">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<span class="offset-sm-label col-form-label label-required">配　　置</span>
				<div class="offset-sm-input ui-options">
					<span class="option">
						<span class="ui-radio">
							<input type="radio" name="roomSize" class="ui-radio-normal" id="roomSize-ml">
							<label for="roomSize-ml" class="ui-radio-emulation"></label>
						</span>
						<label for="roomSize-ml" class="ui-label">婚宴</label>
					</span>
					<span class="option">
						<span class="ui-radio">
							<input type="radio" name="roomSize" class="ui-radio-normal" id="roomSize-s" checked>
							<label for="roomSize-s" class="ui-radio-emulation"></label>
						</span>
						<label for="roomSize-s" class="ui-label">小型会议</label>
					</span>
					<span class="option">
						<span class="ui-radio">
							<input type="radio" name="roomSize" class="ui-radio-normal" id="roomSize-m">
							<label for="roomSize-m" class="ui-radio-emulation"></label>
						</span>
						<label for="roomSize-m" class="ui-label">中型会议</label>
					</span>
					<span class="option">
						<span class="ui-checkbox">
							<input type="radio" name="roomSize" class="ui-radio-normal" id="roomSize-l">
							<label for="roomSize-l" class="ui-radio-emulation"></label>
						</span>
						<label for="roomSize-l" class="ui-label">大型会议</label>
					</span>
				</div>
			</div>
			<div class="form-group row">
				<span class="offset-sm-label col-form-label">描　　述</span>
				<div class="offset-sm-input">
					<div class="ueditor" id="ueditor">
						<!--<script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>-->
					</div>
					<div class="submit-row btns mt-2">
						<input type="submit" class="btn btn-success" value="提交">
						<button type="button" class="btn btn-outline-success" onclick="history.back();">返回</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
{% endblock %}
{% block scripts %}
<script src="{{js.lib.root + 'require.js'}}" data-main="{{js.pages + 'meeting.js'}}"></script>
<script src="{{js.lib.root + 'ueEditor/ueditor.config.js'}}"></script>
<script src="{{js.lib.root + 'ueEditor/ueditor.all.min.js'}}"></script>
<script src="{{js.lib.root + 'ueEditor/zh-cn.js'}}"></script>
{% endblock %}
