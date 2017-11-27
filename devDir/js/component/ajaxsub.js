define([],function() {
    var defaulOpt = {
       url: "",
       type: 'get',
       data: {},
       cache: false,
       dataType: 'json',
       beforeSend: function(xhr) {
           this.beforeSendCall && this.beforeSendCall(xhr);
       },
       complete: function(xhr, textStatus) {
         var token = xhr.getResponseHeader("token");
         if($("#token").length && token){
               $("#token").val(token);
           }
           this.completeCall && this.completeCall(textStatus);
       },
       success: function(data, textStatus, xhr) {
           if (data.success) {
               if (data) {
                   this.successCall(data.data ||{});
                   }
              }else{
                 this.failCall(data.msg);
              }
       },

       error: function(xhr, textStatus, errorThrown) {
           // $.Popup.hide();
           this.errorCall && this.errorCall(errorThrown);
       },
       beforeSendCall: function(param) {
           // !noMask && $.Popup.loadMask();
       },
       completeCall: function(param) {
           //$.Popup.hide();
       },
       successCall: function(param) {
           //do something...
       },
       failCall : function(msg){
         alert(msg);
       },
       errorCall: function(param) {
           //do something...
     }
    }

    function ajax(opt) {
      var options = {}

      // 处理formData数据
      if( window.FormData && opt.data instanceof FormData ) {
        $.extend( options, {
          contentType: false,
          processData: false,
        });
        if(!opt.data.has('token')){
          opt.data.append('token',$("#token").val() || '');
        }
      }else{
        if(!options.hasOwnProperty("token")){
           options['token'] = $("#token").val() || '';
        }
      }
 options = $.extend( {}, defaulOpt, options, opt)

      return $.ajax( options )
    }
    ajax.get = function( url, data, callback, opt ) {
      return ajax( $.extend( {
        url: url,
        data: data,
        success: callback,
        type: 'get',
      }, opt ))
    }
    ajax.post = function( url, data, callback, opt ) {
      return ajax( $.extend( {
        url: url,
        data: data,
        success: callback,
        type: 'post',
      }, opt ))
    }

    return ajax
});
