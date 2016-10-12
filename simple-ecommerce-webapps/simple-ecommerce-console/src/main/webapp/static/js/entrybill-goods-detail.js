function downloadTemplate(contextPath,goodsType) {
    window.location.href = contextPath + "/entry/entrybill/goods/detail/excel/download?goodsType=" + goodsType;
}

function imortGoodsDetailData(contextPath,detailId) {
    window.location.href = contextPath + "/entry/entrybill/goods/detail/excel/import?detailId=" + detailId;
}

function deleteEntryGoodsDetail(contextPath,entryGoodsDetailId) {
    BUI.Message.Confirm("确定要删除么？",function(){
        $.post(contextPath + "/entry/entrybill/entrygoods/detail/delete/" + entryGoodsDetailId,null,function(result) {
            var data = eval(result);
            if(data.status_code == '1') {
                $("#entry-goods-detail-" + entryGoodsDetailId).remove();
            } else {
                BUI.Message.Alert(data.msg,"error");
            }
        });
    },"question");
}

function operate(contextPath,goodsId) {
    $.post(contextPath + "/goods/onsale/offsale",{goodsId:goodsId},function(result) {
        var data = eval(result);
        if(data.status_code == '1') {
            var orignal = $("#goods-status-" + goodsId).html();
            $("#goods-status-" + goodsId).html(data.msg);
            if(data.msg == '下架' || data.msg == 'On Sale') {
                $("#goods-status-" + goodsId).addClass('emphasize');
            } else {
                $("#goods-status-" + goodsId).removeClass('emphasize');
            }
            $("#operation-" + goodsId).html(orignal);
        } else {
            BUI.Message.Alert(data.msg,'error');
        }
    });
}