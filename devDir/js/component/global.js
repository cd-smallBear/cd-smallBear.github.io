(function () {
 var HotelConfig = window.HotelConfig = {
        JsVersion : 1
     }
    var Hotel = window.Hotel = {
        // 方法，验证规则
        regex: {
            number: /^-?(?:\d+|\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$/,
            numxsm: /^[\d]+(\.[\d]{0,2})?$/, // 百份比验证
            mobile: /^(1(3|4|5|7|8)\d{9})$/i, // 手机验证
            tel: /^(0[0-9]{2,3})?(\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$|(^[48]00(\-)?\d{7}?)$/, // /^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/, // 座机验证 change @tag 可不要-
            decimal: /^(([1-9]\d*)(\.[\d]{1,2})?|0\.[\d]{1,2})$/, // 运单录入输入项
            email: /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/,
            faxes: /^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/,
            http: /^(?:http(?:s|):\/\/|)(?:(?:\w*?)\.|)(?:\w*?)\.(?:\w{2,4})(?:\?.*|\/.*|)$/ig, // 网址格式
            qq: /^[1-9][0-9]{4,10}$/ //QQ验证
        },
        accountURl: {
            getRandomCode: "../captcha/getKaptchaImage",
            checkRandomCode: "../captcha/kaptachaValidate",
            sendCode: "../phone/send4Psd",
            checkCode: "../phone/validCode4Psd"
        },
        uploadImageTruncate: 58,
        format: function (num, length) {
            var num = num + "",
                length = length || 4;
            if (num.length > length) {
                return num.substring(0, length) + " " + arguments.callee(num.substring(length), length);
            } else {
                return num;
            }
        },
        formatDate: function (timestamp) {
            if (!timestamp) {
                throw Error('timestamp is not empty!');
                return;
            }
            var date = new Date(timestamp);
            var year = date.getFullYear(),
                month = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1),
                day = date.getDate();
            return year + '-' + month + "-" + day;
        },
        formatDouble: function (number) {
          // 判断是否为数字类型
          if( Cms.regex.number.test(number) ) {
            number = number + '';
            if (Cms.regex.numxsm.test(number)) {
                // 如果最后一位为0，并且.不在第一位
                if (number.slice(-1) == '0' && number.indexOf(".") > 0)
                  number = number.slice(0, -1)
                return number - 0
            } else return Cms.formatDouble((number - 0).toFixed(2))
          }else return number
        },
        convertJson: function (json, acceptName) {
            var ret = {};
            if ($.isArray(json)) {
                $.each(json, function (i, item) {
                    if ($.isPlainObject(item)) {
                        for (var key in item) {
                            ret[acceptName + '[' + i + '].' + key] = encodeURIComponent(item[key]);
                        }
                    }
                });
            }
            return ret;
        },
        convertJsonNoCode: function (json, acceptName) {
            var ret = {};
            if ($.isArray(json)) {
                $.each(json, function (i, item) {
                    if ($.isPlainObject(item)) {
                        for (var key in item) {
                            ret[acceptName + '[' + i + '].' + key] = item[key];
                        }
                    }
                });
            }
            return ret;
        },
        // 弹出loading
        alertLoading: function(tit, hasBg) {
            var $tar, $bg

            $('body').find('> .pre-loading, >.pre-loading-bg').remove()

            $tar = $('<div class="pre-loading">{title}</div>'.replace(/{title}/,
              tit || '数据加载中,请稍后...'))

            hasBg && ($bg = $('<div class="pre-loading-bg" />').appendTo('body'))

            $tar.appendTo('body')
                .css('transform', 'translate({x}px, {y}px);'
                                    .replace(/{x}/, -$tar.outerWidth() * .5)
                                    .replace(/{y}/, -$tar.outerHeight() * .5))
                // .css('margin-left', -$tar.outerWidth() * .5 + "px")
                // .css('margin-top', -$tar.outerHeight() * .5 + "px");

            return function() {
                $tar.remove()
                $bg && $bg.remove()
            }
        },
        //转表单为对象
        serializeObject: function (form, isempty) {
            var isArray = false,
                objectData = {},
                isEmpty = isempty == undefined ? false : isempty,
                arrayData = form.serializeArray();

            $.each(arrayData, function () {
                var value;
                if (this.value) {
                    value = this.value;
                } else {
                    value = !isEmpty ? null : '';
                }
                //if (value != '') {
                if (objectData[this.name] == undefined) {
                    objectData[this.name] = value;
                } else {
                    if (!(objectData[this.name] instanceof Array )) {
                        objectData[this.name] = [objectData[this.name]];
                    }
                    isArray = true;
                    objectData[this.name].push(value);
                }
                //}

            });
            if (isArray) { // 如果有数组值变成1，2，3，4这样的字符串
                $.each(objectData, function (o, v) {
                    if (v instanceof Array) {
                        objectData[o] = v.join(",");
                    }
                });
            }
            return objectData;
        },
        randomString: function (len) {
            len = len || 32;
            /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
            var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';
            var maxPos = $chars.length;
            var pwd = [];
            for (var i = 0; i < len; i++) {
                pwd.push( $chars.charAt(Math.floor(Math.random() * maxPos)) );
            }
            return pwd.join("");
        },
        // 执行代码
        domeval: function (code, _doc) {
            var doc = _doc || document,
                script = doc.createElement('script')

            script.text = code
            doc.head.appendChild(script).parentNode.removeChild(script)
        },
        // 根据regexp.exec切割字符串
        strExec: function (str, index, relace) {
            var _length = str.length
            return [
                str.substring(0, index),
                str.substring(index + _length, _length),
            ].join('')
        },
        equal: function (a1, a2) {
            var t1 = Object.prototype.toString.call(a1),
                t2 = Object.prototype.toString.call(a2)

            if (t1 === '[object Object]' &&
                t2 === '[object Object]') {
                return Cms.equalOb(a1, a2)
            } else if (t1 === '[object Array]' &&
                t2 === '[object Array]') {
                return Cms.equalArr(a1, a2)
            } else {
                // 弱对比
                return a1 == a2
            }
        },
        // 对比object
        equalOb: function (ob1, ob2) {
            if (Object.keys(ob1).length === Object.keys(ob2).length) {
                for (var _f in ob1) {
                    if (ob1.hasOwnProperty(_f) &&
                        !Cms.equal(ob1[_f], ob2[_f])) {
                        return false
                    }
                }
                return true
            } else return false
        },
        // 对比Array
        equalArr: function (ar1, ar2) {
            var l1 = ar1.length, i;

            if (l1 == ar2.length) {
                for (i = 0; i < l1; i++) {
                    if (!Cms.equal(ar1[i], ar2[i])){
                        return false
                    }
                }
                return true
            } else return false
        },
        /**
         * require工具
         * @method requireUtil
         * @param  {string}    name [class名]
         * @param  {string}    method [调用方法名]
         */
        requireUtil: function (name, method) {
            require([name], function (fun) {
                if (method) fun[method]()
                else fun()
            })
        },
        // 获取java传递的临时变量
        getJavaTempData: function () {
            var _data = window.JavaTempCmsData

            delete window.JavaTempCmsData

            return _data
        },
        creatLink: function (href) {
            var linkDom = $('<link rel="stylesheet" href="' + href + '">'),
                id = href.split('/').pop()

            $('#' + id).remove()
            linkDom.attr('id', id)
            linkDom.appendTo($('head'))
        },
        stickup: function (tar, opt) {
            var option = $.extend({
                    fixedTop: 0,    // 钉住后的top值
                }, opt),
                $stickMenu = tar,
                $main = option.scroller || $(document),
                $offsetTop = $stickMenu.position().top

            $main.on('scroll', function (evt) {
                if ($(evt.target).scrollTop() >= $offsetTop) {
                    $stickMenu.css({position: 'fixed', top: $main.offset().top + option.fixedTop})
                } else {
                    $stickMenu.css('position', 'static')
                }
            })
        },
        listenerTransEnd: function (tar, callback) {
            $(tar).one(transntionEndEvent, callback)
        },
        // 帮助实现 transition
        reflow: function () {
            Array.prototype.slice.call(arguments).forEach(function (element) {
                new Function('bs', 'return bs')(element.offsetHeight)
            })
        },
        // 打开图片预览
        openEnlargeImg: function () {
            $(document).on('click.imgpreview', 'img:not(.previewEnlargeImg)', function (evt) {
                var _img = new Image(),
                    $img = $(_img),
                    $mask = $('<div class="modal-backdrop fade" />'),
                    $target = $(evt.target),
                    _imgWid, _imgHeg,
                    _wWid = window.innerWidth,
                    _wHeg = window.innerHeight,
                    _scale = 1

                _img.src = evt.target.src


                _imgWid = _img.width
                _imgHeg = _img.height
                if (_imgWid >= _wWid || _imgHeg >= _wHeg) { // 防止超出屏幕
                    _scale = Math.min((_wWid - 40) / _imgWid, (_wHeg - 40) / _imgHeg)

                    _imgWid *= _scale,
                        _imgHeg *= _scale
                }

                $img.attr('class', 'previewEnlargeImg').css($target.offset()).appendTo('body')
                $mask.appendTo('body')

                Cms.reflow($mask[0], _img)

                // 设置居中
                $img.css({
                    left: (_wWid - _imgWid) * .5,
                    top: (_wHeg - _imgHeg) * .5,
                    width: _imgWid,
                    height: _imgHeg,
                })
                $mask.addClass('in')

                $(document).one('click.closePrerview-enlarge', function () {
                    $img.remove()
                    $mask.remove()
                })
            })

            window.app && $(window.app).one('pageRemove', function () {
                Cms.closeEnlargeImg()
            })
        },
        closeEnlargeImg: function () {
            $(document).off('click.imgpreview')
        },
        requireConfig: {
            baseUrl: '/js',
            //  urlArgs: function(id, url) {
            //    console.log('arg: ', arguments)
            //    return url + '?v=' + '1'
            //  },
            urlArgs: 'v=' + HotelConfig.JsVersion,
            shim: {
                'jquery': {
                    exports: '$'
                },
                '  table': {
                    exports: 'table'
                },
                'edit': {
                    exports: 'editable'
                }
            },
            paths: {
                // 'validate'   : 'lib/validate',
                // 'webuploader': 'lib/webuploader',
                'jeDate'     : 'lib/jquery.jedate',
                // 'btTree'     : 'lib/bootstrap-treeview',
                // 'table'      : 'lib/bootstrap.table',
                // 'template'   : 'lib/template',
                // 'echarts'    : 'lib/echarts.min',
                // 'lazyload'   : 'lib/jquery.lazyload.min',

                'ajaxSub'       : 'component/ajaxsub',
                // 'tag'           : 'component/tag',
                // 'addProduct'    : 'component/new-product',
                // 'autoComplete'  : 'component/auto-complete',
                // 'areaCaseSelecter'   : 'component/area-case-selecter',
                // 'webuploader.setting': 'component/webuploader.setting',
                'bsDialog'      : 'component/bs-dialog',
       
           
                'dropdownSelect': 'component/dropdown.select',
                // 'ngUtil'        : 'component/ng-util',
                // 'createMap'     : 'component/createMap',
                // 'fileUploader'  : 'component/webuploader.file',
                // 'starJudge'     : 'component/star-judge',
                // 'caseSelecter'  : 'component/case-selecter',
                // 'netMap'        : 'component/netMap',
                // 'numbox'        : 'component/numbox',
                // 'pager'         : 'component/pager',
                // 'pointsMap'     : 'component/pointsMap',
                // 'showProduct'   : 'component/showProduct',
                // 'downtime'      : 'component/downtime',
                // 'selectTable'   : 'component/selecttable',
                // 'migrate'       : 'component/jquery-migrate-1.2.1.min',
                // 'jqprint'       : 'component/jquery.jqprint-0.3',
                // 'help'          : 'component/help',

                // 'setup'         : "pages/setup"
            }
        },

        // 设置侧边栏选中
        setAsideActive: function (app) {
            var _brds = app.$container.find('.breadcrumb-item'),
                $menus = $('.aside-menu .menu-item >a'),
                _txt, _setA

            _txt = (_brds.eq(0).text() == '首页' ? _brds.eq(1) : _brds.eq(0) ).text().trim()

            _setA = $menus.toArray().find(function (el) {
                return el.textContent.trim() == _txt
            })

            $menus.removeClass('active')
            _setA && $(_setA).addClass('active')
        },


        ellipsisStr: function (str, leng, label) {
            if (typeof str !== 'string') return ''

            return str.length > leng ?
                str.substr(0, leng) + (label || '...') :
                str
        },
        toggle : {
            target : null,
            setTarget : function(ele){
                if(ele.nodeType || ele[0].nodeType){
                    this.target = ele;
                }
            },
            removeTarget : function(){
              this.target = null;
            },
            disable : function(){
                $("body").on("click.disabledAllAlick",function(e){
                    if(this.target && this.target.has(e.target).length){
                        return true;
                    }
                    return false;
                }.bind(this));
            },
            enable : function(){
                $("body").off("click.disabledAllAlick");
            },
            fire : function(status){
                status = status || "disable" ;
                this[status]();
                return this;
            },
            remove : function(){
                return delete Cms.toggle;
            }
        },
        session : function(){
            return window.sessionStorage && {
                    getter :function(name){
                        return sessionStorage.getItem(name);
                    },
                    setter : function(key,value){
                        sessionStorage.setItem(key,value);
                    },
                    remove : function(name){
                        name = (name || "").split(" ");
                        name.forEach(function(item,i,arr){
                            sessionStorage.removeItem(item);
                        });
                    }
            }
        }(),
        // 获取浏览器类型及型号
        browser: (function( ua ) {
          var ret = {},
              webkit = ua.match( /WebKit\/([\d.]+)/ ),
              chrome = ua.match( /Chrome\/([\d.]+)/ ) ||
                  ua.match( /CriOS\/([\d.]+)/ ),

              ie = ua.match( /MSIE\s([\d\.]+)/ ) ||
                  ua.match( /(?:trident)(?:.*rv:([\w.]+))?/i ),
              firefox = ua.match( /Firefox\/([\d.]+)/ ),
              safari = ua.match( /Safari\/([\d.]+)/ ),
              opera = ua.match( /OPR\/([\d.]+)/ )

          webkit && (ret.webkit = parseFloat( webkit[1] ))
          chrome && (ret.chrome = parseFloat( chrome[1] ))
          ie && (ret.ie = parseFloat( ie[1] ))
          firefox && (ret.firefox = parseFloat( firefox[1] ))
          safari && (ret.safari = parseFloat( safari[1] ))
          opera && (ret.opera = parseFloat( opera[1] ))

          return ret
      })( navigator.userAgent ),
      // 节流器
      throttle: function () {
        var isClear = arguments[0],
            fn, param, p

        // 如果第一个参数是boolean, 代表是否清除计时器
        if( typeof isClear === 'boolean' ) {
          fn = arguments[1]

          fn.__throttleID && clearTimeout(fn.__throttleID)
        // 第一个参数为函数
        }else {
          fn = isClear
          param = arguments[1]

          p = $.extend({
            context: null,    // 作用域
            args: null,       // 执行时的相关参数(ie下为数组)
            time: 300,        // 执行函数延迟执行的时间
          }, param)

          // 清除执行函数计时器句柄
          Cms.throttle( true, fn)

          fn.__throttleID = setTimeout( function() {
            fn.apply(p.context, p.args)
          }, p.time)
        }
      },
        //身份证号合法性验证 支持15位和18位身份证号//支持地址编码、出生日期、校验位验证
      identityCodeValid: function(code) {
            if (!code) return "身份证号码不能为空";
            var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
            var tip = "";
            var pass= true;

            if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
                tip = "身份证号格式错误";
                pass = false;
            }

            else if(!city[code.substr(0,2)]){
                //tip = "地址编码错误";
                tip = "身份证号格式错误";
                pass = false;
            }
            else{
                //18位身份证需要验证最后一位校验位
                if(code.length == 18){
                    code = code.split('');
                    //∑(ai×Wi)(mod 11)
                    //加权因子
                    var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
                    //校验位
                    var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
                    var sum = 0;
                    var ai = 0;
                    var wi = 0;
                    for (var i = 0; i < 17; i++)
                    {
                        ai = code[i];
                        wi = factor[i];
                        sum += ai * wi;
                    }
                    var last = parity[sum % 11];
                    if(parity[sum % 11] != code[17]){
                        //tip = "校验位错误";
                        tip = "身份证号格式错误";
                        pass =false;
                    }
                }
            }
            return pass ? pass : tip;
        }
    };


    // ------兼容es6的方法polyfill
    if (!Array.prototype.find) {
        Array.prototype.find = function (predicate) {
            'use strict'
            if (this == null) {
                throw new TypeError('Array.prototype.find called on null or undefined')
            }
            if (typeof predicate !== 'function') {
                throw new TypeError('predicate must be a function')
            }
            var list = Object(this)
            var length = list.length >>> 0
            var thisArg = arguments[1]
            var value

            for (var i = 0; i < length; i++) {
                value = list[i]
                if (predicate.call(thisArg, value, i, list)) {
                    return value
                }
            }
            return undefined
        }
    }

    if (!String.prototype.trim) {
        String.prototype.trim = function () {
            return this.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, '')
        }
    }
}())
