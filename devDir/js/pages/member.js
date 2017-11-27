require.config(Hotel.requireConfig);

define(["dropdownSelect","bsDialog","jeDate"],function(dropdownSelect,bsDialog){
  
  //下拉选择
  dropdownSelect($("#dropdown-level"));

  //时间选择
  
  $("#startDate").rangeJeDate($("#emdDate"));

  $("#add-member").click(function(){
    bsDialog.ajaxPage("创建新会员",HotelConfig.root + "/forms/dialog-addMember.html",function($element,dialog){
      dropdownSelect($element.find("#dropdown-discounts"));
    },{
      classes : "modal-wid600",
      buttons:[
        {
          label:"取消"
        },{
          label:"添加",
          closable:false,
          class:"btn btn-primary",
          action:function(dialog){

          }
        }
      ]
    })
  });

});
    
