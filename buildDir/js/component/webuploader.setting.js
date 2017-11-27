define(["webuploader","bsDialog"],function(WebUploader,bsDialog){
//var head = $("head")[0],
//    body = document.body,
//
//    win = window;
//
//    if(!$("#webuploader.css").length){
//        var link = document.createElement("link");
//            link.rel = "styleSheet";
//            link.type = "text/css";
//            link.href = "../css/lib/webuploader.css";
//            link.id = "webuploader.css";
//            head.appendChild(link);
//    }


    var uploadOptions = {
        uploadbtn: null,  //JQ  DOM
        imgswrap: null,   //JQ DOM
        hideNodeName: '', //隐藏域值存的 ID
        multiple: false,  //  一个按钮存隐藏域多个值
        swfUrl: '/js/lib/Uploader.swf',
        serverUrl: 'http://192.168.2.45:8080/shengchan-web/attachment/upload',
        // fileNumLimit: undefined,
        resImgPathUrl: 'https://s3.cn-north-1.amazonaws.com.cn/test.temp-store/',
        beforeFileQueued:null,//上传前回调
        fileQueued: null,     //上传中图片回调
        fileSuccessed: null,  //上传图片成功后回调
        fileRemoveed: null,   //删除上传图片后回调 this - > 上传实例
        initImageUploader: initImageUploader,
        init: $.noop,
        instance: null,
        isAppenditem :true,
        formData  : {
            claz:'com.cms.business.model.basic.TestModel',
            auth:1,
            serviceType : 0
        }
    };
    //主体函数
    var errorui = '<div class="file-actions"><i class="ui-icons remove upload-remove"></i></div>';
    var instanceArray = [];

    function initImageUploader(uploadOptions) {
        var $container = uploadOptions.imgswrap,
            uploadedfile = null,
            thumbFile = $("<input type='file' class='d-none'" + (!uploadOptions.fileNumLimit ? "multiple" : "") + " />"),
            uploadInstance = null;
        uploadInstance = new WebUploader.Uploader({
                swf: uploadOptions.swfUrl,
                server: uploadOptions.serverUrl,
                fileNumLimit: uploadOptions.fileNumLimit,
                accept: {
                    title: 'Images',
                    extensions: 'jpg,jpeg,png',
                    mimeTypes: 'image/*'
                },
                fileSingleSizeLimit: 2 * 1024 * 1e3, // 文件大小 2 * 1024KB // 1024*1024*2,
                formData : uploadOptions.formData,
                pick: thumbFile[0].files ? undefined : uploadOptions.uploadbtn[0],
                auto: true,
                duplicate: true
            }).on('beforeFileQueued', function(file) {
                if (uploadOptions.fileNumLimit == 1 && uploadedfile) {
                    uploadInstance.removeFile(uploadedfile, true);
                }
                if(uploadOptions.beforeFileQueued){
                    return uploadOptions.beforeFileQueued();
                }
            })
            .on('fileQueued', function(file) {
                var item = '<div id="' + file.id + '" class="img-item-new">' +
                    '<div class="file-img-pane">' +
                    '<span class="file-img-box"><img class="imger d-none" alt=""/></span>' +
                    '<div class="file-img-progress">上传中<strong class="pie">...</strong></div>' +
                    '</div>' +
                    (!uploadOptions.fileNumLimit ?
                        '<div class="file-img-name">' +
                        '<input type="text" class="form-control editor" value="' + file.name + '" />' +
                        '</div>' : '') +
                    '</div>';
                    if(uploadOptions.isAppenditem){
                        if ($container) {
                            $container.append($(item));
                        } else {
                            var imgswrap = uploadOptions.uploadbtn.siblings('.upload-img-wrapper');
                            if (imgswrap.find(".img-item-new").length) {
                                imgswrap.find(".file-img-pane").append('<div class="file-img-progress">上传中<strong class="pie">...</strong></div>');
                            } else {
                                imgswrap.append($(item));
                            }
                        }
                    }
                    if (uploadOptions.fileQueued) {
                        uploadOptions.fileQueued(file,uploadOptions.uploadbtn);
                    }
            })
            .on('uploadSuccess', function(file, res) {
                if (res.success) {
                    uploadOptions.isAppenditem ? $('#' + file.id).append(errorui) : '';
                    if (uploadOptions.fileSuccessed) {
                        uploadOptions.fileSuccessed(file, res, uploadOptions.uploadbtn,uploadOptions);
                    }
                } else {
                     bsDialog.show({
                        title  : '上传提示',
                        msg    : res.msg ||"服务器处理失败",
                        classes:"bootstrap-alert modal-warning"
                    });
                    resDelete (uploadOptions,file)
                }
                uploadedfile = file;
                //获取每一个上传实例,供RemoveImage 访问;
                instanceArray = $.map(instanceArray, function(item, i, arr) {
                    if (item.uploader == uploadInstance) {
                        return $.extend(item,{file: file});
                    } else {
                        return item;
                    }
                });
            }).on('uploadError', function(file, reason) {
                resDelete (uploadOptions,file)
                bsDialog.show({
                    title  : '上传提示',
                    msg    : '上传失败',//reason
                    classes:"bootstrap-alert modal-warning"
                });
            }).on('uploadComplete', function(file) {
                $('#' + file.id).find('.file-img-progress').remove();
                if (!$container) {
                    uploadOptions.uploadbtn.siblings('.upload-img-wrapper').find('.file-img-progress').remove();
                }
            }).on("error", function(error, max, file) {
              if( error == 'F_EXCEED_SIZE' ) {
                error = '上传的文件大小不能超过' + max*1e-3 + 'KB'
              }else if( error == 'Q_TYPE_DENIED' ) {
                error = '请上传' + this.options.accept.map(function(el) {
                  return el.extensions.toUpperCase()
                }).join('、') + '格式文件'
              }

              bsDialog.show({
                title  : '上传提示',
                msg    : error,
                classes:"bootstrap-alert modal-warning"
              });
            });
        if (thumbFile[0].files) {
            uploadOptions.uploadbtn
            // .addClass("webuploader-pick")
            .append(thumbFile);
            if(uploadOptions.uploadbtn.data('name')){
                uploadOptions.sendfile = $('<input type="hidden" name="' + uploadOptions.uploadbtn.data('name') + '" class="'+ uploadOptions.uploadbtn.data('name') +'">');
                uploadOptions.uploadbtn.append(uploadOptions.sendfile);
            }
            thumbFile.change(function() {
               uploadInstance.addFiles(this.files);

               this.value = ''
            });
        }

        instanceArray.push({uploader : uploadInstance,uploadOptions:uploadOptions});
    }
    //上传出错删除loading
    function resDelete (uploadOptions,file){
        var progress = uploadOptions.uploadbtn.siblings('.upload-img-wrapper').find('.file-img-progress');
        var pack = null;
            if($('#' + file.id).length ){
                pack = $('#' + file.id).append(errorui);
            }else{
                pack = progress.prev();
            }
            pack.find(".imger").removeClass("d-none").attr("src", Cms.rootDir + "/images/uploadError.png")
            progress.remove();
    }
    //删除已经存在的图片
    function removeImage(node) {
        var imgwrap = $(node).closest(".img-item-new"),
            currentUploader = null,
            btn = imgwrap.parent().siblings("label");

            $.each(instanceArray, function(i, item) {
                if (item.uploadOptions.uploadbtn.length) {
                    if (item.uploadOptions.uploadbtn[0] == btn[0]) {
                        currentUploader = item;
                    }
                }
            });

            if(currentUploader){
               currentUploader.file && currentUploader.uploader.removeFile(currentUploader.file)
            }
            if (currentUploader.uploadOptions.fileRemoveed) {
                currentUploader.uploadOptions.fileRemoveed.call(currentUploader || window, btn, imgwrap,node);
            }else{
              btn.find('.' + btn.data('name') ).val(''); //默认删除这个传，有回调就在回调里面删除
            }
            imgwrap.remove();
    }
        //提供对外访问接口
        return function(options) {
            if(options.formData){
                var formData = options.formData;
                    options.formData = {};
                    $.extend(options.formData,uploadOptions.formData,formData);
            }
            options = $.extend({},uploadOptions, options || {});

            if (!this.inited) {
                this.inited = true;
                $(options.wrap || document).on("click", ".upload-remove", function(e) {
                    removeImage(this);
                });
                options.init();
            }
            $.each(options.uploadbtn, function(i, item) {
                var wrap = null;
                if (options.imgswrap) {
                    wrap = options.imgswrap.eq(i);
                }

                initImageUploader($.extend({}, options, { uploadbtn: $(item), imgswrap: wrap }));
            });

        }
});
