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
<div class="g-content" id="content" data-page="foodMeal">
	<div class="food-panel">
		<form action="" class="form addmenu-form">
			<div class="form-group row">
				<span class="offset-sm-label col-form-label label-required">菜品图片</span>
				<div class="offset-sm-input">
					<div class="upload-container menuCate-logo clearfix">
						<div class="upload-img-wrapper" id="uploadMenuCateImageContainer"></div>
						<label class="btn btn-sm btn-primary upload-btn" id="uploadMenuCateImage" data-name="url">上传图片</label>
						<strong class="upload-help">建议尺寸 600px * 600px</strong>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<span class="offset-sm-label col-form-label label-required">菜品名称</span>
				<div class="offset-sm-input">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<span class="offset-sm-label col-form-label">第三方编码</span>
				<div class="offset-sm-input">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<span class="offset-sm-label col-form-label label-required">常规选项</span>
				<div class="offset-sm-input radio-options">
					<span class="radio-option">
						<span class="ui-radio">
							<input type="radio" name="prePrice" class="ui-radio-normal" id="meal" checked>
							<label for="meal" class="ui-radio-emulation"></label>
						</span>
						<label for="meal" class="ui-label">常规套餐</label>
					</span>
				</div>
			</div>
			<div class="form-group row">
				<span class="offset-sm-label col-form-label label-required">库存</span>
				<div class="offset-sm-input">
					<input type="text" name="warehouse" class="form-control" value="-1">
					<span class="text-subsidiary fs12 ml-1">-1 表示库存无上限</span>
				</div>
			</div>
			<div class="form-group row">
				<span class="offset-sm-label col-form-label label-required">销售价</span>
				<div class="offset-sm-input">
					<div class="input-group">
						<input type="text" name="salePrice" class="form-control" placeholder="0.00">
						<span class="input-group-addon">元</span>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<span class="offset-sm-label col-form-label label-required">展示价</span>
				<div class="offset-sm-input radio-options">
					<div class="input-group">
						<input type="text" name="disPrice" class="form-control" placeholder="0.00">
						<span class="input-group-addon">元</span>
					</div>
					<span class="text-subsidiary fs12 ml-1">此价格作点单页面展示之用，非售价。</span>
				</div>
			</div>
			<div class="form-group row">
				<span class="offset-sm-label col-form-label label-required">选择菜品</span>
				<div class="offset-sm-input">
					<input type="text" data-name="menuCate" class="form-control" readonly id="dropdownText-menuCate">
					<button type="button" class="btn btn-subsidiary align-top" id="addMenuCate">+添加菜品</button>
				</div>
			</div>
			<div class="form-group row">
				<span class="offset-sm-label col-form-label">菜品口味</span>
				<div class="offset-sm-input">
					<div class="m-switch">
						<input type="checkbox" class="ui-checkbox-normal switch-check menu-enable" id="menu-taste">
						<label for="menu-taste"></label>
					</div>
					<span class="menu-taste-label form-control-static">口味请设置</span>
				</div>
			</div>
			<div class="form-group row">
				<span class="offset-sm-label col-form-label">菜品分组</span>
				<div class="offset-sm-input">
					<div class="m-select" id="dropdown-menuCate">
						<input type="text" class="form-control select-txt" value="请选择" readonly data-toggle="dropdown" data-name="menu-category">
						<input type="hidden" name="menu-category">
						<span class="select-caret"></span>
						<div class="dropdown-menu">
							<a href="javascript:;" class="dropdown-item" data-value="0">全部</a>
							<a href="javascript:;" class="dropdown-item" data-value="1">菜品一</a>
							<a href="javascript:;" class="dropdown-item" data-value="2">菜品二</a>
							<a href="javascript:;" class="dropdown-item" data-value="3">菜品三</a>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<span class="offset-sm-label col-form-label">菜品标签</span>
				<div class="offset-sm-input">
					<button type="button" class="btn btn-subsidiary">+增加标签</button>
				</div>
			</div>
			<div class="form-group row">
				<span class="offset-sm-label col-form-label">商品信息</span>
				<div class="offset-sm-input">
					<div class="upload-container">
						<label class="btn btn-sm btn-primary upload-btn" id="uploadMenuCateDetail" data-name="sUrl">上传图片</label>
						<strong class="upload-help">建议尺寸 800px * 450px (最多可上传5张)</strong>
						<div class="upload-img-wrapper pb-2 clearfix" id="uploadMenuCateDetailContainer"></div>
					</div>
					<textarea name="mark" class="form-control" cols="10" rows="10" placeholder="最多可以输入150个汉字"></textarea>
					<div class="submit-row pt-1">
						<input type="submit" class="btn btn-success" value="提交">
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
{% endblock %}
{% block scripts %}
<script src="{{js.lib.root + 'require.js'}}" data-main="{{js.pages + 'food-menu.js'}}"></script>
{% endblock %}
