// JavaScript Document
function dragFalse(){return false;}
for(i in document.images)document.images[i].ondragstart=dragFalse;
for(i in document.links)document.links[i].ondragstart=dragFalse;

function showALW(){
    $(".alertLoginCover,.alertLoginWindow").show();
}
function hideALW(){
    $(".alertLoginCover,.alertLoginWindow").hide();
}


$(function(){
    $(".ulm h2").each(function(){
        $(this).click(function(){
            $(this).toggleClass("class1").next().toggleClass("uldisno");
            $(this).children(".sjx").toggleClass("sel");
            var h2has=$("#h2last").hasClass("class1");
            if(!h2has){$("#h2last").addClass("h2border");}else{$("#h2last").removeClass("h2border");}
        });
    })
    $(".ulm li ul li a").each(function() {
        $(this).click(function(){
            $(this).addClass("color");
            $(this).parent().siblings().children().removeClass("color");
            $(this).parent().parent().parent().siblings().children().children().children().removeClass("color")
        })
    });

});