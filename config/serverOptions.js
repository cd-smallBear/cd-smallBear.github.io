var url = require('url'),
    fs = require('fs');



module.exports = ( buildPath )=> {
  return {
      // files: [ devPath+'/scss/**/*.scss' ],    //监听某些文件
      server: {
        baseDir: "./",
        index: buildPath + '/login/login.html',
        // 中间件！
        middleware: function(req, res, next) {
            next();
            return;
            var urlObj = url.parse(req.url, true),
                data = {}
                // method = req.method

            // ----if post request
            // var _data = '';
            // req.addListener( 'end', (msg)=>{
                // console.log('post data: ', querystring.parse(_data) ); } )
            // req.addListener( 'data', (data)=>{ _data += data } );
            switch (urlObj.pathname) {
                case '/api/allCity':

                    res.setHeader('Content-Type', 'application/json');
                    res.end(JSON.stringify( {
                      'success': true,
                      'code':"1",
                      'msg': '',
                      'data': allCity
                    }));
                    break;
                case '/api/getCity':
                    data = [{'Id':'001012008','HalfName':'安徽安庆市','Name':'安庆市','SPY':'AHAQS','Location':'117.063755,30.543494'},{'Id':'001012003','HalfName':'安徽蚌埠市','Name':'蚌埠市', 'SPY':'AHBBS','Location':'117.389719,32.916287'}]
                    res.setHeader('Content-Type', 'application/json');
                    res.end(JSON.stringify(data));
                     break;
                case '/api/action.do':
                    data = {
                      code: 1,
                      data: {},
                      errorMessages: '',
                      errors: [],
                      success: true
                    };
                    res.setHeader('Content-Type', 'application/json');
                    res.end(JSON.stringify(data));
                     break;
                case '/api/getBranch':
                    setJsonData( res, require('./server/province.js') );
                     break;
                case '/api/getCitys':
                    setJsonData( res, require('./server/city.js') );
                     break;
                case '/api/getAreas':
                    setJsonData( res, require('./server/area.js') );
                     break;
                case '/api/account/checkUser':
                    data = {
                      success: true,
                      code:"1",
                      msg:  urlObj.query.isValid != "true" ? '手机号已经注册' : '',
                      data: urlObj.query.isValid == "true"
                    };
                    var i = urlObj.query.verify ? 10000:300000000;
                    while(i){
                      i--;
                    }
                    res.setHeader('Content-Type', 'application/json');
                    res.end( JSON.stringify(data) );
                    break;
                case '/api/suppliesList':
                    var pageSize = urlObj.query.pageSize,
                        pageIndex = urlObj.query.pageNo
                    var i = 1000000000;
                    while(i){
                      i--;
                    }

                    res.setHeader('Content-Type', 'application/json');
                    res.end( JSON.stringify({
                      success: true,
                      code:"1",
                      msg: '',
                      data: supplies(pageIndex,pageSize)
                    }) );
                    break;
                case '/api/transportPlan':
                    // var pageSize = urlObj.query.limit,
                    //     pageIndex = urlObj.query.offset/pageSize + 1;
                                var pageSize = urlObj.query.pageSize,
                                    pageIndex = urlObj.query.pageNo

                    var i = 1000000000;
                    while(i){
                      i--;
                    }

                    res.setHeader('Content-Type', 'application/json');
                    res.end( JSON.stringify({
                      success: true,
                      code:"1",
                      msg: '',
                      data: transportPlan(pageIndex,pageSize)
                    }) );
                    break;
                case '/api/order':
                      var pageSize = urlObj.query.pageSize,
                          pageIndex = urlObj.query.pageNo
                    var i = 100000000;
                    while(i){
                      i--;
                    }
                    res.setHeader('Content-Type', 'application/json');
                    res.end( JSON.stringify({
                      success: true,
                      code:"1",
                      msg: '',
                      data: order(pageIndex,pageSize)
                    }) );
                    break;
                 case '/api/saleOrder':
                      var pageSize = urlObj.query.pageSize,
                          pageIndex = urlObj.query.pageNo
                    var i = 100000000;
                    while(i){
                      i--;
                    }
                    res.setHeader('Content-Type', 'application/json');
                    res.end( JSON.stringify({
                      success: true,
                      code:"1",
                      msg: '',
                      data: saleOrder(pageIndex,pageSize)
                    }) );
                    break;
                case '/api/orderline':
                      var pageSize = urlObj.query.pageSize,
                          pageIndex = urlObj.query.pageNo
                    var i = 100000000;
                    while(i){
                      i--;
                    }
                    res.setHeader('Content-Type', 'application/json');
                    res.end( JSON.stringify({
                      success: true,
                      code:"1",
                      msg: '',
                      data: orderline(pageIndex,pageSize)
                    }) );
                    break;
                case '/api/comments':
                      var pageSize = urlObj.query.pageSize,
                          pageIndex = urlObj.query.pageNo
                    var i = 100000000;
                    while(i){
                      i--;
                    }
                    res.setHeader('Content-Type', 'application/json');
                    res.end( JSON.stringify({
                      success: true,
                      code:"1",
                      msg: '',
                      data: comments(pageIndex,pageSize)
                    }) );
                    break;
                case '/api/storePros':
                      var pageSize = urlObj.query.pageSize,
                          pageIndex = urlObj.query.pageNo
                    var i = 100000000;
                    while(i){
                      i--;
                    }
                    res.setHeader('Content-Type', 'application/json');
                    res.end( JSON.stringify({
                      success: true,
                      code:"1",
                      msg: '',
                      data: storePros(pageIndex,pageSize)
                    }) );
                    break;
                case '/api/entry':
                    res.setHeader('Content-Type', 'application/json');
                    res.end( JSON.stringify({
                      success: true,
                      code:"1",
                      msg: '',
                      data: true
                    }) );
                break;
                case '/api/getBrand':
                    setJsonData( res, {
                      success: true,
                      data: [{ id: 5, text: 'enhancement' }, { id: 1, text: 'bug'}, { id: 2, text: 'duplicate' }, { id: 3, text: 'invalid' }, { id: 4, text: 'wontfix' }],
                    } )
                    break
                    break;
                case '/api/partnerNets':
                    res.setHeader('Content-Type', 'application/json');
                    res.end( JSON.stringify({
                      success: true,
                      code:"1",
                      msg: '',
                      data: partnerNets()
                    }) );
                    break;
                case '/api/provinceNets':
                 var id = urlObj.query.id,province = urlObj.query.province;
                 console.log(id,province,typeof province);
                    res.setHeader('Content-Type', 'application/json');
                    res.end( JSON.stringify({
                      success: true,
                      code:"1",
                      msg: '',
                      data: provinceNets(id,province)
                    }) );
                    break;
                case '/api/sku':

                    res.setHeader('Content-Type', 'application/json');
                    res.end( JSON.stringify({
                      success: true,
                      code:"1",
                      msg: '',
                      data: sku()
                    }) );
                    break;
                case '/api/putAway':

                    res.setHeader('Content-Type', 'application/json');
                    res.end( JSON.stringify({
                      success: true,
                      code:"1",
                      msg: '',
                      data: putAway()
                    }) );
                    break;
                case '/api/contactAttn':

                    res.setHeader('Content-Type', 'application/json');
                    res.end( JSON.stringify({
                      success: true,
                      code:"1",
                      msg: '',
                      data: contactAttn()
                    }) );
                    break;
                case '/api/shppingCart':
                  data = {success: true,
                    code: 1,
                    msg: '',
                    data: {totalCount: 163},
                  }

                  data.data.result = [
                    {brandName: '新疆产贸送',
                     brandId: 110,
                     pdList: [
                       {id: '11', pdName: '苹果手机11', code: 'bbbb111111', img: '/images/u38630.jpg', amount: 1, price: 100, spe: '规格11'},
                       {id: '22', pdName: '苹果手机22', code: 'bbbb222222', img: '/images/u38630.jpg', amount: 0, price: 101, spe: '规格22'},
                       {id: '33', pdName: '苹果手机33', code: 'bbbb333333', img: '/images/u38630.jpg', amount: 3, price: 100, spe: '规格33'},
                     ]},
                     {brandName: '阿里里里',
                      brandId: 120,
                      pdList: [
                        {id: '11', pdName: '手提电脑11', code: 'bbbb111111', img: '/images/u38630.jpg', amount: 0, price: 100, spe: '规格11'},
                        {id: '22', pdName: '手提电脑22', code: 'bbbb222222', img: '/images/u38630.jpg', amount: 0, price: 102, spe: '规格22'},
                      ]},
                  ]

                  setJsonData( res, data )
                break
                default:
            }
            next();
        }
      },
      port: 9000,
      // online:false,
      open: false, // 'external',
      notify: false,
      logPrefix: 'browserSync:  ',
      logLevel: 'info',
      ghostMode: false
   }
}

/**
 * [setJsonData description]
 * @method setJsonData
 * @param  {[type]}    res  [description]
 * @param  {[type]}    data [description]
 */
function setJsonData( res, data ) {
  res.setHeader('Content-Type', 'application/json')
  res.end(JSON.stringify(data))
}
