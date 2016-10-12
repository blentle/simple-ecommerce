/**//**   
 * @author ming  
 */    
$(document).ready(function(){         
           
/**//* 设置默认属性 */         
$.validator.setDefaults({         
    submitHandler: function(form) {      
        form.submit();      
    }         
});     
    
// 字符验证         
jQuery.validator.addMethod("chkAddress", function(value, element) { 
	var address = value;
	if(address.infoIndex())
    return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);         
}, "只能包括中文字、英文字母、数字和下划线");     
});   