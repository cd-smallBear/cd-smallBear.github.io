require.config(Hotel.requireConfig);

define(["dropdownSelect","jeDate"],function(dropdownSelect){

    dropdownSelect($("#dropdown-status"));
    $("#createOrder").jeDate({
      format:"YYYY-MM-DD"
    })

});
    
