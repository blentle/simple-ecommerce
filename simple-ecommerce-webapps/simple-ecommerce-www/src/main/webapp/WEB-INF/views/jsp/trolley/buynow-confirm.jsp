<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>${site_title} - 立即购买，确认购买</title>
    <%@include file="/common/include.rec.jsp" %>
    <style>
        #addfapiao {cursor: pointer}
    </style>
</head>
<body>
<!-- 引用TOP -->
<%@include file="/common/topOne.rec.jsp" %>
<%@include file="/common/include.menu.rec.jsp" %>
<div class="space30"></div>
<div class="mw">
    <ul class="pBar">
        <li class="sel">1、确认信息<b></b><i></i></li>
        <li>2、付款<b></b><i></i></li>
        <li>3、完成</li>
    </ul>
    <div class="space30"></div>
    <div class="bnsi">
        <div class="psfs">
            <font> 配送方式：</font>
            <div class="space20"></div>
            <p class="pd70"><input type="radio" class="radiopd870" name="distributeType" value="post"/> 快递 <i>（目前仅支持中国大陆范围内配送）</i></p>
            <div id="divpd2" class="psfslg" style="display:none">
                <p class="pd110">收货地址</p>
                <c:if test="${not empty addressList}">
                    <c:forEach items="${addressList}" var="entity">
                        <p id="address-distribute-${entity.deliveryAddress.id}" class="pd150" style="border-bottom:1px dashed #ccc">
                            <input id="radio-distribute-${entity.deliveryAddress.id}" type="radio" name="shdz" value="${entity.deliveryAddress.id}"
                                   <c:if test="${entity.deliveryAddress.actStatus.code eq 'y'}">checked</c:if>/>${entity.deliveryAddress.realName}
                            <b>${entity.deliveryAddress.address}&nbsp;&nbsp;${entity.deliveryAddress.mobile}</b>
                            <a href="javascript:void(0);" onclick="deleteAddress(${entity.deliveryAddress.id});">删除</a>
                            <%--<a href="javascript:void(0);" onclick="editDistributeAddress(${entity.deliveryAddress.id});">编辑</a>--%>
                        </p>
                    </c:forEach>
                </c:if>

                <p id="last_p_address" class="pd150 "><input type="radio" id="addNewAddress"/> 新增收货地址</p>

                <table style="display:none" id="NewTable">
                    <tr>
                        <th><b>*</b>收货人姓名：</th>
                        <td><input id="realName" type="text"/></td>
                    </tr>
                    <tr class="tip">
                        <th></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th><b>*</b>地 区 ：</th>
                        <td>
                            <select id="province" onclick="loadChildren('${ctx}',this.value,'firstCityOption');">
                                <option value="">请选择</option>
                                <c:if test="${not empty provinceList}">
                                    <c:forEach items="${provinceList}" var="entity">
                                        <option value="${entity.id}">${entity.regionName}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                            <select id="city" onclick="loadChildren('${ctx}',this.value,'firstDistrictOption');">
                                <option id="firstCityOption" value="">请选择</option>
                            </select>
                            <select id="district">
                                <option id="firstDistrictOption" value="">请选择</option>
                            </select>
                            <span>√</span>
                        </td>
                    </tr>
                    <tr class="tip">
                        <th></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th><b>*</b>详细地址：</th>
                        <td><input id="address" placeholder="请填写详细路名及门牌号" type="text" style="width:307px;"/></td>
                    </tr>
                    <tr class="tip">
                        <th></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th><b>*</b>手机号码：</th>
                        <td><input id="mobile" placeholder="请填写手机号码" type="text"/></td>
                    </tr>
                    <tr class="tip">
                        <th></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th><b>*</b>电子邮件：</th>
                        <td><input id="email" placeholder="请填写电子邮箱" type="text"/></td>
                    </tr>
                    <tr class="tip">
                        <th></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <div class="space"></div>
                            <a class="btn" href="javascript:void(0);" onclick="createAddress();">　请确认收货信息　</a></td>
                    </tr>
                </table>
            </div>

            <p class="pd70">
                <input type="radio" class="radiopd870" name="distributeType" value="byself"/> 预约服务点领取
                <i>(付款成功3天后悠游宝会将您的货品放在您指定的服务点)</i>
            </p>


            <div id="divpd4" class="psfslg" style="display:none">
                <p class="pd110">服务点列表</p>
                <c:if test="${not empty serviceSiteList}">
                    <c:forEach items="${serviceSiteList}" var="entity">
                        <p class="pd150 "><input type="radio" name="fwdlb" value="${entity.id}"/>${entity.serviceSiteName}</p>
                    </c:forEach>
                </c:if>
                <table>
                    <tr>
                        <th><b>*</b>联系人姓名：</th>
                        <td><input id="bookingRealName" type="text"/></td>
                    </tr>
                    <tr class="tip">
                        <th></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th><b>*</b>手机号码：</th>
                        <td><input id="bookingMobile" type="text"/></td>
                    </tr>
                    <tr class="tip">
                        <th></th>
                        <td></td>
                    </tr>
                    <%--<tr>--%>
                        <%--<th></th>--%>
                        <%--<td>--%>
                            <%--<div class="space"></div>--%>
                            <%--<a class="btn" href="javascript:void(0);">　请确认收货信息　</a>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                </table>
            </div>


        </div>
        <div class="line1"></div>
        <div class="line1"></div>
        <font style="padding-left:20px;"> 商品清单：</font>

        <div class="line4"></div>
        <div class="spqd">

            <table>
                <thead>
                    <tr>
                        <th></th>
                        <th style="padding-left:100px;">商品名称</th>
                        <th style="padding-left:90px;">商品组成</th>
                        <th>商品价格</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${not empty goodsDetailList}">
                        <c:forEach items="${goodsDetailList}" var="entity">
                            <tr class=" ">
                                <th>
                                    <c:choose>
                                        <c:when test="${not empty entity.packages && not empty entity.packages.packagesImage}">
                                            <img src="${imgDomain}${entity.packages.packagesImage.ss}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${ctx}/static/img/bnsi_coin2.png"/>
                                        </c:otherwise>
                                    </c:choose>
                                </th>
                                <td>
                                    【<a style="display:inline-block">${entity.operator.operatorName}</a>】${entity.packages.packagesName}<br>
                                    （通话时长426min+400MB流量） <br>使用范围： ${entity.packages.packagesRange}<br>
                                    支持手机制式：GSM
                                </td>
                                <td>
                                    套餐：${entity.packages.packagesName}<br>
                                    协议期：12个月<br>
                                    卡号：${entity.goods.phone}<br>
                                    <c:if test="${not empty entity.goods.cardNo}">
                                        卡贴：x1
                                    </c:if>
                                </td>
                                <td>￥${entity.goods.goodsPrice}</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
            <div class="line1"></div>

            <p class="spqdp">悠游宝仅提供卡贴的发票，不提供购卡和充值发票<i>发票信息</i> <span id="addfapiao">+</span></p>

            <table class="fpnr" style="display:none;">
                <tr>
                    <td><b>*</b>发票类型：</td>
                    <td><input type="radio" id="gr" name="fptt" value="personal"/>个人</td>
                    　
                    <td><input type="radio" id="dw" name="fptt" value="company"/>单位</td>
                    <td><input id="gsmc" style="display:none" type="text" placeholder="请在此填入公司名称"/></td>
                </tr>

                <tr>
                    <td><b>*</b>发票抬头：</td>
                    <td><input type="radio" name="fpnr" value="办公用品"/>办公用品</td>
                    　
                    <td><input type="radio" name="fpnr" value="明细"/>明细</td>
                    <td style="width:42%">　<input type="radio" name="fpnr" value="耗材"/>耗材</td>
                </tr>
            </table>


            <table class="yfze">
                <tr>
                    <td class="tar" style="width:90%;"> 商品金额总计：<br> 运费：<br> 代金券充抵：</td>
                    <td class="tal">￥${totalFee}<br>￥0.00<br>￥0.00</td>
                </tr>
                <tr>
                    <th></th>
                    <td>
                        <div class="space40"></div>
                    </td>
                </tr>
                <tr>
                    <td class="tar" style="width:10%;"> 应付总额：</td>
                    <td class="tal"> ￥${totalFee}</td>
                </tr>
                </tbody>
            </table>

            <p class="ngxzf"><i>您共需支付：</i><span>￥${totalFee}</span></p>

            <div class="space40"></div>
            <p class="ngxzf" style="background:#fff"><span><i>您共需支付：</i>￥${totalFee}</span>
                <a class="btn" style="margin-left:20px" href="javascript:void(0);" onclick="generateOrder();">提交订单</a>
            </p>
            <div class="space40"></div>
        </div>
    </div>
</div>

<div class="space100"></div>
<div class="bottom">
    <dl>
        <dt>
            版权所有：1998-2014 悠游集团　<a>法律公告</a>　｜　<a>隐私保护</a>　　Boss网京ICP备11035381
        </dt>
        <dd>
            <a>满意度调查</a>　｜　<a href="37 contact.html">联系我们</a>　｜　<a
                href="d3 JobOpportunities.html">工作机会</a>　｜　<a>合作伙伴认证</a>　｜　<a href="m2 helpCenterLoginorRegister.html">帮助中心</a>
        </dd>
    </dl>
</div>
<script type="text/javascript" src="${ctx}/static/js/bottom.js"></script>


<div class="frwxy" id="liantong">
    <div class="frwxyc">
        <font>入网协议</font>
 <textarea readonly>
                                                                                                    中国联通业务客户入网服务协议
甲方（客户）： XXX

乙方：中国联合网络通信有限公司北京市分公司

根据《中华人民共和国合同法》、《中华人民共和国电信条例》等有关法律法规的规定，甲乙双方在平等、自愿、公平、诚信的基础上，基于对乙方通信服务的了解和需求，甲方自愿申请成为乙方客户，并达成协议如下：

第一条入网要求及业务办理
（一）甲方办理入网、变更手续时，应提交以下登记资料：
1、个人客户：提供个人有效身份证件原件（委托他人办理的应同时提交本人及代理人/监护人有效身份证件原件及授权委托书），有效身份证件包括居民身份证、军/警官证、港澳居民往来内地通行证、台胞证、护照（仅限外籍人士）等。
2、单位客户：提供单位介绍信、营业执照副本原件或组织机构代码证原件、代理人有效身份证件原件等。
3、甲方户籍所在地（以有效身份证件的住址为准）或法定住所地（营业执照上单位注册地）不在本地的，应该按照乙方的要求办理相应的担保手续。担保手续为预付款（预存款）方式或本地公民、单位提供担保。本地公民、单位提供担保是指由乙方所在北京市的公民、具有合法主体资格的单位提供连带责任保证担保，担保人应如实填写担保资料，并应签字、盖章（单位担保时须加盖单位公章）。甲方选择预付款（预存款）方式的，应持有效身份证件原件，到乙方营业网点缴纳不同业务规定的最低额度预付款（预存款）。如果担保人要求撤销担保，甲方应提供新的担保人或缴纳预付款（预存款），到乙方营业网点办理相关手续。
（二）甲方应使用国家给予入网许可标志的终端设备，终端设备应具备支持所选服务的相应功能，如无法支持所选服务，甲方应自行承担后果，并向乙方全额支付其所选服务的全部费用。
（三）甲方欲将业务号码过户时，应先交清所有费用，过户时须由双方持有效身份证件原件办理。如有特殊情况，甲方可委托他人办理，但应同时提交本人及代理人/监护人有效身份证件原件及授权委托书。
（四）甲方采用担保人方式入网的，办理过户业务时，甲方须提交担保人出具的书面文件，说明担保人同意继续担保或要求终止担保。新机主应符合本协议第一条第（一）款的条件。
（五）如甲方本人未到场，由代/经办人办理各类业务的，如甲方提出异议，代/经办人应承担相关责任和因办理业务可能给甲方造成的损失。

第二条费用标准和费用交纳
（一）乙方应在国家电信资费主管部门允许的范围内设定资费标准、向客户明码标价、公告交费期限信息；甲方应在乙方明示的期限内足额交纳各项通信费用。
（二）甲方使用乙方提供的资费套餐方案，套餐有效期为一年（双方特殊约定的除外）。套餐到期后，双方如无异议，有效期逐年自动顺延。如无特殊约定，甲方在有效期内或到期后可更换套餐。
（三）如遇国家统一调整通信费用标准的，则按国家统一规定执行。如遇乙方发布、调整资费的，自乙方公告确定的生效日起开始执行新的资费标准。在乙方公告确定的生效日前，甲方未提出异议的视为同意，协议继续履行；甲方提出异议且未能与乙方达成一致的，甲方向乙方结清全部未付款项后本协议自动终止。
 
（四）若甲方为后付费用户，每月3日—当月最后一日为支付上月费用的交费期限，甲方应按时交纳通信费用（计费周期为自然月，由于客户跨计费周期使用通信服务，网络设备产生话单及相关处理会有时延，可能会发生当月部分费用计入后期话费中收取的情况）。甲方未在约定期限内足额交纳通信费用的，乙方每日加收所欠费用的３‰作为违约金，并有权暂停甲方服务；甲方交清欠费和违约金后，除甲方明确提出不开通或已销号外，乙方应在24小时内恢复甲方服务。对前述情形，乙方将保留追缴欠费、违约金及向征信机构提供甲方欠费信息的权利，也可用通知单、委托第三方等形式追缴欠费。
（五）若甲方为预付费用户，则必须保证账户上有充足的款项。如甲方账户满足消费条件的余额不足，乙方有权限制或停止向甲方提供服务，且乙方可不再另行通知。
（六）甲方定制第三方增值业务或其它收费业务，乙方可以代第三方向甲方收取信息费、功能费等，甲方使用第三方提供的增值业务或其它收费业务由第三方制定收费标准并公布。
（七）甲方如需开通国际及台港澳业务，应按乙方规定交纳相应费用。
（八）因甲方终端中的软件自动升级等原因产生的网络流量，甲方应承担该笔流量所产生的费用。

第三条客户权益
（一）网络服务
1、乙方在现有技术条件下的网络覆盖范围内向甲方提供通信服务。
2、乙方提供的网络服务应符合国家规定的通信质量标准。
（二）客户服务
1、乙方在承诺的网络覆盖范围内按照不低于《电信服务规范》的标准向客户提供服务。
2、乙方向甲方提供客户服务电话10010、网上营业厅www.10010.com等渠道，以便甲方了解乙方各项服务。乙方还应向甲方免费提供通话所在地（仅限国内不含港澳台）火警119、匪警110、医疗急救120、交通事故报警122等公益性电信服务。
3、乙方向甲方提供需要甲方支付月功能费的服务项目时，应征得甲方同意；乙方开通服务项目让甲方进行体验时，不应收取体验服务项目月功能费。
4、对于甲方通信服务开通/关闭申请，乙方应在承诺的时限内操作完成（双方另有约定的除外）。乙方超过时限未及时开通/关闭的，应减免甲方由此产生的通信费用。
5、为向甲方提供更好的服务，方便甲方了解中国联通各类业务服务和信息，乙方可通过短信、彩信、wappush、电话、电子邮件、信函等方式与甲方就业务和服务进行沟通。
6、乙方依法保证甲方的信息资料安全、通信自由和通信秘密，但法律法规另行规定的除外。
第四条风险与责任
（一）甲方应保证入网、变更登记资料真实有效、准确完整，并有义务配合乙方对登记资料进行查验。甲方登记资料如有变更，应主动办理变更手续。因甲方提供的客户资料不详、不实或变更后未及时通知乙方等原因，使乙方无法向甲方提供服务或甲方无法享受到乙方提供的相关服务，乙方无需向甲方承担任何责任。如乙方发现因甲方登记资料失实或者甲方未配合及时更正影响协议正常履行的，乙方有权暂停甲方服务，且乙方无需向甲方承担任何责任。
（二）甲方应妥善保管自己的电话号码、通信卡、终端、宽带账号，若发现丢失或被盗用，可及时拨打客户服务电话或到乙方营业网点办理暂时停机或修改账号密码手续；并可向公安机关报案，乙方应配合公安机关调查，但乙方不承担上述情形对甲方所造成的后果；如甲方将名下号码交予他人使用，因此引起的义务与责任仍由甲方承担。
（三）甲方应妥善管理其通信服务密码。服务密码是甲方办理业务的重要凭证，甲方入网后应立即修改初始服务密码。凡使用服务密码定制、变更或终止业务的行为均被视为甲方或甲方授权的行为，因此引起的义务与责任均由甲方承担。
（四）甲方使用固网及宽带业务时，未经有关部门批准许可，不得自行更改其使用性质，不得开设各类服务站点，不得利用计算机互联网络进行任何经营性服务活动，否则乙方有权停止服务，依法追缴各项费用和违约金，并不承担任何责任。
（五）甲方退网时，甲方租赁或乙方免费提供给甲方使用的终端设备，应归还乙方或按照甲乙双方相关约定处理。
（六）甲方在欠费情况下，乙方有权拒绝为甲方开办其他业务（含移动、固网、宽带等所有业务），直至甲方补交全部欠费及违约金。
（七）乙方在受理业务（服务）后，将进行线路资源核查，对于不具备开通条件的，在乙方告知甲方后，本协议自动终止，乙方退还甲方已交纳费用，但不承担其他责任。
（八）在固定电话开通并正常使用前（含新装、移机、改号等），甲方不能将已选中号码通知他人或进行宣传，否则由此所造成的后果及损失，由甲方自行承担。
（九）甲方所办理的数据业务下行速率标称值仅为乙方提供的数据业务下行速率最高值，乙方不能保证在任何情况下均能达到前述标称值，甲方对此表示知悉并认可。
（十）甲方未付的通信费用达到信用额度时（信用额度是指用户可以用于透支消费的最高通信费用额度），应及时补充交纳通信费用；当甲方未付的通信费用超过信用额度时，乙方有权暂停甲方网络服务（超过信用额度停机不受约定交费期限的限制）。
（十一）甲方发送违法及其他违反公序良俗内容的信息，或未经接收客户同意大量发送商业广告信息的，乙方有权依据接收客户举报或投诉关闭甲方信息发送功能。
（十二）因甲方原因造成的通信卡密码丢失、锁卡或被他人获取造成的损失，乙方不承担责任，甲方不能以此为由拒绝按本协议约定支付通信费用。
（十三）按照公平使用原则，乙方将对甲方的移网数据流量进行封顶限制，甲方每月的移网数据流量达到或超出流量封顶额度时，乙方可暂停甲方当月的上网服务，次月自动恢复开通。
第五条违约责任
（一）一方违约给对方造成损失的，应当依法承担赔偿责任，但违约方应承担的赔偿损失的责任范围不包括守约方未实现的预期利润或利益、商业信誉的损失、丢失的数据本身及因数据丢失引起的损失、守约方对第三方的责任及其他间接损失。
（二）因不可抗力导致本协议部分或全部不能履行的，双方可部分或全部免除责任。
第六条协议的变更与解除
（一）乙方在本协议外以公告、使用手册、资费单页等书面形式公开做出的服务承诺，甲方办理各类业务所签署的表单、业务协议（须知）等均自动成为本协议的补充协议；与本协议冲突部分以补充协议为准，补充协议中未约定部分以本协议为准。
（二）甲方要求终止服务（双方另有约定的除外）申请办理拆机或销户的，如甲方预存费用不足，则应按照乙方要求预存一定数额的通信费，次月按照乙方业务规定和双方约定结清相关费用。
（三）有下列情形之一的，乙方有权单方解除协议，收回号码或账号、终止服务，并保留追究甲方违约责任的权利：
1、甲方提供的有效身份证件（包括代理人或监护人提供的有效身份证件）虚假、不实，可能给乙方带来经营风险的；
2、甲方自行安装未取得入网许可、可能影响网络安全或网络服务质量设备的；
3、甲方以担保等方式取得号码使用权的，如担保人违反保证条款或有确切证据证明担保人无能力履行保证责任的；
4、甲方未办理相关手续，自行改变电信业务使用性质或私自转让租用权的；
5、甲方欠费停机后（含欠费停机当月）3个月内仍未交清通信费用和违约金的;
6、业务（服务）超过约定有效期的；
7、该号码被国家司法机关认定用于违法犯罪活动或其它不当用途的；
 
 </textarea>

        <div class="space"></div>
        <a class="btn" onClick="$('#liantong').hide();">关 闭</a>

    </div>
    <div class="space40"></div>
    <div class="space40"></div>
</div>


<div class="frwxy" id="yidong">
    <div class="frwxyc">
        <font>入网协议</font>
 <textarea readonly>
                                                                                                 中国移动通信客户入网服务协议

甲方：       （客户）                                      

乙方：中国移动通信集团**有限公司      分公司

一、服务内容及服务承诺
1.甲方愿意使用乙方提供的号码，并接受乙方提供的电信服务，乙方愿意在现有技术条件下网络覆盖范围内以及签订有漫游协议的电信运营商的网络覆盖范围内为甲方提供电信服务，具体服务内容由甲乙双方通过签署业务受理单或其他方式另行约定。
2.甲方可以自主选择是否订购第三方服务商提供的由乙方代收服务费的增值电信业务（以下简称“代收费业务”）。
3.乙方提供的电信服务应当符合法律法规的规定及政府主管部门发布的相关标准；甲方应遵守法律法规的规定使用乙方提供的服务。
4.乙方将通过营业厅、门户网站、10086热线等渠道公示服务项目、服务时限、服务范围及资费标准等内容。
5. 乙方向甲方提供便捷的业务办理和客户投诉受理渠道，乙方应在接到客户投诉之日起４８小时内回复。
二、入网登记
1.甲方使用乙方客户号码并接受乙方提供的电信服务，需办理入网登记手续。甲方办理入网登记手续时，需向乙方提供真实有效的身份证件原件；甲方委托他人代办入网时需同时提供代理人真实有效身份证件原件及委托书。有效身份证件是指：居民身份证、临时居民身份证、户口簿（仅用于未成年客户）、军人身份证件、武装警察身份证件，港澳居民往来内地通行证，台湾居民来往大陆通行证，护照。单位有效证件是指单位注册登记证照原件或盖单位公章的注册证照复印件，并同时提供加盖公章的单位授权书及经办人有效身份证件。
2.如甲方入网登记资料发生变更，应及时到乙方营业厅办理资料完善手续。因甲方或其代理人提供的资料不详、不实或变更后未及时办理资料完善手续等原因所造成的后果由甲方自行承担。
3.甲方入网后自动获取客户初始服务密码的，应立即修改初始服务密码并妥善保管。因密码保管不善造成的后果由甲方自行承担，但乙方有义务协助甲方或公安机关调查相关情况。为方便办理业务，乙方可根据甲方申请以短信等方式提供随机密码，该密码可作为办理业务的临时凭证。凡使用服务密码或随机密码办理业务的行为均被视为甲方或甲方授权的行为。
4.甲方因SIM卡丢失或损坏等原因需办理补卡手续或换卡手续时，甲方应凭有效身份证件原件到乙方营业网点办理，甲方委托他人代办需同时提供甲方及代理人真实有效身份证件原件及委托书。乙方可以收取相应费用。

三、资费及费用交纳
1.甲方使用乙方提供的电信服务应支付相关费用，乙方收取的相关费用应符合法律法规的规定和甲乙双方的约定。
2.甲方有权要求乙方提供免费的话费查询服务，乙方有义务对账单、详单进行解释。
3.甲方应按照与乙方约定的时间、方式，向乙方交纳费用账单中记载的全部费用。甲方超过约定交费日未交足费用（以下称“欠费”），乙方有权暂停提供服务(以下称“欠费停机”)，并可以按照所欠费用自交费日次日起每日加收3‰（千分之三）的违约金。自欠费停机之日起60日内，如甲方交清欠费和违约金的，乙方应在甲方交清欠费和违约金后的24小时内恢复暂停的服务（以下简称“复机”）。欠费停机满60日，甲方仍未交清欠费和违约金的，乙方有权终止提供电信服务（以下简称“销号”）和解除协议，并可以通过信函、公告、委托第三方等方式追缴全部欠费和违约金。
4.甲方在欠费停机期间，停机当月和复机当月的月使用费（套餐费）照常计收。欠费停机跨整月不收取任何费用。
5.甲方可以自行申请办理停机保号业务，停机保号期间收取停机保号费。
6.乙方对计费原始数据保留期限为5个月(系统产生用户话单当月起后5个月，不含当月)。若甲方对乙方收取的费用存有异议，应在异议费用发生后5个月内向乙方提出(系统产生用户话单当月起后5个月，不含当月)。乙方对甲方在异议话费发生后5个月内提出异议的话单，应保存至异议解决为止。
7.甲方对乙方收取的费用提出异议的，乙方有责任进行调查、解释，经核实确属乙方责任多收费用的，乙方应将已多收的部分双倍返还甲方。
8.如果甲方订购第三方服务商的代收费业务，则视同甲方同意乙方代第三方服务商向甲方收取服务费。该服务费的资费标准由第三方服务商制订并告知甲方。若甲方对收取的代收费业务服务费有异议，可在乙方协助下与第三方服务商协商解决。
9.甲方应妥善保管自己的号码不被非法盗用，若发现通信费用异常增长，可及时拨打客服热线10086或到乙方营业网点办理停机手续，并向公安机关报案；乙方应积极配合甲方和公安部门调查相关情况。

四、协议的变更、终止与转让
1. 乙方承诺资费方案有效期为一年（双方特殊约定的除外）。乙方有权在有效期截止后修改资费方案。如需修改，乙方应在修改前两个月通知甲方，甲方可以选择修改后的资费方案或乙方提供的其他资费方案。如无需修改，则原资费方案顺延一年，顺延次数不限。
2.除双方另有约定外，甲方可以选择变更资费方案。
3.经甲乙双方协商一致，甲方可以将本协议项下的号码过户给第三人。甲方和第三人应持双方有效身份证件原件到乙方营业网点办理过户手续，在甲方结清所有费用后由第三人与乙方重新签订客户入网服务协议，本协议自动终止；在办理变更手续之前，因使用该号码导致的交费义务及一切后果仍由甲方承担。
4.甲方可以持登记的有效身份证件到乙方营业网点要求终止提供服务（以下简称销户）。除双方另有约定外，乙方不应拒绝甲方销户，甲方应在销户前结清所有费用。销户90天后，乙方可以重新启用甲方原号码。
5.甲方在未参与赠送、销售优惠等营销活动情况下，销户时，可以预约将余额一次性转入另一乙方有效号码的账户；甲方在参与赠送、销售优惠等营销活动情况下，费用余额按营销活动协议约定进行处理。
6.如遇政府主管部门统一调整资费标准的，本协议按政府主管部门调整后的资费标准在规定的时间起执行。
7.有下列情况之一的，乙方有权解除协议，收回号码，终止提供服务，由此造成的后果由甲方自行承担：
（1）甲方（包括代理人）提供的证件或资料虚假不实； 
（2）利用乙方提供的服务从事违法犯罪活动； 
（3）利用乙方提供的服务从事损害社会公共利益的活动；
（4）乙方收到国家有关部门通知要求停止向甲方提供通信服务；
（5）甲方欠费满60日仍未交纳费用。

五、隐私和通信权益保护
1.甲方的通信自由和通信秘密不受侵犯，乙方对甲方的客户资料和通信信息负有保密义务。但根据法律法规规定，司法、行政机关依法要求乙方提供协助和配合，乙方给予协助和配合的，不构成违反保密义务。
2.甲方不得利用乙方提供的服务从事违法犯罪活动或损害社会公共利益的活动，不得发送违法信息或未经接收客户同意大量发送骚扰信息，不得有拨打骚扰电话等不当行为，否则，乙方可以暂停向甲方提供服务，直至终止服务。
六、特别提示
1. 乙方的全球通、动感地带、神州行等不同品牌的资费和服务存在差异，甲方入网时可自愿选择品牌。
2.甲方应使用取得国家入网许可并具有进网许可标志的终端设备，该终端设备应具有支持其所选服务的相应功能。
3. 甲方或其代理人已详细阅读本协议的全部条款，甲方或其代理人在签署本协议后即视为完全理解并同意接受本协议的全部条款。
七、争议解决
本协议项下发生的争议，甲乙双方应协商解决，协商不成的，双方可向电信管理部门申诉、向消费者协会等有关部门投诉，或通过下列第      种方式解决[1]：
（1）将争议提交     仲裁委员会。该会依据其现行有效的仲裁规则在     进行仲裁。
（2）向     人民法院提起诉讼。

八、其他
1.甲方办理各类业务所签署的业务受理单、表单、协议等为本协议的补充协议，与本协议冲突部分以补充协议为准，补充协议中未约定部分以本协议为准。
2. 本协议一式两份，双方各执一份，具有同等法律效力。本协议经加盖乙方公司的业务专用章、营业厅专用章，甲方盖章或签字后生效。对本协议未尽事宜，双方另行协商解决。
有关协议争议，双方可沟通协商解决；协商不成的，甲方可向当地通信管理局或消费者协会申请进行调解；任何一方均可向乙方住所地的人民法院起诉。
第八条协议生效
本协议一式两份，甲乙双方各执一份，自业务受理之日起生效，有效期一年。到期时，若双方均无异议，本协议以一年为周期逐年自动顺延。
为本次受理业务，甲方还领取了所办业务如下协议（须知），已充分、完整阅读并理解其作为本协议附加协议所述全部条款及条件。
（1）中国联通3G业务优惠活动业务协议
（2）中国联通移动业务靓号使用须知
（3） 中国联通沃家庭业务协议
（4）北京联通公众宽带产品业务须知
（5）中国联通携号转品牌业务客户须知（后转预）
（6）中国联通携号转品牌业务客户须知（预转后）

 
 </textarea>

        <div class="space"></div>
        <a class="btn" onClick="$('#yidong').hide();">关 闭</a>

    </div>
    <div class="space40"></div>
    <div class="space40"></div>
</div>


<div class="frwxy" id="dianxin">
    <div class="frwxyc">
        <font>入网协议</font>
 <textarea readonly>

                                                                              中国电信股份有限公司电子渠道运营中心业务服务协议


         为维护双方利益，根据相关法律、法规的规定，双方在平等、自愿、公平、诚实信用的基础上，中国电信股份有限公司电子渠道运营中心（以下简称“电信公司”）与客户就电信业务服务的相关事宜达成如下协议：

第一条 服务范围
1.1 电信公司以通信网络与设施向客户提供其所选择的服务，客户按照本协议约定的条件接受服务。

第二条 业务登记
2.1 客户进行业务登记时，应提交以下资料：
2.1.1 个人客户：提供真实有效的本人身份证件原件。委托他人办理业务的，代办人应同时提供委托人、代办人的有效身份证件原件。
2.1.2 单位客户：提供真实有效的本单位注册登记证照资料，并提供经办人有效身份证件原件。 
2.2 客户使用客户密码通过10000号、网上服务中心、自助服务终端等登记业务时，可以不提供2.1中的资料，另有约定除外。
第三条 客户资料
3.1 客户登记办理业务时，应向电信公司提供真实、有效的客户资料，本协议有效期内客户资料变更时应及时通知电信公司。
3.2 电信公司对客户资料依法保密，但为建立与客户沟通渠道，改善服务工作，电信公司可以使用本协议涉及的客户资料。
3.3 客户密码是客户的重要资料，客户应及时修改初始密码，并注意保密。客户密码遗失或被盗时，应及时进行修改或挂失。因客户原因造成的客户密码丢失或被他人获取造成的损失，电信公司不承担责任。

第四条 业务使用
4.1 客户有权自主选择使用电信公司提供的各类电信业务，有权自主选择取得入网许可的终端设备。
4.2 客户使用电信业务时，应遵守国家法律、法规、规章等相关规定。 
4.3 未经电信公司同意并办理有关手续，客户将本协议的全部或部分转让给第三方的，对电信公司不发生法律效力。 
4.4 本协议终止后，电信公司有权收回客户原使用的业务号码，并在一定期限后分配给其他客户使用。 

第五条 费用标准和费用交纳
5.1 电信公司按照依法确定的资费标准向客户收取电信费用，客户应及时、足额支付各项费用。
5.2 根据选择的电信业务种类，客户按预付费或后付费方式支付电信费用。除特殊约定外，后付费方式下客户按月支付费用，预付费方式下客户需预存金额，当帐户余额不足以支付客户拟使用的业务费用时，需及时充值。 
5.3 客户如选择或终止银行托收、银行代扣等方式支付电信费用时，需到银行等托收机构办理相应手续。 
5.4 客户逾期不交纳电信费用的，电信公司有权要求补交电信费用，并可以按照所欠费用每日加收3‰的违约金。 
5.5 客户在欠费情况下，应补交欠费和相应的违约金后才能办理其它业务。
5.6 如遇国家调整电信费用标准的，自国家规定的调整时间起按新标准执行。如遇电信公司发布费用优惠方案的，自优惠方案规定的时间起按优惠标准执行。

第六条 服务质量与客户服务
6.1 电信公司在承诺的网络覆盖范围内，按照不低于《电信服务规范》的标准向客户提供服务。
6.2 电信公司在营业场所公布电信业务的服务项目、服务时限、服务范围、资费标准、使用规则、交费规定等内容。
6.3 电信公司通过10000号客户服务热线、营业厅等多种渠道提供业务受理、咨询、查询、障碍申告等服务。 
6.4 电信公司负责其提供的网络及设备的安装调测和维护，客户负责自带入网终端设备的安装、调测和维护。
6.5 电信公司在本协议外以公告等形式公开做出的服务承诺，自动成为本协议的组成部份，但为客户设定义务或不合理地加重责任的除外。 

第七条 协议中止和解除
7.1 除另有约定外，客户在交清电信费用后，可以暂停所使用的电信业务，但应办理有关手续和支付暂停期间的有关费用。
7.2 客户有下列情形之一的，电信公司可以暂停向客户提供本协议约定的部分或全部服务，并收取暂停期间发生的费用：提供客户资料不真实或无效的；安装未取得入网许可，或可能影响网络安全或网络服务质量设备的；未办理相关手续，自行改变电信业务使用性质的；对于后付费业务，超过交费期限30日、经通知后仍未交费 的；对于预付费业务，帐户余额低于0元，或超过约定有效期的。
7.3 除另有约定外，客户在交清相关电信费用及相应的违约金后，可办理业务注销或过户手续，本协议相应解除。 
7.4 客户有下列情形之一的，电信公司可以终止服务并终止本协议：擅自利用电信业务非法进行电信业务经营的；出现7.2所述情形，暂停服务超过60日的。
7.5 客户在电信业务使用过程中如有违反相关法律、法规、规章规定的行为，电信公司可以暂停或终止提供电信服务。

第八条 不可抗力
8.1 由于不可抗力，如战争、自然灾害等，导致本协议不能履行的，双方均不需承担违约责任。 

第九条 争议解决
9.1 所有因本协议引起的或与本协议有关的争议，本着互让互利的原则，通过协商解决。协商不成的，客户可向电信管理部门申诉或向消费者协会等有关部门投诉。 9.2按照9.1的约定，仍无法解决争议的，双方均可向北京仲裁委员会提起仲裁解决，仲裁裁决是终局的，对双方均有约束力。

第十条 附则
10.1客户登记单为本协议的组成部份，客户登记单内容与上述协议条款内容冲突时，以业务登记单为准。 
10.2 电信公司保留因技术进步或国家政策变动等原因对电信业务的服务功能、操作方法、业务号码等做出调整的权利，但调整时应提前告知客户并提供相应解决方案。 
10.3 电信公司可以采用电话、广播、短信、电视、公开张贴、信函、报纸或互联网等方式进行业务公告及业务通知。 
10.4 本协议自电信公司与客户或经办人在客户登记单上签字或盖章之日起生效。
 
 </textarea>

        <div class="space"></div>
        <a class="btn" onClick="$('#dianxin').hide();">关 闭</a>

    </div>
    <div class="space40"></div>
    <div class="space40"></div>
</div>

<div class="deleteWindow" style="display:none" id="deleteWindow">
    <span>删除收货人信息</span>
    <table>
        <tr>
            <th rowspan="2"><img src="../img/deleteyon.png"/></th>
            <td class="td1">您确定要删除该收货地址吗?</td>
        </tr>
        <tr>
            <td><a class="btn" onClick="$('#deleteWindow').hide();">确定</a><a class="btn"
                                                                             onClick="$('#deleteWindow').hide();">取消</a>
            </td>
        </tr>
    </table>
</div>

</body>
<script type="text/javascript">
    /* */
    $(document).ready(function (e) {
        var ww = $(window).width();
        var wh = $(window).height();


        var dwtop = (wh - 184) / 2;
        var dwleft = (ww - 404) / 2;
        $("#deleteWindow").css("top", dwtop);
        $("#deleteWindow").css("left", dwleft);

        // var frwxytop=(wh-184)/2;
        var frwxyleft = (ww - 1100) / 2;
        // $("#deleteWindow").css("top",dwtop);
        $(".frwxy").css("left", frwxyleft);


    });

    $(function () {
        $("#addfapiao").click(function () {
            $(".fpnr").toggle();
        });

        $(".pd70").each(function () {
            $(this).click(function () {
                $("#divpd" + $(this).index()).show().siblings(".psfslg").hide();
            })
        })

        $("input[name='shdz']").each(function () {
            $(this).click(function () {
                $(this).parent().addClass("pd150s");
                $(this).parent().siblings().removeClass("pd150s");

                $("#editAddress").click(function () {
                    $("#OldTable").show().next("table").hide();
                });
            });
        })

        $("#addNewAddress").click(function () {
            $("#NewTable").show().prev("table").hide();
        });
        $("#removeNewAddress").click(function () {
            $("#NewTable").hide();
        });


        $("#dw").focus(function () {
            $("#gsmc").show();
        });
        $("#gr").focus(function () {
            $("#gsmc").hide();
        });
    });

    function deleteAddress(addressId) {
        if(addressId) {
            $.post("${ctx}/account/address/delete/" + addressId,{},function(result){
                var data = eval(result);
                if(data.status_code == "1") {
                    $("#address-distribute-" + addressId).remove();
                } else {
                    alert(data.msg);
                }
            });
        }
    }
    function editDistributeAddress(addressId) {

    }

    function loadChildren(ctx,parentCode,targetFirstOptionId) {
        $("#" + targetFirstOptionId).siblings().remove();
        if(parentCode != null && parentCode != "") {
            $.post("${ctx}/basedata/region/children/load/"+ parentCode,{},function(result){
                var data = eval(result);
                if(data.status_code == "1") {
                    var options = "";
                    $.each(data.result,function(index,entity) {
                        options += '<option value="'+ entity.id +'">'+ entity.regionName +'</option>'
                    });
                    if(options) {
                        $(options).insertAfter("#" + targetFirstOptionId)
                    }
                }
            });
        }
    }

    function createAddress() {
        var realName = $("#realName").val();
        var provinceCode = $("#province").val();
        var cityCode = $("#city").val();
        var districtCode = $("#district").val();
        var address = $("#address").val();
        var mobile = $("#mobile").val();
        var email = $("#email").val();
        if(realName == null || realName=="") {
            alert("请输入收货人姓名");
            return;
        }
        if(provinceCode == null || provinceCode=="") {
            alert("请选择省或直辖市");
            return;
        }
        if(cityCode == null || cityCode=="") {
            alert("请选择市或地区");
            return;
        }
        if(address == null || address=="") {
            alert("请输入收货地址");
            return;
        }
        if(mobile == null || mobile=="") {
            alert("请输入联系方式");
            return;
        }
        var data = {
            realName:realName,
            province:provinceCode,
            city:cityCode,
            district:districtCode,
            address:address,
            mobile:mobile,
            email:email
        }
        $.post("${ctx}/account/address/create",data,function(result){
            var data = eval(result);
            if(data.status_code == "1") {
                var pStr = '<p id="address-distribute-'+ data.msg +'" class="pd150" style="border-bottom:1px dashed #ccc">' +
                                '<input id="radio-distribute-'+ data.msg +'" type="radio" name="shdz" value="'+ data.msg +'" checked/>' +
                                realName + '<b>'+ address+'&nbsp;&nbsp;'+ mobile +'</b>' +
                                '<a href="javascript:void(0);" onclick="deleteAddress('+ data.msg +');">删除</a>' + '</p>';
                $(pStr).insertBefore("#last_p_address");
                //hide
                $("#addNewAddress").attr("checked",false);
                $("#NewTable").hide();
            } else {
                alert(data.msg);
            }
        });
    }
    function generateOrder() {
        var orderType = $("input[name='distributeType']:checked").val();
        var addressId = $("input[name='shdz']:checked").val();
        var serviceSiteId = $("input[name='fwdlb']:checked").val();
        var bookingRealName = $("#bookingRealName").val();
        var bookingMobile = $("#bookingMobile").val();
        var invoiceType = $("input[name='fptt']:checked").val();
        var company = $("#gsmc").val();
        var invoiceTitle = $("input[name='fpnr']:checked").val();
        if(orderType == null || orderType == '') {
            alert("请选择配送方式");
            return;
        }
        if(orderType == 'post') {
            if(addressId == null || addressId == '') {
                alert("请选择收货地址");
                return;
            }
        }
        if(orderType == 'byself') {
            if(serviceSiteId == null || serviceSiteId == '') {
                alert("请选择预约的服务点");
                return;
            }
            if(bookingRealName == null || bookingRealName == "") {
                alert("请输入联系人姓名");
                return;
            }
            if(bookingMobile == null || bookingMobile == "") {
                alert("请输入收货人联系方式");
                return;
            }
        }

        var data = {
            detailIds:'${data}',
            orderType:orderType,
            addressId:addressId,
            serviceSiteId:serviceSiteId,
            bookingRealName:bookingRealName,
            bookingMobile:bookingMobile,
            invoiceType:invoiceType,
            invoiceCompany:company,
            invoiceTitle:invoiceTitle
        };
        $.post("${ctx}/trolley/buynow/confirm",data,function(result) {
            var data = eval(result);
            if(data.status_code == "1") {
                var orderCode = data.msg;
                window.location.href = "${ctx}/order/prepay/"+ orderCode;
            } else {
                alert(data.msg);
            }
        });
    }
</script>
</html> 
