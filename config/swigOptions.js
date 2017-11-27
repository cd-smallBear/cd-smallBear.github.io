var cdn = '//cdn.bootcss.com'

module.exports = {
  data: {
    title: "伙特酒店",
    css: {
      root : '/css/',
      path : '/css/pages/', //具体页面样式表路径
      common: '/css/common.css'
    },
    js:{
      path: '/js/pages/', //具体页面样式表
      base:'/js/common.js',
      libPath : "/js/lib/",
      lib :{
        jq: cdn+'/jquery/2.2.4/jquery.min.js',
        bootstrap: {
           base: cdn+'/bootstrap/4.0.0-alpha.5/js/bootstrap.js',
           tether: cdn+'/tether/1.4.0/js/tether.js'
        },
        tmpl: {
          js: 'js/lib/tmpl.min.js'
        },
        pikaday: {
          js: cdn+'/pikaday/1.4.0/pikaday.js',
          css: cdn+'/pikaday/1.4.0/css/pikaday.min.css'
        },
        datepicker: {
          'js': cdn+'/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js',
          'css': cdn+'/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css',
          'depen-after': cdn+'/bootstrap-datepicker/1.6.4'+'/locales/bootstrap-datepicker.zh-CN.min.js'
        },
        baiduMap: {
          js: 'http://api.map.baidu.com/api?v=2.0&amp;ak=CKmrIrkyFiamOWQzd4fua7LwiqxSaKxm&amp'
        },
      }
    },
    image:"/images/"
  },
  defaults: {cache: false},
}
// 'jq': { js: 'js/lib/jquery.min.js' },
// 'bootstrap': { js: 'js/lib/bootstrap.min.js'
// css: 'css/lib/bootstrap.min.css' },
// 'echarts': { js: cdn+'/echarts/3.2.3/echarts.min.js' },
// 'underscore': { js:cdn+'/underscore.js/1.8.3/underscore-min.js'}
