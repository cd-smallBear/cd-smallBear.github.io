require.config(Hotel.requireConfig);

define(["ajaxSub","dropdownSelect","bsDialog","jeDate"],function(ajaxSub,dropdownSelect,dialog){
   //餐饮管理
   dropdownSelect($("#search-bar"));
   $("#tradeDate").jeDate({
       format : "YYYY-MM-DD"
   });
  //配置管理
    $("#add-meeting").click(function(){
        dialog.ajaxPage("添加会议室",HotelConfig.root + "/forms/dialog-addSetting.html",function($element,dialog){
            //初始图片上传
            //tips  uploadbtn 的 data-name 属性是上传域的 name 值
            upload({
                uploadbtn : $element.find("#uploadSettingImage"),
                imgswrap  : $element.find("#uploadSettingImageContainer"),
                fileNumLimit : 1
            });
        },{
            classes : "modal-wid1000",
            buttons:[
                {
                    label:"取消"
                },{
                    label:"添加",
                    closable:false,
                    class:"btn btn-primary",
                    action:function(dialog){
                        //do something example: submit formData
                        var form = dialog.$body.find("form");
                        console.log(form.serialize()) //可上传表单数据
                        //Hotel.serializeObject(form)  form值对象 , checkbox 默认值为 on  多的选择值会转成数组
                        alert(form.serialize())
                    }
                }
            ]
        });
    });
    // 全选
    var table = $("#setting-data"),
         _findCheckbox = function(){
            return table.find("tbody input[type='checkbox']");
         };

    $("#del-all").click(function(){
        var $this = $(this);
        _findCheckbox().each(function(){
             $(this).prop("checked",$this.prop("checked"));
         });
    });
    //全选删除
    $("#removeAll").click(function(){
        var selectedList = [];
        _findCheckbox().filter(":checked").each(function(){
            selectedList.push(this.getAttribute("data-id"));
        });
        if(selectedList.length){
            dialog.confirm("操作提示","确定要删除吗？，选中的id: " + selectedList.toString(),function(dialog){
                var _this = this; // this -> 点击的jqDom
                dialog.setClosable(false).disableBtn().spin(this);
    
                setTimeout(function(){
                    var random = Math.random() * 3;
                    if(Math.round(random) > 2){
                        dialog.close();
                    }else{
                        dialog.setClosable(true).enableBtn().unspin(_this);
                    }
                },1000)
                
                // ajax({
                //     url : "",
                //     successCall:function(){
                //         dialog.close();
                //     },
                //     failCall:function(){
                //         dialog.setClosable(true).enableBtn().unspin();
                //     }
                // });
            },{
                autoClose :false,
            });
        }else{
            dialog.alert("操作提示","一个都没选","type-danger");
        }
    });
    //删除某一个
    table.on("click",".del",function(){
        var id = $(this).data("id");
        dialog.confirm("操作提示","确定要删除吗？，选中的id: " + id,function(dialog){
            var _this = this; // this -> 点击的jqDom
            dialog.setClosable(false).disableBtn().spin(this);

            setTimeout(function(){
                var random = Math.random() * 3;
                if(Math.round(random) > 2){
                    dialog.close();
                }else{
                    dialog.setClosable(true).enableBtn().unspin(_this);
                }
            },1000)
            
            // ajax({
            //     url : "",
            //     successCall:function(){
            //         dialog.close();
            //     },
            //     failCall:function(){
            //         dialog.setClosable(true).enableBtn().unspin();
            //     }
            // });
        },{
            autoClose :false,
        });

        // ajax({
        //     url : "",
        //     data : {
        //         id : id
        //     },
        //     successCall:function(){
        //
        //     },
        //     failCall:function(){
        //
        //     }
        // })
        return false;
    });
    //编辑
    table.on("click",".edit",function(){
        dialog.ajaxPage("添加会议室",HotelConfig.root + "/forms/dialog-addSetting.html?id=id12",function($element,dialog){
            //初始图片上传
            //tips  uploadbtn 的 data-name 属性是上传域的 name 值
            upload({
                uploadbtn : $element.find("#uploadSettingImage"),
                imgswrap  : $element.find("#uploadSettingImageContainer"),
                fileNumLimit : 1,
                cutFileNum   :  $element.find("#uploadSettingImageContainer").children().length
            });
        },{
            classes : "modal-wid1000",
            buttons:[
                {
                    label:"取消"
                },{
                    label:"添加",
                    closable:false,
                    class:"btn btn-primary",
                    action:function(dialog){
                        //do something example: submit formData
                        var form = dialog.$body.find("form");
                        console.log(form.serialize()) //可上传表单数据
                        //Hotel.serializeObject(form)  form值对象 , checkbox 默认值为 on  多的选择值会转成数组
                        alert(form.serialize())
                    }
                }
            ]
        });
        return false;
    });
});
    
