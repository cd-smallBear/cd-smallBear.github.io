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
  '会议管理': { icon: 'meeting', 'url': '/meeting',children: {
      '会议室管理' :  "/index.html",
      '配置管理'   :  "/setting.html",
      '预定管理'   :  "/book.html"
  } ,title : '会议室'},
  '业绩报表': { icon: 'chart', 'url': '/performance', children: {
  
  } },
  '官网管理': { icon: 'home', 'url': '/home', children: {} },
} %}
<aside class="aside-menu">
  <ul class="nav">
    {% for val in asideMenus %}
    {% set parentLabel = loop.key %}
    <li class="menu-item{% if selectedMenu.caption == loop.key %} active{% endif %}" >
      {% set hasChild = 0 %}
      {% for childhas in val.children %}
        {% set hasChild = loop.index %}
      {% endfor %}

      {% if hasChild %}
        {% set href = 'javascript:;' %}
      {% else %}
        {% if val.index %}
           {% set href = rootDir + val.url + '/index.html'%}
        {% else %}
           {% set href = rootDir + val.url %}
        {% endif %}
      {% endif %}
      <a href="{{href}}">
        <i class="aside-icon iconfont-{{ val.icon }}"></i>{{ loop.key }}
        {% if hasChild %}
        <i class="aside-icon-arrow iconfont-arrow-right"></i>
        {% endif %}
      </a>

      {% if hasChild %}
      <div class="subnav">
        <h3>{{ val.title }}</h3>
        <ul class="nav">
          {% for url in val.children %}
          <li {% if (selectedMenu.caption === parentLabel && loop.key === selectedMenu.child) %} class="active" {% endif %}>
            <a href="{{ rootDir + val.url + url }}">{{ loop.key }}</a>
          </li>
          {% endfor %}
        </ul>
      </div>
      {% endif %}
    </li>
    {% endfor %}
  </ul>
</aside>
