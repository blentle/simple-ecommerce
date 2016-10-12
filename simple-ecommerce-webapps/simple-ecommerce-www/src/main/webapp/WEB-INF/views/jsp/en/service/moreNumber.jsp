<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/commons/include.rec.jsp"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>更多号码</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
<script type="text/javascript">
	/* 页面加载完成，绑定事件 */
	$(document).ready(function() {
		//numberList();
	});
	 /**
     * 加载号码
      */
     function numberList(){

         $.ajax({
             type:"post",
             url:"${CONTEXT_PATH}/mall/numberList",
             dataType:"json",
             success:function(data){
            	 var list=data;
            	 //alert(list[0].store.storeName);
                 for(var i=0;i<list.length;i++){  
                	 
                	var str="<li><a href='#' onclick='alert("+i+")'></a><p><b>"+list[i].number+"</b><i>￥";
                	str+=list[i].packages.packagesRmbPrice+"</i></p>";
                	str+=list[i].packages.packagesDesc;
					str+="<div class='space'></div>Scope of application: China<div class='space'></div>";
					str+="operator：<font>"+list[i].dataCarriers.carriersName+"</font><div class='space'></div>card：";
					if(list[i].areBind==1){
						str+="binding";
					}else{
						str+="no binding";
					}
					
					str+="<button class='btn'>buy</button></li>";	
					
                	$("#numberlist").append(str);
                 }
                 
             },
             error:function(data){
                 alert("error");
             }
         });
     }
</script>
</head>
<body>
<div class="top">
<c:if test="${member!=null}">
			<p>
				<i> <a href="##">${member.memberNickname}</a>，Welcome you！ <a href="/users/order?language=en">personal center</a>
					｜ <a href="users/logout?language=en">logout</a>
				</i>
			</p>
		</c:if>
		<c:if test="${member==null}">
			<p>
				<i> <a href="/" class="abcd">CN</a> ｜ <a href="/users/login?language=en">login</a>
					｜ <a href="/users/reg?language=en">register</a>
				</i>
			</p>
		</c:if>
    <div>
			<a class="logo"><img src="${CONTEXT_PATH}/static/img/logo.png" /></a>
			<dl>
				<dt>
					<input type="text" placeholder="keyword" /><button></button>
				</dt>
				<dd>
					Hot Search： <a href="#">Hong Kong package </a><a href="#">Taiwan package </a><!-- <a href="#">热卖排行 </a><a href="#">选号入网 </a> -->
				</dd>
			</dl>
		</div>
</div>
<div class="menu">
    <div>
			<a href="/en">Home</a> 
				<a href="/en/aboutyyb">AboutYyb</a>
				<a href="/en/service" class="sel" >Service</a> 
				<a href="/en/operators"  >Operators</a> 
				<a href="/en/partners">Partners</a> 
				<a href="/en/contacts" >Contacts</a>
		</div>
</div>
<div class="space30"></div>

<div class="mw">
    <div class="packageMenu fl">
        <h2>在这里找到你想要的</h2>
        <dl>
            <dt><span>1</span>countries regions</dt>
            <dd><input type="checkbox" />大陆地区</dd>
            <dd><input type="checkbox" />香港地区</dd>
            <dd><input type="checkbox" />台湾地区</dd>
            <dd><input type="checkbox" />更多</dd>
            <dt><span>2</span>phone format</dt>
            <dd><input type="checkbox" />GSM</dd>
            <dd><input type="checkbox" />WCDMA</dd>
            <dd><input type="checkbox" />WCDMA2000</dd>
            <dd><input type="checkbox" />其他</dd>
            <dd><p>请谨记：一定要选择和你手机祥同志是的套餐和号码，如果你不知道的话，请下载APP或者问90后的孩子们</p></dd>
            <dt><span>3</span>card</dt>
            <dd><input type="checkbox" />binding</dd>
            <dd><input type="checkbox" />no binding</dd>
            <dd><p>请谨记：非智能机仅仅需要在第一次购买时带卡贴</p></dd>
            <dt><span>4</span>operator</dt>
            <dd><input type="checkbox" />中国联通</dd>
            <dd><input type="checkbox" />中国电信</dd>
            <dd><input type="checkbox" />中华电信</dd>
            <dd><input type="checkbox" />PCCW</dd>
            <dt><span>5</span>price</dt>
            <dd><input type="text" /> - <input type="text" /></dd>
            <dt><span>6</span>digital picking</dt>
            <dd>include<!-- digit --><select><option>7</option></select></dd>
            <dd>remove<!-- digit --><select><option>8</option></select></dd>
            <dd>ending<!-- digit --><select><option>9</option></select></dd>
        </dl>
        <div class="space50 tac"><input type="button" value="filtrate" class="btn" /></div>
    </div>
    <div class="numberList fr">
        <img src="${CONTEXT_PATH}/static/img/numberTitleImg.png" />
        <div class="space"></div>
        <div class="sort"><b>price<i class="sel">↑</i></b><b>sales<i>↓</i></b></div>
        <ul id="numberlist">
            <c:forEach items="${numberlist}" var="a">
					<li>
				<a href="##"></a>
				<p><b>${a.number}</b><i>￥${a.packages.packagesRmbPrice}</i></p>
				${a.packages.packagesDesc}
				<div class="space"></div>
				Scope of application: China
				<div class="space"></div>
				operator：<font>${a.dataCarriers.carriersName}</font>
				<div class="space"></div>
				card：<c:if test="${a.areBind==1}">binding</c:if><c:if test="${a.areBind==0}">no binding</c:if>
				<button class="btn">buy</button>
			</li>
				</c:forEach>
        </ul>
        
    </div>
</div>
<table width="100%">
	<tr><td width="32%"></td>
	<td>
	<web:pager pageNo="${pageNo}" currentClass="currentpage"
		pageSize="9" url="/service/moreNumber?language=en" btnNum="9"
		totalCount="${totalCount}">
	</web:pager>
	</td>
	</tr>
	</table>
<div class="space100"></div>

	<%@include file="/commons/usersbottom.rec.en.jsp"  %>
</body>
</html>