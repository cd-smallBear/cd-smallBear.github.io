require.config(Hotel.requireConfig);

define(["ajaxSub","dropdownSelect","bsDialog","webuploader.setting"],function(ajaxSub,dropdownSelect,dialog,upload){
  //会议室管理
    dropdownSelect($("#search-bar"));

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
            dialog.alert("操作提示",selectedList.toString());
        }else{
            dialog.alert("操作提示","一个都没选","type-danger");
        }
    });
    //删除某一个
    table.on("click",".del",function(){
        var id = $(this).data("id");
        dialog.alert("id",id);

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
});
    
