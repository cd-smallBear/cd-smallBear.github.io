{% set target ="后台登录" %}
{% set htmlClass ="login-page" %}
{% extends "../../layout/_layout.swig" %}


{% block title -%}
  {% parent %}-{{target}}
{%- endblock %}

{%- block style %}
<link rel="stylesheet" href="/css/login.css">
{% endblock -%}

{% block main %}
<div class="account-box loginAdmin-pane">
	<div class="login-inner">
		<h1>{{title}}</h1>
		<p class="feedback-error invisible2">错误显示处</p>
		<div class="form">
			<form action="" id="loginForm" autocomplet="off">
				<div class="form-groups">
					<div class="form-group">
			      <input type="text" name="user" class="form-control form-control-lg userName" id="user" placeholder="工号">
						<label for="user" class="form-control-label"><i class="iconfont-user"></i></label>
					</div>
					<div class="form-group">
			      <input type="text" name="userpsd" class="form-control form-control-lg password" id="userpsd" placeholder="密码">
						<label for="userpsd" class="form-control-label" ><i class="iconfont-lock"></i></label>
					</div>
					<div class="emulation-shadow">
						<label for="user"></label>
						<label for="userpsd"></label>
					</div>
				</div>
				<div class="form-group">
					<p class="forget"><a href="javascript:;">忘记密码？</a></p>
					<button type="submit" class="btn btn-secondary form-submit" id="form-submit">登录</button>
				</div>
			</form>
		</div>
		{#
		<div class="extra">
			<a href="./regist.html">免费注册</a>
			<a href="./forgetPsd.html">找回密码</a>
		</div>
		#}
	</div>
</div>
{% endblock %}
{% block scripts %}
<script src="/js/pages/login.js"></script>
{% endblock %}
