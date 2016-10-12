function loadOperatorsByCountry(contextPath,countryCode,targetFirstOptionId) {
    $("#" + targetFirstOptionId).siblings().remove();
    if(countryCode) {
        var url = contextPath + "/basedata/operator/loadbycountry";
        $.post(url,{countryCode:countryCode},function(result) {
            var data = eval(result);
            if(data.status_code == '1') {
                var options = "";
                $.each(data.result,function(index,entity) {
                   options += '<option value="'+ entity.id +'">'+ entity.operatorName +'</option>'
                });
                if(options) {
                    $(options).insertAfter("#" + targetFirstOptionId)
                }
            }
        });
    }
};
function loadStoresByCountry(contextPath,countryCode,targetFirstOptionId) {
    $("#" + targetFirstOptionId).siblings().remove();
    if(countryCode) {
        var url = contextPath + "/store/store/loadbycountry";
        $.post(url,{countryCode:countryCode},function(result) {
            var data = eval(result);
            if(data.status_code == '1') {
                var options = "";
                $.each(data.result,function(index,entity) {
                    options += '<option value="'+ entity.id +'">'+ entity.storeName +'</option>'
                });
                if(options) {
                    $(options).insertAfter("#" + targetFirstOptionId)
                }
            }
        });
    }
};
function loadStoresByOperator(contextPath,operatorId,targetFirstOptionId) {
    $("#" + targetFirstOptionId).siblings().remove();
    if(operatorId > 0 ) {
        var url = contextPath + "/store/store/loadbyoperator";
        $.post(url,{operatorId:operatorId},function(result) {
            var data = eval(result);
            if(data.status_code == '1') {
                var options = "";
                $.each(data.result,function(index,entity) {
                    options += '<option value="'+ entity.id +'">'+ entity.storeName +'</option>'
                });
                if(options) {
                    $(options).insertAfter("#" + targetFirstOptionId)
                }
            }
        });
    }
}