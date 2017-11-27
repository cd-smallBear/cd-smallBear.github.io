{% set target ="登录" %}
{% set htmlClass ="login-page" %}
{% extends "../../layout/_layout.swig" %}


{% block title -%}
  {% parent %}-{{target}}
{%- endblock %}

{%- block style %}
<link rel="stylesheet" href="{{css.root + 'login.css'}}">
{% endblock -%}

{% block main %}
<div class="account-box login-pane">
	<div class="login-inner">
		<h1>{{title}}</h1><a href="/room/index.html" target="_blank">admin</a>
		<span class="checkOut">
			<a href="/login/loginAdmin.html">
			<i class="iconfont-exit"></i>
			</a>
		</span>
		<p class="intro">{{title}}管理系统</p>
		<p class="feedback-error invisible2">错误显示处</p>
		<div class="form">
			<form action="" id="loginForm" autocomplet="off">
				<div class="form-group">
		      <input type="text" name="user" class="form-control form-control-lg" id="user" placeholder="工号">
					<label for="user" class="form-control-label"><i class="iconfont-user"></i></label>
				</div>
				<div class="form-group">
		      <input type="text" name="userpsd" class="form-control form-control-lg" id="userpsd" placeholder="密码">
					<label for="userpsd" class="form-control-label" ><i class="iconfont-lock"></i></label>
				</div>
				<div class="form-group">
					<span class="remember">
						 <span class="ui-checkbox">
						 	 <input type="checkbox" name="remember" class="ui-checkbox-normal" id="remember">
						 	 <label for="remember" class="ui-checkbox-emulation"></label>
						 </span>
						 <label for="remember" class="ui-label">记住密码</span>
					</span>
					<button type="submit" class="btn btn-primary form-submit" id="form-submit">登录</button>
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
<script src="{{js.pages + 'login.js'}}"></script>
{% endblock %}
