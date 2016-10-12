function genTimestamp(){
    var time = new Date();
    return time.getTime();
}

function checkMobile(mobilePhone) {
    var mobilePattern = /^1[3578]\d{9}$/g;
    if(typeof mobilePhone == "string" || typeof mobilePhone == "number") {
        if(mobilePattern.test(mobilePhone)) {
            return true;
        }
    }
    return false;
}

function checkEmail(email) {
    var pattern =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    if (!pattern.test(email)){
        return false;
    }
    return true;
}

function checkPassword(password){
    if(password == ""){
        alert('密码不能为空！');
        return false;
    }

    if(password.length>16 || password.length<6){
        alert('密码长度6-16位！');
        return false;
    }

    return true;
}