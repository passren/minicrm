// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

function searchCustomer(url) {
    if($("#search_customer_name").val().trim() === "") {
        return;
    }

    $.ajax({
        type: "Get",
        url: url,
        data: "search_customer_name="+$("#search_customer_name").val(),
        success: function(data) {
            var obj = eval(data);
            $("#selCustomers").empty();

            if (obj.length === 0) {
                alert("没有查询到符合的记录!");
            } else {
                $.each(obj, function (n, value) {
                    var option = "<option value='"+value.id+"'>"+value.name+"</option>";
                    $("#selCustomers").append(option);
                });
            }
        },
        error: function(result, status) {
        }
    });
}

function openCustomerSearchDialog(divDialog) {
    var dialog = $(divDialog).dialog({
        autoOpen: false,
        width: 400,
        modal: true,
        buttons: {
            "选择": function(){
                if($("#selCustomers").find("option:selected").val()) {
                    $("#customerId").val($("#selCustomers").find("option:selected").val());
                    $("#customerName").val($("#selCustomers").find("option:selected").text());
                    dialog.dialog("close");
                }
            }, 
            "取消": function(){
                dialog.dialog("close");
            }
        },
        close: function(){
        }
    });

    $("#search_customer_name").val("");
    $("#selCustomers").empty();
    dialog.dialog("open");
}