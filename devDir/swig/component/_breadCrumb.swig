{% set otherUrl = {
	'帐户管理':'/account',
	'绑定邮箱':'/account/email.html',
	'运单列表': '/storage/order.html'
	}
%}
{% if selectedMenu %}
<div class="m-breadcrumb">
	<a href="/" class="site"><i class="iconfont-home"></i></a>
	<ol class="breadcrumb">
	    {% for item in selectedMenu %}

				{% if loop.key == 'other' %}
				  {% for otherchilds in item %}
				  <li class="breadcrumb-item">
				      {% if loop.last %}
				       {{ otherchilds }}
				      {% else %}
                      <a href="{{ otherUrl[otherchilds] }}">{{ otherchilds }}</a>
				      {% endif %}
				      </li>
				  {% endfor %}
				{% else %}
					{% if !loop.last %}
				    <li class="breadcrumb-item">
						{% set menu = asideMenus[item] %}
						{% if menu %}
						    <a href="{{ menu.url }}">{{ item }}</a>
						{% else %}
							<a href="{{ otherUrl[item] }}">{{ item }}</a>
						{% endif %}
				    </li>
					{% else %}
				     	<li class="breadcrumb-item">{{ item }}</li>
					{% endif %}	
				{% endif %}
	    {% endfor %}
	</ol>
</div>
{% endif %}