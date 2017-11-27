<div class="logo">
	<a href="/"><img src="{{image + 'logo.png'}}" alt=""></a>
</div>
{% if adminPage %}
    {% include "./_adminNav.swig" %}
{% else %}
    {% include "./_loginNav.swig" %}
{% endif %}

