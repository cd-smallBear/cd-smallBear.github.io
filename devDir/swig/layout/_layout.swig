<!DOCTYPE html>
<html {% if htmlClass %}class="{{ htmlClass }}"{% endif %} lang="zh-hans">
<head>
	<meta charset="UTF-8">
	<title>{{ title }}{% block title %}{% endblock %}</title>

	{% block meta %}
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	{% endblock %}
    <link rel="stylesheet" href="{{css.common }}">

	{%- block style %}{% endblock -%}
	{% block preScript %}{% endblock %}
</head>
<body {% if bodyClass %}class="{{ bodyClass }}"{% endif %}>
	{#
	<!--[if !gte IE 9]>
		<div class="alert alert-danger ie9-before" role="alert">
			<strong>错误！</strong>请使用IE9及以上浏览器访问！可<a href="http://down.360safe.com/cse/360cse_8.5.0.136.exe" class="btn btn-danger">下载360安全浏览器</a> 进行完美的体验.或者前往<a href="http://chrome.360.cn/"  class="btn btn-danger">360官网</a>进行下载
		</div>
	<![endif]-->
	#}
	{% if includeHead %}
		{% block g-head %}
		<div class="g-head">
		    {% include '../component/_nav.swig' %}
		</div>
		{% endblock %}
	{% endif %}
    <div class="g-main">
	    {% block main %}{% endblock %}
    </div>

	{% if includeFooter %}
	  {% include "../components/footer.swig" %}
	{% endif %}
	<script src="{{ js.lib.jq }}" ></script>
	<script src="{{ js.lib.bootstrap.tether }}"></script>
	<script src="{{ js.lib.bootstrap.base }}" ></script>
	<script src="{{ js.root + 'component/global.js'}}" ></script>
	{% block scripts %}{% endblock %}
</body>
</html>
