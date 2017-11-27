{% set asideMenus = {
  '房态管理': { icon: 'room', 'url': '/room', index:true,children: {
    
  } },
  '订单管理': { icon: 'order', 'url': '/order', index:true,children: {
   
  } },
  '会员查询': { icon: 'member', 'url': '/member', index:true,children: {
   
  } },
  '营销中心': { icon: 'sale', 'url': '/sale',  children: {

  } },
  '餐饮管理': { icon: 'catering', 'url': '/food', children: {
   
  } },
  '会议管理': { icon: 'meeting', 'url': '/meeting', children: {
  
  } },
  '业绩报表': { icon: 'chart', 'url': '/performance', children: {
  
  } },
  '官网管理': { icon: 'home', 'url': '/home', children: {} },
} %}
<aside class="aside-menu">
  <ul class="nav">
    {% for val in asideMenus %}
    {% set parentLabel = loop.key %}
    <li class="menu-item{% if selectedMenu.caption == loop.key %} active{% endif %}" >
      <a href="{% if val.index %}{{ rootDir + val.url }}/index.html{% else %}{{ rootDir + val.url }}{% endif %}"><i class="aside-icon iconfont-{{ val.icon }}"></i>{{ loop.key }}</a>
      {% if val.children.length %}
      <ul class="nav subnav">
        {% for url in val.children %}
        <li {% if selectedMenu.caption===parentLabel && loop.key===selectedMenu.child %} class="active" {% endif %}>
          <a href="{{ val.url + url }}">{{ loop.key }}</a>
        </li>
        {% endfor %}
      </ul>
      {% endif %}
    </li>
    {% endfor %}
  </ul>
</aside>
