<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%--  
    @system  综合理财平台
    @version 3.0.0.3   
    @2017-08-01
    @部分字段显示优化	M201712010308
    @修改记录
          程序版本             修改序号                      修改人员            修改说明
    V3.0.0.6    2012-06-01-01   linxy06684  添加地址最小长度控制
    V3.0.0.7    2012-06-21-01   jianghl     对帐单发送频率位置下移,增加风险等级未评定控制
    V3.0.0.8    20120625-01     jianghl     修改checkSendMode方法传入的参数
    V3.0.0.9    20120724-01     jianghl     取到100005交易返回的HostClientType，然后把这个字段上送到联机
    V3.0.0.10   20120730-01     jianghl     根据配置实现邮政编码输入项由必输项改为选输项。
    V3.0.0.11   20120810-01     jianghl     根据配置实现法人代表证件类型、法人代表证件号不可编辑
    V3.0.0.12   20121114-01     jianghl     修改银行账号为空的提示信息
    V3.0.0.13   20121116-01     linxy06684  JSP页面添加授权框控制
    V3.0.0.14   20121207-01     jianghl     低柜增加校验是否已经签约
    V3.0.0.15	20121213	    zhanglm     增加参数控制对账单发送频率是否可编辑
    V3.0.0.16   20130130-01     jianghl     发送100005交易增加传入参数ClientInfoFlag:1   M201301170036
    V3.0.0.17   20130131-01     linxy       批量添加多客户经理输入参数prdType,clientType
    V3.0.0.18   20130413-01     jianghl     在授权框控件批量增加交易代码和金额字段   M201303200021
    V3.0.0.19   20130417-01     linxy       法人代表名称 受参数 ReprIdReadonly 控制  M201304110004
    V3.0.0.20 	20130418-01		zhuqd		根据配置实现法人代表名称,联系人名称最小长度控制  M201303290002
    V3.0.0.21   20130606-01     jianghl     提示信息“该账号已经签约”改成“该客户已经签约”   M201306060001
    V3.0.0.22   20130704-01     linxy       经办人，联系人身份证号码添加校验  M201307040008
    V3.0.0.23   20131111-01     qudc		 签约上送LastScore字段  M201311080019
    V3.0.0.24   20131112-01     sundan            对账单发送频率，对账单发送方式增加配置参数控制默认值  M201311060008
    V3.0.0.25   20131205-01     qudc        开通购买四级以上的理财产品在柜台以外渠道进行，行方要求系统在显示此选项时，系统默认是勾选状态，新增默认值控制。修改单号：M201311270024
    V3.0.0.26	20131217-01		yuhh		添加控制是否区分业务签约M201312130063
    			20131226-01		yuhh		若分业务签约则不判断签约状态是否正常
   	V3.0.0.27   20140115-01     qudc		新增参数"PrdTypesSingle"，用于控制业务类型是单选还是复选，修改单号：M201401150003
   	V3.0.0.28	20140321-01		yuhh		支持证件类型证件号签约M201403170022
   				20140324-01		yuhh		修改弹出框大小M201403170022
   				20140325-01		yuhh		信息登记客户组别若返回为空则取登记时信息
    V3.0.0.29   20140403-01     huangsy     华润银行ECIF签约时需要保存传过来的 M201404030007
    V3.0.0.30   20140421-01     chenling    哈尔滨银行个性化增加从关系表中获取客户经理返回给低柜   M201404030013
    V3.0.0.31   20140513-01     wuhh07103   对公客户经理是否必输配置与对私分开,且兼容原配置 M201405130041
    V3.0.0.32   20140516-01     huansy08978 签约成功后，是否发送短信恢复默认值  M201405140048
    V3.0.0.33   20140718-01     chenling    根据配置显示发送频率和对账单发送方式字段   M201407110010
    V3.0.0.34   20140801-01     chenling    根据配置显示发送频率和对账单发送方式字段   M201407110010
    V3.0.0.35   20140811-01     chenling    增加推荐人编号M201408060029
    V3.0.0.36   20140915-01     chenling     推荐人校验 M201409010024
    V3.0.0.37   20140917-01     chenling     根据配置从核心取回信息是否可修改M201409160043
    V3.0.0.38   20141022-01     duxl     	行内理财，机构客户不需要做风险等级评估 M201410170016
    V3.0.0.39   20141110-01     wuxj        客户签约核心未返回客户组别时默认值可配置 M201411100136
    V3.0.0.40   20141120-01     jianghl     修改客户签约页面显示问题   M201411200059
    V3.0.0.41   20141205-01     jianghl     修改IE8环境下1024*798分辨率问题   M201411040104
    V3.0.0.42   20141225-01     chenling    根据配置开通购买四级以上的理财产品在柜台以外渠道进行默认勾选隐藏M201412220070
    V3.0.0.43   20150119-01     chenling    交易提交失败不要清空银行账号及其他数据项M201501040065
    V3.0.0.44   20150831-01    	duxl       	郑州银行外设升级改造 M201508250381
    V3.0.0.45   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617
	V3.0.0.46   20160105-01     duxl      	机构客户签约，机构客户信息变更页面中，机构投资人类型隐藏掉 M201512310829
	V3.0.0.47   20160322-01     duxl      	机构客户签约时要求法人代表证件号码输入不合法时，进行提示 M201603170379
	V3.0.0.48   20160324-01     zhouxy08989  青岛银行，大额存单自动签约分业务 M201603070416
	V3.0.0.49   20160531-01     duxl  		只控制机构客户签约录入界面客户组别的展示或隐藏的需求 M201605240196
	V3.0.0.50   20160531-01     duxl  		机构签约交易界面隐藏传真号码，EMAIL地址，联系人名称，联系人证件类型，联系人证件号码 M201605251034
	V3.0.0.51   20160601-01     duxl  		隐藏：邮政编码 M201605310731
	V3.0.0.52   20160803-01     youwh       增加配置,客户组别支持从理财系统中获取  M201606211093
	V3.0.0.53   20160825-01     duxl        复用请求报文cardType字段 M201608240613
	v3.0.0.54   20160919-01     zhangzy     保定银行增加验印功能 M201608091110
	v3.0.0.55   20161005-01     huangjing   平顶山银行添加“推荐人编号”字段并反显推荐人名称 M201609281112
	V3.0.0.56   20161008-01     huangjing     平顶山银行增加“客户经理名称”，输入客户经理编号反显客户经理名称   M201609270910
	V3.0.0.57   20161011-01     zhangww     平顶山银行新增机构客户子类型 M201610090123
	V3.0.0.58   20161018-01     renam       兼容成都银行IConstant报错  M201609200066
	V3.0.0.59   20161103-01     zhouyao	         盛京银行调用柜外清函数增加传值的参数，当前日期和理财还是基金的判断标识  M201610090418
	V3.0.0.60   20161108-01     zhouyao	          成都银行增加国家省市区联动下拉框  M201610130987
	V3.0.0.61   20161114-01     zhouyao	         成都银行查询省市区增加按区域级别regionlevel查询  M201610130987
	V3.0.0.62   20161114-01     huangjing   增加参数控制是否校验客户经理编号  M201609270910
	V3.0.0.63   20161205-01     niqq		100005客户资料查询增加TransCode的传值 M201610090782
	V3.0.0.64   20161214-01     xiongt      村镇银行根据机构签约  M201612060456
	V3.0.0.65   20161215-01     niqq		100005客户资料查询增加IsVirClientNo  M201610090782
	V3.0.0.66   20170419-01     zhouml      在部分业务签约的情况下，判断是否签约时增加PrdTypes的校验M201704140550
	V3.0.0.67   20170426-01     zhouyao     营口银行配置推荐人工号必输 M201704141365
	V3.0.0.68   20170524-01     wangyj      证券期货投资者适当性管理办法 M201705230053
	V3.0.0.69   20170607-01     zhangfeng   修复低柜页面打开后数据库连接数不够，造成低柜无法操作问题M201705270841
	V3.0.0.70	20170608-01		chaohong	支持查询未签约客户的投资者类型信息 201705220825
	V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299
	V3.0.0.72   20170703-01     huzd       海口银行增加自动签约M201706230266
				20170714-02     huzd       海口银行增加自动签约M201706230266
	V3.0.0.73   20170725-01     zhangfeng   ‘是否存在实际控制关系’：默认值改为否，选是，实际控制关系说明不能为空M201707210729
	V3.0.0.74   20170801-01     huzd        海口银行增加自动签约M201706230266
	V3.0.0.75	20170810-01		dongxin  	修改签约与查询页面年龄不符问题 M201708040390
	V3.0.0.76 	20170811-01		dongxin		经办人生日必输  M201708101298
	V3.0.0.77	20170816-01		dongxin 	修改跨版本问题   M201708160678
	V3.0.0.78   20170927-01     hutao       理财系统与报备系统对接修改 M201709251328
	v3.0.0.79	20171115-01		zhenglp		3.0中债基线问题 M201711141385
	v3.0.0.80 	20171120-01		zhenglp		新增核心证件类型返回字段 M201711150793
	V3.0.0.81	20171204-01		dongxin		部分字段显示优化	M201712010308
	V3.0.0.82	20171206-01		wuxs		佛山农商，增加核心返回字段的回显 M201712050075
    V3.0.0.1   20171214-01     dingrong    汇丰银行个性化新增低柜签约、解约、理财账户撤销 M201712080086
    V3.0.0.2   20180110-01     dingrong    汇丰银行个性化新增低柜签约、解约、理财账户撤销 M201712080086
    V3.0.0.3   20181011-01     yuanql      汇丰银行电话号码个性化校验 M201810110047
    -----------------------------移植个性化新增PB客户签约-------------------------------------------------
    V3.0.0.1   20190718-01     xingch      汇丰银行新增ut的PB机构客户签约交易 M201907011107
    V3.0.0.2   20230313-01     shijj       支持分业务签约  	T202303094908
    V3.0.0.3   20230321-01     shijj       “PB机构客户UT签约”权限对“机构客户签约”权限存在依赖关系  	T202303206470
--%>

<%@page import="com.hundsun.lcpt.cache.DictCache"%>
<%@page import="com.hundsun.lcpt.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/counter_tld/counter.tld" prefix="counter"%>
<%@ include file="/jspui/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.hundsun.lcpt.common.DictUtil"%>
<%@page import="com.hundsun.lcpt.util.DataUtil"%>
<%@page import="com.hundsun.lcpt.util.DateUtil"%>
<!-- V3.0.0.58   20161018-01     renam       兼容成都银行IConstant报错  M201609200066 beg-->
<%@page import="com.hundsun.lcpt.constant.IConstant"%>
<!-- V3.0.0.58   20161018-01     renam       兼容成都银行IConstant报错  M201609200066 end-->
<%@page import="com.hundsun.lcpt.constant.IDict"%>
<%@ page import="com.hundsun.jres.component.biz.framework.support.util.SysParameterUtil"%>
<%@ page import="com.hundsun.jres.common.xml.parser.Tag" %>
<%@ page import="java.util.ArrayList" %>

<%@page import="org.springframework.beans.factory.NoSuchBeanDefinitionException"%>
<%@page import="com.hundsun.lcpt.constant.IParamConstant"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>PB机构客户UT签约</title>
<%@include file="/jspui/import.jsp"%> 
<!-- 取RiskMode-->
<%
	String RiskMode = 	ParamCache.getInstance().getSysParamValue("RiskMode", "0");//0-通用，1-独立模式
	if(RiskMode == null){
		RiskMode ="0";
	}
	/*V3.0.0.55   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617  beg*/
	String bankSaveKHLBMX = ParamCache.getInstance().getSysParamValue("BankSaveKHLBMX", "0");
	String linkInfo = ParamCache.getInstance().getSysParamValue("QIANYUELINKINFO", "0");
	/*V3.0.0.55   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617  end*/
	//V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299 beg
	int initDate = Integer.parseInt(SysParameterUtil.getSysDate())/10000;
	int RiskDateStr = DateUtil.getDateOfMonthsLater(Integer.parseInt(SysParameterUtil.getSysDate()), 12);
	//V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299 end
	//V3.0.0.72   20170703-01     huzd       海口银行增加自动签约M201706230266 beg
	String  isAutoSignFlag = request.getParameter("flag");
	String  bankAccTemp = "";
	if("true".equals(isAutoSignFlag)){
		bankAccTemp = request.getParameter("BankAcc");
		
	}
	//V3.0.0.72   20170703-01     huzd       海口银行增加自动签约M201706230266 end
	//V3.0.0.85   20170927-01     hutao       理财系统与报备系统对接修改 M201709251328 beg
	String otherHostIdType = "";
	//v3.0.0.79	20171115-01		zhenglp		3.0中债基线问题 M201711141385 beg
	try{
		if(ParamCache.getInstance().getSysParamValue(IParamConstant.SUPPORT_FIRS, "false").equals("true")){
			Tag tag = SysConfigUtil.getSysConfig("BankDictConvert").getTag();
			ArrayList<Tag> itemNodeList = tag.getTagListWithPath("/hostToFirs/oIdType/item");
			for (int i = 0; i < itemNodeList.size(); i++) {
				if (itemNodeList.get(i).getProperty("desc").equals("其它")) {
					otherHostIdType = itemNodeList.get(i).getProperty("hostVal");
					break;
				}
			}
		}
	}catch(NoSuchBeanDefinitionException e){
	}
	//v3.0.0.79	20171115-01		zhenglp		3.0中债基线问题 M201711141385 end
	//V3.0.0.85   20170927-01     hutao       理财系统与报备系统对接修改 M201709251328 end
%>
<!-- V3.0.0.55   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617  beg -->
<script type="text/javascript">
var bankSaveKHLBMX = "<%=bankSaveKHLBMX%>";
</script>
<!-- V3.0.0.55   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617 end -->
<script type="text/javascript" src="<%=basePath+SysConfigUtil.getSysConfig().getValue("OCX_API")%>"></script>
  		
</head>

<body onkeydown="getNextFocusExpBtn()">
<counter:panel title="PB机构客户UT签约" width="100%" id="panel1">
    <counter:form id="sign_org" service="ifmcounter.pub.trans.T100001">
    	<TABLE class=x-table-layout cellSpacing=4 width="100%">
		  <TBODY>
		  	<TR>
					<TD class=x-table-layout-cell vAlign=top>
					<DIV id="skfsDiv" style="display:none;OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%" class="x-form-item " >
					<TABLE style="WIDTH: 100%" border=0>
						<TBODY>
							<TR>
								<counter:combobox fieldLabel="刷卡方式" displayField="dictItemName" allowBlank="true" 
									valueField="dictItemCode" fieldName="SKFS"  >
								</counter:combobox>
							</TR>
						</TBODY>
					</TABLE>
					</DIV>
					</TD>			
			</TR>
			
			<TR>
             <TD class=x-table-layout-cell vAlign=top>
                       <DIV
                         style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"
                        id=ext-gen81 class="x-form-item " >
                        <TABLE style="WIDTH: 100%" border=0>
                            <TBODY>
                                <TR>
                                    <TD style="WIDTH: 105px; OVERFLOW: hidden"
                                        class="x-form-label-firsttd x-ellipsis" vAlign=top><LABEL
                                        style="TEXT-ALIGN: left; WIDTH: 105px; WORD-WRAP: break-word; WHITE-SPACE: normal; OVERFLOW: hidden"
                                        class=x-form-item-label >客户编号:</LABEL></TD>
                                    <TD style="PADDING-LEFT: 0px; WIDTH: 145px; HEIGHT: 100%"
                                        id=x-form-el-ext-gen25 class=x-form-element vAlign=top><INPUT
                                        style="WIDTH: 142px;
                                        HEIGHT: 18px"
                                        class=" x-form-text x-form-field" 
                                        name="ClientNo" id="ClientNo" autocomplete="off" _nodup="30806"
                                        maxLength=15 size=24
                                        >
                                    </TD>
                                    <TD style="LINE-HEIGHT: 18px; WIDTH: 9px; VISIBILITY: visible"
                                        id=x-form-suffixLabel-ext-gen25 class=x-form-suffixLabel
                                        vAlign=top><PRE><SPAN style="COLOR: red">*</SPAN></PRE></TD>
                                        <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden"
                                        id=x-form-suffixCls-ext-gen25
                                    class="x-form-suffixCls -suffixCls" vAlign=top><SPAN>&nbsp;</SPAN></TD>
                                <TD class=x-form-clear-left vAlign=top></TD>
                            </TR>
                        </TBODY>
                    </TABLE>
                    </DIV>
                    </TD>

	           <TD class=x-table-layout-cell vAlign=top><!-- 证件类型 -->
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <TR>
	                    <counter:combobox fieldLabel="证件类型" displayField="dictItemName" valueField="dictItemCode" fieldName ="IdType" 
	                    		selectEvent="onSelectItem:function(item){idTypeSelectEvent(item); }"  >
			            </counter:combobox>
			            <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen17 class="x-form-suffixCls -suffixCls" vAlign=top>
	                      <SPAN>&nbsp;</SPAN>
	                    </TD>
	                    <TD class=x-form-clear-left vAlign=top>
	                    </TD>
	                  </TR>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          
	          <TD class=x-table-layout-cell vAlign=top><!-- 证件号码 -->
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <TR>
	                    <TD style="WIDTH: 105px; OVERFLOW: hidden" class="x-form-label-firsttd x-ellipsis" vAlign=top>
	                      <LABEL style="TEXT-ALIGN: left; WIDTH: 105px; WORD-WRAP: break-word; WHITE-SPACE: normal; OVERFLOW: hidden" class=x-form-item-label >证件号码:</LABEL>
	                    </TD>
	                    <TD style="PADDING-LEFT: 0px; WIDTH: 145px; HEIGHT: 100%" id=x-form-el-ext-gen18 class=x-form-element vAlign=top>
	                      <INPUT 
	                      <%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdReadonly").equals("true")?"readOnly":""%>
	                      style="WIDTH: 142px; HEIGHT: 18px" class="x-form-text x-form-field "  name="IdCode" id="idCode" autocomplete="off" _nodup="30808"  >
	                    </TD>
	                    <TD style="LINE-HEIGHT: 18px; WIDTH: 9px; VISIBILITY: visible" id=x-form-suffixLabel-ext-gen18 class=x-form-suffixLabel vAlign=top>
	                      <PRE><SPAN style="COLOR: red">*</SPAN></PRE>
	                    </TD>
	                    <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen18 class="x-form-suffixCls -suffixCls" vAlign=top>
	                      <SPAN>&nbsp;</SPAN>
	                    </TD>
	                    <TD class=x-form-clear-left vAlign=top>
	                    </TD>
	                  </TR>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	       </TR>
	       

	       <TR>
	          <TD class=x-table-layout-cell vAlign=top><!-- 机构名称-->
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >机构名称:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" style="WIDTH: 142px; HEIGHT: 18px" 
							<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdReadonly").equals("true")?"readOnly":""%>
							id="clientName" name="ClientName"  autocomplete="off" size="20" class=" x-form-text x-form-field <%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdReadonly").equals("true")?"ux-item-readOnly":""%>" >
						</td>
						<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="" class="x-form-suffixLabel"> 
							<pre><span style="color: red;">*</span></pre>
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          <TD class=x-table-layout-cell vAlign=top>
	            <DIV id="ClientClassDiv" style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                 <TR>
	                   <counter:combobox fieldLabel="客户组别" displayField="dictItemName" valueField="dictItemCode" fieldName ="ClientClass"  >
		               </counter:combobox>
		               <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen20 class="x-form-suffixCls -suffixCls" vAlign=top>
	                     <SPAN>&nbsp;</SPAN>
	                   </TD>
	                   <TD class=x-form-clear-left vAlign=top></TD>
	                 </TR>
	               </TBODY>
	             </TABLE>
	           </DIV>
	         </TD>
	       </TR>
	       <%if(ParamCache.getInstance().getSysParamValue("IsAddressSeparate", "0").equals("1")){ %>
	       <TR>
			   <TD class=x-table-layout-cell vAlign=top>
				    <DIV
						style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"
						class="x-form-item ">
					<TABLE style="WIDTH: 100%" border=0>
						<TBODY>
							<TR>
								<counter:combobox fieldLabel="国家" displayField="region_name" valueField="region_code"  fieldName="Nationality" allowBlank="false" selectEvent="onSelectItem : function(item){SelectAdrsta(item)}" >
		                        </counter:combobox>
								<TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden"
									id=x-form-suffixCls-ext-gen20
									class="x-form-suffixCls -suffixCls" vAlign=top><SPAN>&nbsp;</SPAN>
								</TD>
								<TD class=x-form-clear-left vAlign=top></TD>
							</TR>
						</TBODY>
					</TABLE>
					</DIV>
				</TD>
				<TD class=x-table-layout-cell vAlign=top>
				    <DIV
						style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"
						class="x-form-item ">
					<TABLE style="WIDTH: 100%" border=0>
						<TBODY>
							<TR>
		                        <counter:combobox fieldLabel="省" displayField="region_name" valueField="region_code" fieldName="Adrsta"  allowBlank="false" selectEvent="onSelectItem : function(item){SelectAdrcty(item)}" >
		                        </counter:combobox>
								<TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden"
									id=x-form-suffixCls-ext-gen20
									class="x-form-suffixCls -suffixCls" vAlign=top><SPAN>&nbsp;</SPAN>
								</TD>
								<TD class=x-form-clear-left vAlign=top></TD>
							</TR>
						</TBODY>
					</TABLE>
					</DIV>
				</TD>
				<TD class=x-table-layout-cell vAlign=top>
				    <DIV
						style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"
						class="x-form-item ">
					<TABLE style="WIDTH: 100%" border=0>
						<TBODY>
							<TR>
		                        <counter:combobox fieldLabel="市" displayField="region_name" valueField="region_code" fieldName="Adrcty"  allowBlank="false" selectEvent="onSelectItem : function(item){SelectAdrsec(item)}" >
                                </counter:combobox>
								<TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden"
									id=x-form-suffixCls-ext-gen20
									class="x-form-suffixCls -suffixCls" vAlign=top><SPAN>&nbsp;</SPAN>
								</TD>
								<TD class=x-form-clear-left vAlign=top></TD>
							</TR>
						</TBODY>
					</TABLE>
					</DIV>
				</TD>
		     </TR>
		     <TR>
					<TD class=x-table-layout-cell vAlign=top>
					<DIV
						style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"
						class="x-form-item ">
					<TABLE style="WIDTH: 100%" border=0>
						<TBODY>
							<TR>
								<counter:combobox fieldLabel="区" displayField="region_name" valueField="region_code" fieldName="Adrsec"  allowBlank="false" >
                                </counter:combobox>
								<TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden"
									id=x-form-suffixCls-ext-gen20
									class="x-form-suffixCls -suffixCls" vAlign=top><SPAN>&nbsp;</SPAN>
								</TD>
								<TD class=x-form-clear-left vAlign=top></TD>
							</TR>
						</TBODY>
					</TABLE>
					</DIV>
					</TD>
					<TD class=x-table-layout-cell vAlign=top>
					<DIV
						style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"
						class="x-form-item ">
					<TABLE style="WIDTH: 100%" border=0>
						<TBODY>
							<tr>
								<td valign="top" class="x-form-label-firsttd x-ellipsis"
									style="width: 100px; overflow: hidden;"><label
									class="x-form-item-label"
									style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;">详细地址:</label>
								</td>
								<td valign="top"
									style="padding-left: 0px; height: 100%; width: 145px;"
									class="x-form-element" id="x-form-el-ext-gen18"><input
									type="text" name="Address" autocomplete="off" size="20"
									class=" x-form-text x-form-field"
									style="width: 142px; height: 18px;"></td>
								<td valign="top"
									style="width: 7px; visibility: visible; line-height: 18px;"
									id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel">
								<pre><span style="color: red;">*</span></pre></td>
								<td valign="top" style="visibility: hidden; line-height: 18px;"
									id="x-form-suffixCls-ext-gen18"
									class="x-form-suffixCls -suffixCls"><span class="">&nbsp;</span>
								</td>
								<td valign="top" class="x-form-clear-left"></td>
							</tr>
						</TBODY>
					</TABLE>
					</DIV>
					</TD>
					<TD>
					</TD>
		   </TR>
		   <%}%>
	       <TR>
	         <%if(ParamCache.getInstance().getSysParamValue("IsAddressSeparate", "0").equals("0")){ %>
			 <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >通讯地址:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input 
							type="text" name="Address"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
						<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          <%}%>
	          <TD id="tdPostCode" class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >邮政编码:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="PostCode"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
						<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          
	          
	          <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >电话号码:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="Tel"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          
	       </TR>
	       <tr>	  
	          
	          <TD id="tdFax" class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >传真号码:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="Fax"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >手机号码:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="Mobile"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
						<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          
	          <TD id="tdEmail" class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >EMAIL地址:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="Email"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	       </tr>  
	       
	       
	       <TR>
			  <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <TR>
	                    <counter:combobox fieldLabel="法人代表证件类型" displayField="dictItemName" valueField="dictItemCode" fieldName ="ReprIdType" selectEvent="onSelectItem:function(item){ReprIdTypeSelectEvent(item); }" allowBlank = "false">
			            </counter:combobox>
			            <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen17 class="x-form-suffixCls -suffixCls" vAlign=top>
	                      <SPAN>&nbsp;</SPAN>
	                    </TD>
	                    <TD class=x-form-clear-left vAlign=top>
	                    </TD>
	                  </TR>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          
	          <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >法人代表证件号码:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="ReprIdCode"  autocomplete="off" size="20" <%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("ReprIdReadonly").equals("true")?"readOnly":""%>
							 class=" x-form-text x-form-field <%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("ReprIdReadonly").equals("true")?"ux-item-readOnly":""%>"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
							<pre><span style="color: red;">*</span></pre>
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          
	          <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >法人代表名称:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="ReprName"  autocomplete="off" size="20" <%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("ReprIdReadonly").equals("true")?"readOnly":""%>  class=" x-form-text x-form-field <%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("ReprIdReadonly").equals("true")?"ux-item-readOnly":""%>"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
							<pre><span style="color: red;">*</span></pre>
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	       </TR>
	       
	       <!-- V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299 beg -->
	       <%if(IDict.K_YORN.YORN_YES.equals(ParamCache.getInstance().getSysParamValue("APPROP_MANAGEMENT", IDict.K_YORN.YORN_NO))
	    		   && SysConfigUtil.getSysConfig().getValue("AppropManageAddition","value", "0").equals("1")){ %>
	       <TR>
		       <TD class=x-table-layout-cell vAlign=top>
		            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
		              <TABLE style="WIDTH: 100%" border=0>
		                <TBODY>
		                 <TR>
		                   <counter:combobox fieldLabel="法人代表性别" displayField="dictItemName" valueField="dictItemCode" fieldName ="ReprSex"  allowBlank="false">
			               </counter:combobox>
			               <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen20 class="x-form-suffixCls -suffixCls" vAlign=top>
		                     <SPAN>&nbsp;</SPAN>
		                   </TD>
		                   <TD class=x-form-clear-left vAlign=top></TD>
		                 </TR>
		               </TBODY>
		             </TABLE>
		           </DIV>
		         </TD>
	          <TD class=x-table-layout-cell vAlign=top><!-- 职务必输-->
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                 <TR>
	                   <counter:combobox fieldLabel="法人代表职务" displayField="dictItemName" valueField="dictItemCode" fieldName ="ReprPosition" allowBlank="false" >
		               </counter:combobox>
		               <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen20 class="x-form-suffixCls -suffixCls" vAlign=top>
	                     <SPAN>&nbsp;</SPAN>
	                   </TD>
	                   <TD class=x-form-clear-left vAlign=top></TD>
	                 </TR>
	               </TBODY>
	             </TABLE>
	           </DIV>
	         </TD>
	         </TR>
	         <TR>
	       	  <td class="x-table-layout-cell" valign="top">
					<div id="ACTORBIRTHDAYDiv" class="x-form-item " 
						style="width: 100%; outline: 0px none;">
					<table style="width: 100%;" border="0">
						<tbody>
							<tr>
								<counter:datefield  fieldLabel="法人代表出生日期" fieldName="ReprBirthday"  allowBlank="false" ></counter:datefield>
							</tr>
						</tbody>
					</table>
					</div>
			  </td>
			  <TD class=x-table-layout-cell vAlign=top><!-- 年龄-->
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >法人代表年龄:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" id="reprAge" name="ReprAge"  autocomplete="off" size="20" class=" x-form-text x-form-field ux-item-readOnly " style="width: 142px; height: 18px;" readonly="readonly" >
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
						<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	         </TR>
	         <TR>
		         <TD class=x-table-layout-cell vAlign=top>
		            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
		              <TABLE style="WIDTH: 100%" border=0>
		                <TBODY>
		                  <tr>
							<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
								<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >法人代表电子邮箱:</label>
							</td>
							<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
								<input type="text" name="ReprEmail"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
							</td>
							<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
								<pre><span style="color: red;">*</span></pre>
							</td>
							<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
								<span class="">&nbsp;</span>
							</td>
							<td valign="top" class="x-form-clear-left">
							</td>
						  </tr>
		                </TBODY>
		              </TABLE>
		            </DIV>
		          </TD>
		          <td class="x-table-layout-cell" valign="top">
					<div id="ext-gen103" class="x-form-item " 
						style="width: 100%; outline: 0px none;">
					<table style="width: 100%;" border="0">
						<tbody>
							<tr>
								<counter:datefield fieldLabel="法人代表证件有效期" fieldName="ReprDocuValid" allowBlank="false"></counter:datefield>
							</tr>
						</tbody>
					</table>
					</div>
				</td>
				<TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >法人代表座机:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="ReprTel"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
							<pre><span style="color: red;">*</span></pre>
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	         </TR>
	         <TR>
	         	<TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >法人代表移动电话:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="ReprMobile"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
							<pre><span style="color: red;">*</span></pre>
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
						<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >法人代表办公邮编:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="ReprPostCode"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
							<pre><span style="color: red;">*</span></pre>
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
						<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
	                  <td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
								<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >法人代表办公地址:</label>
							</td>
							<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
								<input 
								type="text" name="ReprWorkAddr"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
							</td>
							<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
								<pre><span style="color: red;">*</span></pre>
							</td>
							<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
							</td>
							<td valign="top" class="x-form-clear-left">
							</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	         </TR>
	         <%}%>
	         <!-- V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299 end -->
	       
	       <TR>
			  <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <TR>
	                  <!-- V3.0.0.55   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617 beg -->
	                  <%if("1".equals(linkInfo)){ %>
	                    <counter:combobox fieldLabel="代理人证件类型" displayField="dictItemName" valueField="dictItemCode" fieldName ="ActorIdType" selectEvent="onSelectItem:function(item){ActorIdTypeSelectEvent(item); }"  allowBlank = "true">
			            </counter:combobox>
			          <% }else{%>
			            <counter:combobox fieldLabel="经办人证件类型" displayField="dictItemName" valueField="dictItemCode" fieldName ="ActorIdType" selectEvent="onSelectItem:function(item){ActorIdTypeSelectEvent(item); }"  allowBlank = "true">
			            </counter:combobox>
			           <%} %>
			          <!-- V3.0.0.55   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617 beg -->
			            <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen17 class="x-form-suffixCls -suffixCls" vAlign=top>
	                      <SPAN>&nbsp;</SPAN>
	                    </TD>
	                    <TD class=x-form-clear-left vAlign=top>
	                    </TD>
	                  </TR>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          
	          <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<!-- V3.0.0.55   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617 beg -->
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" ><%if("1".equals(linkInfo)){ %>代理人<%}else{ %>经办人<%} %>证件号码:</label>
							<!-- V3.0.0.55   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617 end -->
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="ActorIdCode"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          
	          <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<!-- V3.0.0.55   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617 beg -->
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" ><%if("1".equals(linkInfo)){ %>代理人<%}else{ %>经办人<%} %>名称:</label>
							<!-- V3.0.0.55   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617 end -->
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="ActorName"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	       </TR>
	       
	       <!-- V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299 beg -->
	       <%if(IDict.K_YORN.YORN_YES.equals(ParamCache.getInstance().getSysParamValue("APPROP_MANAGEMENT", IDict.K_YORN.YORN_NO))
	    		   && SysConfigUtil.getSysConfig().getValue("AppropManageAddition","value", "0").equals("1")
	    		   && !"1".equals(linkInfo)){ %>
	       		<TR>
		       <TD class=x-table-layout-cell vAlign=top>
		            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
		              <TABLE style="WIDTH: 100%" border=0>
		                <TBODY>
		                 <TR>
		                   <counter:combobox fieldLabel="经办人性别" displayField="dictItemName" valueField="dictItemCode" fieldName ="ActorSex"  allowBlank="false">
			               </counter:combobox>
			               <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen20 class="x-form-suffixCls -suffixCls" vAlign=top>
		                     <SPAN>&nbsp;</SPAN>
		                   </TD>
		                   <TD class=x-form-clear-left vAlign=top></TD>
		                 </TR>
		               </TBODY>
		             </TABLE>
		           </DIV>
		         </TD>
	          <TD class=x-table-layout-cell vAlign=top><!-- 职务必输-->
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                 <TR>
	                   <counter:combobox fieldLabel="经办人职务" displayField="dictItemName" valueField="dictItemCode" fieldName ="ActorPosition" allowBlank="false" >
		               </counter:combobox>
		               <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen20 class="x-form-suffixCls -suffixCls" vAlign=top>
	                     <SPAN>&nbsp;</SPAN>
	                   </TD>
	                   <TD class=x-form-clear-left vAlign=top></TD>
	                 </TR>
	               </TBODY>
	             </TABLE>
	           </DIV>
	         </TD>
	         </TR>
	         <TR>
		         <td class="x-table-layout-cell" valign="top">
						<div id="ACTORBIRTHDAYDiv" class="x-form-item " 
							style="width: 100%; outline: 0px none;">
						<table style="width: 100%;" border="0">
							<tbody>
								<tr>
									<counter:datefield  fieldLabel="经办人出生日期" fieldName="ActorBirthday"  allowBlank="false"></counter:datefield>
								</tr>
							</tbody>
						</table>
						</div>
				  </td>
				  <TD class=x-table-layout-cell vAlign=top><!-- 年龄-->
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >经办人年龄:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" id="actorAge" name="ActorAge"  autocomplete="off" size="20" class=" x-form-text x-form-field ux-item-readOnly " style="width: 142px; height: 18px;" readonly="readonly" >
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
						<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	         </TR>
	         <TR>
		         <TD class=x-table-layout-cell vAlign=top>
		            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
		              <TABLE style="WIDTH: 100%" border=0>
		                <TBODY>
		                  <tr>
							<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
								<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >经办人电子邮箱:</label>
							</td>
							<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
								<input type="text" name="ActorEmail"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
							</td>
							<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
								<pre><span style="color: red;">*</span></pre>
							</td>
							<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
								<span class="">&nbsp;</span>
							</td>
							<td valign="top" class="x-form-clear-left">
							</td>
						  </tr>
		                </TBODY>
		              </TABLE>
		            </DIV>
		          </TD>
		          <td class="x-table-layout-cell" valign="top">
					<div id="ext-gen103" class="x-form-item " 
						style="width: 100%; outline: 0px none;">
					<table style="width: 100%;" border="0">
						<tbody>
							<tr>
								<counter:datefield fieldLabel="经办人证件有效期" fieldName="ActorDocuValid" allowBlank="false"></counter:datefield>
							</tr>
						</tbody>
					</table>
					</div>
				</td>
				<TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >经办人座机:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="ActorTel"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
							<pre><span style="color: red;">*</span></pre>
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	         </TR>
	         <TR>
	         	<TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >经办人移动电话:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="ActorMobile"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
							<pre><span style="color: red;">*</span></pre>
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
						<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >经办人办公邮编:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="ActorPostCode"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
							<pre><span style="color: red;">*</span></pre>
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
						<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
	                  <td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
								<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >经办人办公地址:</label>
							</td>
							<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
								<input 
								type="text" name="ActorWorkAddr"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
							</td>
							<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
								<pre><span style="color: red;">*</span></pre>
							</td>
							<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
							</td>
							<td valign="top" class="x-form-clear-left">
							</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	         </TR>
	         <TR>
		         <TD class=x-table-layout-cell vAlign=top>
		            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
		              <TABLE style="WIDTH: 100%" border=0>
		                <TBODY>
		                  <tr>
		                  <td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
									<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >经办人与该机构关系:</label>
								</td>
								<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
									<input 
									type="text" name="ActorAndInstRe"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
								</td>
								<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
									<pre><span style="color: red;">*</span></pre>
								</td>
								<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
								<span class="">&nbsp;</span>
								</td>
								<td valign="top" class="x-form-clear-left">
								</td>
						  </tr>
		                </TBODY>
		              </TABLE>
		            </DIV>
		          </TD>
	         </TR>
	       <%} %>
	       <!-- V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299 end -->
	       
	       
	       <TR id="trLinkman">
			  <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <TR>
	                    <counter:combobox fieldLabel="联系人证件类型" displayField="dictItemName" valueField="dictItemCode" fieldName ="LinkIdType" selectEvent="onSelectItem:function(item){LinkIdTypeSelectEvent(item); }"  allowBlank = "true">
			            </counter:combobox>
			            <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen17 class="x-form-suffixCls -suffixCls" vAlign=top>
	                      <SPAN>&nbsp;</SPAN>
	                    </TD>
	                    <TD class=x-form-clear-left vAlign=top>
	                    </TD>
	                  </TR>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          
	          <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >联系人证件号码:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="LinkIdCode"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          
	          <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >联系人名称:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="LinkName"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	       </TR>

	       <!-- 客户风险等级 -->
	       		<TD class=x-table-layout-cell vAlign=top>
	            <DIV id="RiskLevelNameDiv" style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%; display: none;"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%;" border=0 >
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >客户风险等级:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" >
							<input type="text" id="RiskLevelName" name="RiskLevelName" readonly="readonly" autocomplete="off" size="20" class=" x-form-text x-form-field ux-item-readOnly"  style="width: 142px; height: 18px;" value="5"/>
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;"  class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          	</TD>

	       <!-- 客户风险有效日期 -->
	       		<TD class=x-table-layout-cell vAlign=top>
	            <DIV id="riskDateDiv" style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%; display: none;"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%;" border=0 >
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >风险等级有效截止日期:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" >
							<input value="2100-01-01" type="text" id="riskDate" name="RiskDate" readonly="readonly" autocomplete="off" size="20" class=" x-form-text x-form-field ux-item-readOnly"  style="width: 142px; height: 18px;"/>
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;"  class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          	</TD>
	          	</TD>
	          <!-- 客户经理 -->
              <TD class=x-table-layout-cell vAlign=top>
                <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
                  <TABLE style="WIDTH: 100%" border=0>
                    <TBODY>
                    <%if(clientManagerMode.equals("0")){%>
                      <tr>
                        <td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
                            <label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >客户经理编号:</label>
                        </td>
                        <td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
                            <input 
                            type="text" name="ClientManager"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
                        </td>
                        <td valign="top" style="width: 7px; visibility: visible; line-height: 18px;"  class="x-form-suffixLabel"> 
                            <pre><span style="color: red;">*</span></pre>
                        </td>
                        <% if(!SysConfigUtil.getSysConfig("ConstantConfig").getValue("IsSignClientManagerAllowBlank").equals("true")){ %>
                          <%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("IsOrgSignClientManagerAllowBlank","value","false").equals("false")){ %>
                            <td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
                            <pre><span style="color: red;">*</span></pre>
                            </td>
                          <%} %>
                        <%} %>
                        <td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
                            <span class="">&nbsp;</span>
                        </td>
                        <td valign="top" class="x-form-clear-left">
                        </td>
                      </tr>
                     <%}else{ %>
                        <tr id='multiClientManager'>
                            <counter:targetselect fieldLabel="多客户经理" fieldName="MultiClientManager" clickEvent="multiClientManager_click">
                            </counter:targetselect>                                     
                        </tr>
                     <%} %>
                    </TBODY>
                  </TABLE>
                </DIV>
              </TD>
	       </TR>

	     
	     <!-- V3.0.0.68   20170524-01     wangyj      证券期货投资者适当性管理办法 M201705230053 beg -->
	     <%if(IDict.K_YORN.YORN_YES.equals(ParamCache.getInstance().getSysParamValue("APPROP_MANAGEMENT", IDict.K_YORN.YORN_NO))
	    		 && SysConfigUtil.getSysConfig().getValue("AppropManageAddition","value", "0").equals("1")){ %>
	        	 <tr>
	        	 <%if((SysConfigUtil.getSysConfig("ConstantConfig").getValue("isShowInvestorInfo","value","true").equals("true"))){ %>
		       		<td class="x-table-layout-cell" valign="top">
						<div class="x-form-item " 
							style="width: 100%; outline: 0px none;">
						<table style="width: 100%;" border="0" id ="table-investortypename">
							<tbody>
								<tr>
								<counter:targetselect allowBlank="true" fieldLabel="投资者类型" fieldName="InvestorTypeName" clickEvent="InvestorTypeName_click"></counter:targetselect>
								</tr>
							</tbody>
						</table>
						</div>
					</td>
					<TD class=x-table-layout-cell vAlign=top>
	            <DIV id="investorDateDiv" style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100% "  class="x-form-item " >
	              <TABLE style="WIDTH: 100%;" border=0 >
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >投资类型有效截止日期:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" >
							<input type="text" id="investorDateName" name="InvestorDateName" readonly="readonly" autocomplete="off" size="20" class=" x-form-text x-form-field ux-item-readOnly"  style="width: 142px; height: 18px;"/>
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;"  class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          	</TD>
	          	<%}%>
	          	 <TD class=x-table-layout-cell vAlign=top>
	            <DIV id="busiScopeDiv" style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                 <TR  id="busiscope">
	                   <counter:combobox fieldLabel="经营范围" allowBlank="true" displayField="dictItemName" valueField="dictItemCode" fieldName ="BusiScope"  >
		               </counter:combobox>
		               <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen20 class="x-form-suffixCls -suffixCls" vAlign=top>
	                     <SPAN>&nbsp;</SPAN>
	                   </TD>
	                   <TD class=x-form-clear-left vAlign=top></TD>
	                 </TR>
	               </TBODY>
	             </TABLE>
	           </DIV>
	         </TD>
		       </tr>
		       <TR>
		       	 <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >注册地址:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input 
							type="text" name="RegAddress"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
							<pre><%if(!SysConfigUtil.getSysConfig("ConstantConfig").getValue("isRegAddressAllowBlank").equalsIgnoreCase("true")){%><SPAN style="COLOR: red">*</SPAN><%}%></pre>
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
						<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >办公地址:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input 
							type="text" name="OfficeAddress"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
							<pre><%if(!SysConfigUtil.getSysConfig("ConstantConfig").getValue("isOfficeAddressAllowBlank").equalsIgnoreCase("true")){%><SPAN style="COLOR: red">*</SPAN><%}%></pre>
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
						<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	           <TD class=x-table-layout-cell vAlign=top>
	            <DIV id="instAttrDiv" style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                 <TR id="instattr">
	                   <counter:combobox allowBlank="true" fieldLabel="性质" displayField="dictItemName" valueField="dictItemCode" fieldName ="InstAttr"  >
		               </counter:combobox>
		               <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen20 class="x-form-suffixCls -suffixCls" vAlign=top>
	                     <SPAN>&nbsp;</SPAN>
	                   </TD>
	                   <TD class=x-form-clear-left vAlign=top></TD>
	                 </TR>
	               </TBODY>
	             </TABLE>
	           </DIV>
	         </TD>
		       </TR>
		       <TR>
		       	<TD class=x-table-layout-cell vAlign=top>
	            <DIV id="QualificationTypeDiv" style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <TR>
	                    <counter:combobox fieldLabel="资格证书类型" displayField="dictItemName" valueField="dictItemCode" fieldName ="QualificationType"  allowBlank = "true">
			            </counter:combobox>
			            <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen17 class="x-form-suffixCls -suffixCls" vAlign=top>
	                      <SPAN>&nbsp;</SPAN>
	                    </TD>
	                    <TD class=x-form-clear-left vAlign=top>
	                    </TD>
	                  </TR>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          
		       	<TD class=x-table-layout-cell vAlign=top>
	            <DIV id="QualificationCodeDiv"  style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >资格证书号码:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="QualificationCode"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          <%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("isShowQualifyCodeDate").equals("true")){ %>
	          <td class="x-table-layout-cell" valign="top">
					<div id="ext-gen103" class="x-form-item " 
						style="width: 100%; outline: 0px none;">
					<table style="width: 100%;" border="0">
						<tbody>
							<tr>
								<counter:datefield fieldLabel="资格证书有效期" fieldName="QualifyCodeDate" allowBlank="true"></counter:datefield>
							</tr>
						</tbody>
					</table>
					</div>
				</td>
				<%}%>
		    </TR>
		       <TR>
		       	<TD class=x-table-layout-cell vAlign=top>
	            <DIV id="BenefIdTypeDiv" style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <TR>
	                    <counter:combobox fieldLabel="实际受益人证件类型" displayField="dictItemName" valueField="dictItemCode" fieldName ="BenefIdType"  allowBlank = "true">
			            </counter:combobox>
			            <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen17 class="x-form-suffixCls -suffixCls" vAlign=top>
	                      <SPAN>&nbsp;</SPAN>
	                    </TD>
	                    <TD class=x-form-clear-left vAlign=top>
	                    </TD>
	                  </TR>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
		       	<TD class=x-table-layout-cell vAlign=top>
	            <DIV id="BenefIdCodeDiv"  style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >实际受益人证件号码:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="BenefIdCode"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          
	          <TD class=x-table-layout-cell vAlign=top>
	            <DIV id="BenefNameDiv" style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >实际受益人名称:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="BenefName"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
		    </TR>
		     <TR>
		       	<TD class=x-table-layout-cell vAlign=top>
	            <DIV id="ControllerIdTypeDiv" style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <TR>
	                    <counter:combobox fieldLabel="实际控制人证件类型" displayField="dictItemName" valueField="dictItemCode" fieldName ="ControllerIdType"  allowBlank = "true">
			            </counter:combobox>
			            <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen17 class="x-form-suffixCls -suffixCls" vAlign=top>
	                      <SPAN>&nbsp;</SPAN>
	                    </TD>
	                    <TD class=x-form-clear-left vAlign=top>
	                    </TD>
	                  </TR>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
		       	<TD class=x-table-layout-cell vAlign=top>
	            <DIV id="ControllerIdCodeDiv"  style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >实际控制人证件号码:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="ControllerIdCode"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          
	          <TD class=x-table-layout-cell vAlign=top>
	            <DIV id="ControllerNameDiv" style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >实际控制人名称:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="ControllerName"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
		    </TR>
		    <!-- V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299 beg -->
		    <TR>
		    	<TD class=x-table-layout-cell vAlign=top>
	            <DIV id="ShareHolderDiv" style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >控股股东或实际控制人:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="ShareHolder"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
							<pre><span style="color: red;">*</span></pre>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          <TD class=x-table-layout-cell vAlign=top>
					<DIV
						style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"
						id=ext-gen95 class="x-form-item " >
					<TABLE style="WIDTH: 100%" border=0>
						<TBODY>
							<TR>
								<counter:numberField fieldLabel="注册资本" fieldName="RegistCapital"
									decimalPrecision="2" allowBlank="false"></counter:numberField>
							</TR>
						</TBODY>
					</TABLE>
					</DIV>
					</TD>
		    </TR>
		    <TR>
	          <TD class=x-table-layout-cell vAlign=top><!-- 是否存在实际控制关系必输-->
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                 <TR>
	                   <counter:combobox fieldLabel="是否存在实际控制关系" displayField="dictItemName" valueField="dictItemCode" fieldName ="IsControl" allowBlank="false" defaultValue="0">
		               </counter:combobox>
		               <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen20 class="x-form-suffixCls -suffixCls" vAlign=top>
	                     <SPAN>&nbsp;</SPAN>
	                   </TD>
	                   <TD class=x-form-clear-left vAlign=top></TD>
	                 </TR>
	               </TBODY>
	             </TABLE>
	           </DIV>
	         </TD>
	         <TD class=x-table-layout-cell vAlign=top>
	            <DIV id="ControlExplainDiv" style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >实际控制关系说明:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="ControlExplain"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          <TD class=x-table-layout-cell vAlign=top><!-- 交易的实际受益人 -->
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                 <TR>
	                   <counter:combobox fieldLabel="交易的实际受益人 " displayField="dictItemName" valueField="dictItemCode" fieldName ="IsBenefit" allowBlank="false" defaultValue="0">
		               </counter:combobox>
		               <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen20 class="x-form-suffixCls -suffixCls" vAlign=top>
	                     <SPAN>&nbsp;</SPAN>
	                   </TD>
	                   <TD class=x-form-clear-left vAlign=top></TD>
	                 </TR>
	               </TBODY>
	             </TABLE>
	           </DIV>
	         </TD>
	         </TR>
	         <TR>
	         	<TD class=x-table-layout-cell vAlign=top>
	            <DIV id="BenefitExplainDiv" style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >交易的实际收益人说明:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="BenefitExplain"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	          <TD class=x-table-layout-cell vAlign=top><!-- 是否有不良诚信记录-->
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                 <TR>
	                   <counter:combobox fieldLabel="是否有不良诚信记录" displayField="dictItemName" valueField="dictItemCode" fieldName ="IsBadRecord" allowBlank="false" defaultValue="0">
		               </counter:combobox>
		               <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen20 class="x-form-suffixCls -suffixCls" vAlign=top>
	                     <SPAN>&nbsp;</SPAN>
	                   </TD>
	                   <TD class=x-form-clear-left vAlign=top></TD>
	                 </TR>
	               </TBODY>
	             </TABLE>
	           </DIV>
	         </TD>
	         <TD class=x-table-layout-cell vAlign=top>
	            <DIV id="BadRecordExplainDiv" style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >是否有不良诚信记录说明:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="BadRecordExplain"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
							<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	         </TR>
		    <!-- V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299 end -->
	        <%}%>
	     <!-- V3.0.0.68   20170524-01     wangyj      证券期货投资者适当性管理办法 M201705230053 end -->
	      <!--  V3.0.0.2   20230313-01     shijj       支持分业务签约  	T202303094908  beg -->
<%--       <tr>
	       <td class=x-table-layout-cell vAlign=top>
	            <div style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <table style="WIDTH: 100%; display: none;"  border='0'  id="table-channelableflag">
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 233px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >开通购买四级以上的理财产品在柜台以外渠道进行:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x1-form-el-ext-gen18">
							<input type="checkbox" id="ChannelAbleFlag" name="ChannelAbleFlag" autocomplete="off" size="20"  class=" x-form-text x-form-field"  style="width: 18px; height: 18px;"></input>
						</td>
						<td valign="top" style="width: 7px; visibility: visible; line-height: 18px;" id="x-1form-suffixLabel-ext-gen18" class="x-form-suffixLabel"> 
						 
						</td>
						<td valign="top" style="visibility: hidden; line-height: 18px;" id="x-fo1rm-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
						<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </table>
	            </div>
	          	</td>
	       </tr> --%>	
	         <!--  V3.0.0.2   20230313-01     shijj       支持分业务签约  	T202303094908  end --> 
	       <!-- add by  zhangww     平顶山银行显示机构客户子类型  beg-->
			  <%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("ShowSubOrgClientType").equals("true")){ %>  
			  	<TR>
				  	<TD class=x-table-layout-cell vAlign=top><!-- 机构客户子类型 -->
			            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
			              <TABLE style="WIDTH: 100%" border=0>
			                <TBODY>
			                  <TR>
			                    <counter:combobox fieldLabel="机构子类型" displayField="dictItemName" valueField="dictItemCode" fieldName ="SubOrgClientType"   >
					            </counter:combobox>
					            <TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen17 class="x-form-suffixCls -suffixCls" vAlign=top>
			                      <SPAN>&nbsp;</SPAN>
			                    </TD>
			                    <TD class=x-form-clear-left vAlign=top>
			                    </TD>
			                  </TR>
			                </TBODY>
			              </TABLE>
			            </DIV>
			          </TD>
		          </TR>
			  <%} %>  
			<!-- add by  zhangww     平顶山银行显示机构客户子类型  end-->   
	           <tr>
	           <TD class=x-table-layout-cell vAlign=top colSpan=2 >
	             <DIV  style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%;display:none" id="table-PrdTypes" border=0>
	               <TBODY>
	                <TR>
	                 <TD style="WIDTH: 105px" class="x-form-label-firsttd x-ellipsis" vAlign=top>
	                   <LABEL style="TEXT-ALIGN: left; WIDTH: 105px; WORD-WRAP: break-word; WHITE-SPACE: normal; OVERFLOW: hidden" class=x-form-item-label >业务类型:</LABEL>
	                 </TD>
	                 <TD style="PADDING-LEFT: 0px; WIDTH: 406px; HEIGHT: 100%" id=x-form-el-ext-gen22 class=x-form-element vAlign=top>
	                   <input id="prdTypes" type=hidden name="PrdTypes">
	                   <DIV style="WIDTH: 406px; HEIGHT: 36px; OVERFLOW: auto"  class="x-border x-form-field" >
	                    <DIV id=ext-comp-1002 >
	                     <TABLE style="TABLE-LAYOUT: fixed" class=x-fullsize border=0 cellSpacing=4 cellPadding=0>
	                       <TBODY>
	                        <TR>
	                        <%if(SysConfigUtil.getSysConfig().getValue("PrdTypesSingle").equals("true")){%>
	                        	<counter:radiogroup dictKey="K_CPLX" fieldName="DisplayPrdTypes" width="20" >
					          	</counter:radiogroup>
	                        <%} else {%>
	                        	<counter:checkboxgroup dictKey="K_CPLX" fieldName="DisplayPrdTypes" width="20" >
					          	</counter:checkboxgroup>
	                        <%}%>
						  </TR>
						 </TBODY>
						</TABLE>
					   </DIV>
					  </DIV>
					 </TD>
					 <TD style="LINE-HEIGHT: 36px; WIDTH: 0px; VISIBILITY: hidden" id=x-form-suffixLabel-ext-gen22 class=x-form-suffixLabel vAlign=top>
					  <PRE></PRE>
					 </TD>
					 <TD style="LINE-HEIGHT: 36px; VISIBILITY: hidden" id=x-form-suffixCls-ext-gen22 class="x-form-suffixCls -suffixCls" vAlign=top>
					  <SPAN>&nbsp;</SPAN>
					 </TD>
					 <TD class=x-form-clear-left vAlign=top></TD>
					 </TR>
					</TBODY>
				  </TABLE>
				 </DIV>
				</TD>
	           </tr>
	            <!--V3.0.0.35 add by chenling 20140811  增加推荐人  -->
	            
	          <TR>
	           <%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("isShowRecommender").equals("true")){ %>
	       	  <TD class=x-table-layout-cell vAlign=top>
	            <DIV style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"  class="x-form-item " >
	              <TABLE style="WIDTH: 100%" border=0>
	                <TBODY>
	                  <tr>
						<td valign="top" class="x-form-label-firsttd x-ellipsis" style="width: 100px; overflow: hidden;">
							<label class="x-form-item-label" style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;" >推荐人编号:</label>
						</td>
						<td valign="top" style="padding-left: 0px; height: 100%; width: 145px;" class="x-form-element" id="x-form-el-ext-gen18">
							<input type="text" name="Recommender"  autocomplete="off" size="20" class=" x-form-text x-form-field"  style="width: 142px; height: 18px;">
						</td>
						<td valign="top" style="line-height: 18px;" id="x-form-suffixCls-ext-gen18" class="x-form-suffixCls -suffixCls">
						<!-- V3.0.0.67   20170426-01     zhouyao     营口银行配置推荐人工号必输 M201704141365 beg -->
						<%if (SysConfigUtil.getSysConfig("ConstantConfig").getValue("ISRecommenderAllowBlank").equals("false")
								&&SysConfigUtil.getSysConfig("ConstantConfig").getValue("ISRecommenderAllowBlank","transcode").contains("100001")) {%>
						<SPAN style="COLOR: red">*</SPAN>
						<%}%>
						<!-- V3.0.0.67   20170426-01     zhouyao     营口银行配置推荐人工号必输 M201704141365 end -->
						<span class="">&nbsp;</span>
						</td>
						<td valign="top" class="x-form-clear-left">
						</td>
					  </tr>
	                </TBODY>
	              </TABLE>
	            </DIV>
	          </TD>
	           <% }%> 
	          <%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("ShowRecommenderName").equals("true")){ %>
					 <td class="x-table-layout-cell" valign="top">
					<div id="ext-gen96" class="x-form-item "
						style="width: 100%; outline: 0px none;">
					<table style="width: 100%;" border="0">
						<tbody>
							<tr>
								<td style="width: 100px; overflow: hidden;"
									class="x-form-label-firsttd x-ellipsis" valign="top"><label
									for="ext-gen29"
									style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;"
									class="x-form-item-label">推荐人名称:</label></td>
								<td id="x-form-el-ext-gen29" class="x-form-element"
									style="padding-left: 0px; height: 100%; width: 145px;"
									valign="top"><input style="width: 142px; height: 18px;"
									size="20" autocomplete="off" id="ext-gen29" name="recommenderName"
									type="text"></td>
								<td class="x-form-suffixCls -suffixCls"
									id="x-form-suffixCls-ext-gen29"
									style="visibility:hidden; line-height: 18px;" valign="top"><span
									class="">&nbsp;</span></td>
								<td class="x-form-clear-left" valign="top"></td>
							</tr>
						</tbody>
					</table>
					</div>
					</td>
					<%} %>
					<!-- add by  huangjing     平顶山银行添加“推荐人编号”字段并反显推荐人名称 M201609281112  end-->
					<!-- add by  huangjing     平顶山银行反显客户经理名称 M201609270910  beg-->
					<%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("ShowManagerName").equals("true")){ %>
	           <td class="x-table-layout-cell" valign="top">
					<div id="ext-gen96" class="x-form-item "
						style="width: 100%; outline: 0px none;">
					<table style="width: 100%;" border="0">
						<tbody>
							<tr>
								<td style="width: 100px; overflow: hidden;"
									class="x-form-label-firsttd x-ellipsis" valign="top"><label
									style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;"
									class="x-form-item-label">客户经理名称:</label></td>
								<td id="x-form-el-ext-gen29" class="x-form-element"
									style="padding-left: 0px; height: 100%; width: 145px;"
									valign="top"><input style="width: 142px; height: 18px;"
									size="20" autocomplete="off" id="managerName"
									name="ManagerName" type="text"></td>
								<td class="x-form-suffixLabel" id="x-form-suffixLabel-ext-gen29"
									style="width: 0px; visibility: hidden; line-height: 18px;"
									valign="top"><pre></pre></td>
								<td class="x-form-suffixCls -suffixCls"
									id="x-form-suffixCls-ext-gen29"
									style="visibility: hidden; line-height: 18px;" valign="top"><span
									class="">&nbsp;</span></td>
								<td class="x-form-clear-left" valign="top"></td>
							</tr>
						</tbody>
					</table>
					</div>
					</td>
					<%} %>
					<!-- add by  huangjing     平顶山银行反显客户经理名称 M201609270910  end-->
	          </TR>
	          <!--  20170927-01     hutao       理财系统与报备系统对接修改 M201709251328 beg -->
	          <TR>
				<%if(ParamCache.getInstance().getSysParamValue(IParamConstant.SUPPORT_FIRS, "false").equals("true")){ %>
				<TD class=x-table-layout-cell vAlign=top><!-- 核心证件类型-->
				<DIV id="HostToFirIdTypeDiv"
					style="display:none; OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"
					class="x-form-item ">
				<TABLE style="WIDTH: 100%" border=0>
					<TBODY>
						<TR>
							<counter:combobox fieldLabel="核心证件类型" displayField="dictItemName"
								valueField="dictItemCode" fieldName="HostToFirIdType" selectEvent="onSelectItem:function(item){HostToFirIdTypeSelectEvent(item); }" 
								allowBlank="false">
							</counter:combobox>
							<TD style="LINE-HEIGHT: 18px; VISIBILITY: hidden"
								id=x-form-suffixCls-ext-gen20
								class="x-form-suffixCls -suffixCls" vAlign=top><SPAN>&nbsp;</SPAN>
							</TD>
							<TD class=x-form-clear-left vAlign=top></TD>
						</TR>
					</TBODY>
				</TABLE>
				</DIV>
				</TD>										
				<TD class=x-table-layout-cell vAlign=top>
					<DIV id="OtherIdTypeNameDiv"
						style="display: none;OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%"
						class="x-form-item ">						
					<TABLE style="WIDTH: 100%" border=0>
						<TBODY>
							<tr>
								<td valign="top" class="x-form-label-firsttd x-ellipsis"
									style="width: 100px; overflow: hidden;"><label
									class="x-form-item-label"
									style="width: 105px; text-align: left; overflow: hidden; white-space: normal; word-wrap: break-word;">其它证件类型名称:</label>
								</td>
								<td valign="top"
									style="padding-left: 0px; height: 100%; width: 145px;"
									class="x-form-element" id="x-form-el-ext-gen18"><input
									type="text" name="OtherIdTypeName" autocomplete="off" size="20"
									class=" x-form-text x-form-field"
									style="width: 142px; height: 18px;"></td>
								<td valign="top" style="visibility: visible; line-height: 18px;"
									id="x-form-suffixCls-ext-gen18"
									class="x-form-suffixCls -suffixCls"><span style="color:red">*</span>
								</td>
								<td valign="top" class="x-form-clear-left"></td>
							</tr>
						</TBODY>
					</TABLE>
					</DIV>
				</TD>
				<%} %>
			  </TR>
			  <!--  20170927-01     hutao       理财系统与报备系统对接修改 M201709251328 end -->
			  <!-- V3.0.0.2   20230313-01     shijj       支持分业务签约  	T202303094908  beg -->
			   <TR>
	          	<TD class=x-table-layout-cell vAlign=top colSpan=2 >
						<DIV id="prdClassesDiv" style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: 0px; WIDTH: 100%" class="x-form-item " >
						<TABLE style="WIDTH: 100%" border=0>
							<TBODY>
								<TR>
									<counter:combobox fieldLabel="基金子业务类型" displayField="dictItemName" 
										valueField="dictItemCode" fieldName="PrdClasses" allowBlank="false" >
									</counter:combobox>
								</TR>
							</TBODY>
						</TABLE>
						</DIV>
					</TD>
	          </TR>
	          <!-- V3.0.0.2   20230313-01     shijj       支持分业务签约  	T202303094908  end -->
	       <TR>
		       		<td>
		       			<input type="hidden" name = "resCode" value = "T100001_pb_orgs">
		       		</td>
		       		<td>
		       			<input type="hidden" name = "opCode" value = "T100001_pb_orgs_def">
		       		</td>
		       		
		       		<td>
		       			<input type="hidden" name = "PasswdFlag" value = "false">
		       		</td>
		       		
		       		<td>
		       			<input type="hidden" name = "track2" value = "">
		       		</td>
		       		<td>
		       			<input type="hidden" name = "track3" value = "">
		       		</td>
		       		<!--  V3.0.0.29   20140403-01     huangsy     华润银行ECIF签约时需要保存传过来的contactdId beg -->
			       	<td>
			       		<input type="hidden" id="ContactId" name = "ContactId" value = "">
			       	</td>
		       		<!--  V3.0.0.29   20140403-01     huangsy     华润银行ECIF签约时需要保存传过来的contactdId end -->
		       		<td  style="display: none;">
		       			<input type="hidden" id="returnClientType" name="ReturnClientType" value=""/>
		       		</td>
		       		<td>
		       			<input type="hidden" id="hostClientNo" name = "HostClientNo" value = "">
		       		</td>
		       		<td>
		       			<input type="hidden" id="hostIdType" name = "HostIdType" value = "">
		       		</td>
		       		<td>
		       			<input type="hidden" id="hostClientType" name = "HostClientType" value = "">
		       		</td>
		       		<%-- 
		       		<td>
                        <input type="hidden" id="PrdClasses" name = "PrdClasses" value = "0">
                    </td>--%>
		       		
		       		<td  style="display: none;"><input type="hidden" id="authOper" name="AuthOper" value=""/></td>
					<td  style="display: none;"><input type="hidden" id="authPwd" name="AuthPwd" value=""/></td>
					<td style="display: none;"><input value="100001" id="functionId" name="FunctionId" type="hidden"></td>
					<td style="display: none;"><input value="" id="LastScore" name="LastScore" type="hidden"></td>
					<td style="display: none;"><input type="hidden" id="cardType" name="CardType" value="" /></td>
		   </TR>
		   
	   </TBODY>
	 </TABLE>
    </counter:form>
    
    <counter:buttonGroup>
    	<counter:button id="mysubmit" img="images/bizframe/icons/submit.png" text="提交"></counter:button>
    	<counter:button id="myreset" img="images/bizframe/icons/reset.png" text="重置"></counter:button>
	</counter:buttonGroup>
</counter:panel>



<counter:Data>
	<counter:dict group="K_DGZJLX" target="IdType"/>
	<counter:dict group="K_KHSX" target="ClientClass"/>
	<counter:dict group="K_JGLX" target="InstType"/>
	<counter:dict group="K_DLRZJLX" target="ReprIdType"/>
	<counter:dict group="K_DLRZJLX" target="ActorIdType"/>
	<counter:dict group="K_DLRZJLX" target="LinkIdType"/>
	<counter:dict target="SKFS" group="K_SKFS"/>
	<counter:dict group="K_KHLBMX_O" target="ClientTypeDetail"/>
	<counter:dict group="K_JGKHZLX" target="SubOrgClientType"/>
	<!-- V3.0.0.60   20161108-01     zhouyao	          成都银行增加国家省市区联动下拉框  M201610130987 beg -->
   	<%if(ParamCache.getInstance().getSysParamValue("IsAddressSeparate", "0").equals("1")){ %>
   		<counter:RegionTag target="Nationality" regionLevel="0" resCode="RegionTrans" opCode="RegionTransQuery" />
   		<counter:RegionTag target="Adrsta" regionLevel="1" resCode="RegionTrans" opCode="RegionTransQuery" />
    	<counter:RegionTag target="Adrcty" regionLevel="2" resCode="RegionTrans" opCode="RegionTransQuery" />
    	<counter:RegionTag target="Adrsec" regionLevel="3" resCode="RegionTrans" opCode="RegionTransQuery" />
   	<%}%>
	<!-- V3.0.0.60   20161108-01     zhouyao	          成都银行增加国家省市区联动下拉框  M201610130987 end -->	
	<%if(IDict.K_YORN.YORN_YES.equals(ParamCache.getInstance().getSysParamValue("APPROP_MANAGEMENT", IDict.K_YORN.YORN_NO)) 
			&& SysConfigUtil.getSysConfig().getValue("AppropManageAddition","value", "0").equals("1")){ %>
    <counter:dict group="K_ZGZSLX" target="QualificationType"/>
    <counter:dict group="K_DGZJLX" target="BenefIdType"/>
    <counter:dict group="K_DGZJLX" target="ControllerIdType"/>
    <counter:dict group="K_JYFW" target="BusiScope"/>
    <counter:dict group="K_XZ" target="InstAttr"/>
    <!-- V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299 beg -->
    <counter:dict group="K_YORN" target="IsControl"/>
    <counter:dict group="K_SJSYRLX" target="IsBenefit"/>
    <counter:dict group="K_YORN" target="IsBadRecord"/>
    <counter:dict group="K_XB" target="ReprSex"/>
    <counter:dict group="K_ZWDM" target="ReprPosition"/>
    <counter:dict group="K_XB" target="ActorSex"/>
    <counter:dict group="K_ZWDM" target="ActorPosition"/>
    <!-- V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299 end -->
    <%}%>
    <!--  20170927-01     hutao       理财系统与报备系统对接修改 M201709251328 beg -->
    <counter:xmlDict target="HostToFirIdType" group="oIdType" beanName="BankDictConvert"/>
    <!--  20170927-01     hutao       理财系统与报备系统对接修改 M201709251328 end -->
    
</counter:Data>

<script type="text/javascript" defer="defer">

window["jres_PrdClasses"] =[{'dictItemName':'国内基金','dictItemCode':'0'},{'dictItemName':'香港互认基金','dictItemCode':'1'}];

printMode="0";

$("#sign_org").initFields();

/**
 * 校验
 */

	$("#sign_org").validate( {
		rules : {
			BankAcc : {
				required : !<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("SIGN_CLIENT_BY_ID").equals("1")%>,
				regexp : ifmcounter.PubConstant.OrgBankAcc,
				maxlength:<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("instCardMaxLength")%>
			},
			IdType : {
				required : true
			},
			IdCode : {
				required : true,
				regexp : ifmcounter.PubConstant.IdCode,
				maxlength:30
			},
			ClientClass : {
				required : !<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("IsOrgClientClassVisible").equalsIgnoreCase("false")%>
			},
			InstType : {
				required : true
			},
			ClientName : {
				required : true,
				regexp : ifmcounter.PubConstant.InstName,
				minlength:<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("InstNameMinLength"))?"0":SysConfigUtil.getSysConfig("ConstantConfig").getValue("InstNameMinLength")%>,
				maxlength:<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("InstNameMaxLength"))?"0":SysConfigUtil.getSysConfig("ConstantConfig").getValue("InstNameMaxLength")%>
			},
			Address : {
				required : false,
				regexp : ifmcounter.PubConstant.Address,
			    //2012-06-01-01    添加地址最小长度控制 beg
				minlength:<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("AddressMinLength")%>,
				//2012-06-01-01    添加地址最小长度控end 
				maxlength:<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("AddressMaxLength")%>
			},
			PostCode : {
				required : false,
				regexp : ifmcounter.PubConstant.PostCode,
				maxlength:6
			},
			Tel : {
				required :false,
				// V3.0.0.3   20181011-01     yuanql      汇丰银行电话号码个性化校验 M201810110047 beg
				// regexp : ifmcounter.PubConstant.Tel,
				regexp : /^[0-9-]*$/,
				// V3.0.0.3   20181011-01     yuanql      汇丰银行电话号码个性化校验 M201810110047 end
				maxlength:24
			},
			Fax : {
				regexp : ifmcounter.PubConstant.Fax,
				maxlength:24
			},
			Mobile : {
				regexp : ifmcounter.PubConstant.Mobile,
				"minlength":<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("MobileMinLength"))?"11":SysConfigUtil.getSysConfig("ConstantConfig").getValue("MobileMinLength")%>,
				"maxlength":<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("MobileMaxLength"))?"11":SysConfigUtil.getSysConfig("ConstantConfig").getValue("MobileMaxLength")%>
			},
			Email : {
				regexp : ifmcounter.PubConstant.Email,
				maxlength:40
			},
			ReprIdType : {
				required : true
			},
			ReprIdCode : {
				required : true,
				regexp : ifmcounter.PubConstant.IdCode,
				maxlength:30
			},
			ReprName : {
				required : true,
				regexp : ifmcounter.PubConstant.ClientName,
				maxlength:250,
				//V3.0.0.20 20130418-01 zhuqd 根据配置实现法人代表名称,联系人名称最小长度控制  beg
				minlength:<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("ClientNameMinLength"))?"0":SysConfigUtil.getSysConfig("ConstantConfig").getValue("ClientNameMinLength")%>
				//V3.0.0.20 20130418-01	zhuqd 根据配置实现法人代表名称,联系人名称最小长度控制  end
			},
			ActorIdType : {
				required : false
			},
			ActorIdCode : {
				required : false,
				regexp : ifmcounter.PubConstant.IdCode,
				maxlength:30
			},
			ActorName : {
				required : false,
				regexp : ifmcounter.PubConstant.ClientName,
				minlength:<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("InstNameMinLength"))?"0":SysConfigUtil.getSysConfig("ConstantConfig").getValue("InstNameMinLength")%>,
				maxlength:<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("InstNameMaxLength"))?"0":SysConfigUtil.getSysConfig("ConstantConfig").getValue("InstNameMaxLength")%>
			},
			LinkIdCode : {
				regexp : ifmcounter.PubConstant.IdCode,
				maxlength:30
			},
			LinkName : {
				regexp : ifmcounter.PubConstant.ClientName,
				maxlength:250,
				//V3.0.0.20 20130418-01	zhuqd 根据配置实现法人代表名称,联系人名称最小长度控制 beg
				minlength:<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("ClientNameMinLength"))?"0":SysConfigUtil.getSysConfig("ConstantConfig").getValue("ClientNameMinLength")%>
				//V3.0.0.20 20130418-01	zhuqd 根据配置实现法人代表名称,联系人名称最小长度控制 end
			},
			ClientManager:{
				"required" : true,
				"regexp" : ifmcounter.PubConstant.ClientManager,
				maxlength:<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("ClientManagerMaxLength")%>
			},
			MultiClientManager:{
		        required : !<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("IsSignClientManagerAllowBlank").equals("true")&&clientManagerMode.equals("1")%>
		 	},
			RiskLevelName:{
				required : true
				},
			RiskDate:{//默认设置成false,使得第一次进入页面，假如不做风险评估报告，也能提交交易
				required: false
			},
			<%if(IDict.K_YORN.YORN_YES.equals(ParamCache.getInstance().getSysParamValue("APPROP_MANAGEMENT", IDict.K_YORN.YORN_NO))
					&& SysConfigUtil.getSysConfig().getValue("AppropManageAddition","value", "0").equals("1")){ %>
			OfficeAddress:{
				required: !<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("isOfficeAddressAllowBlank","value","true")%>,
				regexp : ifmcounter.PubConstant.Address,
				minlength:<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("AddressMinLength")%>,
				maxlength:<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("AddressMaxLength")%>
			},
			BusiScope:{
				required: !<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("isBusiScopeAllowBlank","value","true")%>
			},
			RegAddress:{
				required: !<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("isRegAddressAllowBlank","value","true")%>,
				regexp : ifmcounter.PubConstant.Address,
				minlength:<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("AddressMinLength")%>,
				maxlength:<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("AddressMaxLength")%>
			},
			InstAttr:{
				required: !<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("isInstAttrAllowBlank","value","true")%>
			},
			BenefIdCode:{
				regexp : ifmcounter.PubConstant.IdCode,
				maxlength:30
			},
			ControllerIdCode:{
				regexp : ifmcounter.PubConstant.IdCode,
				maxlength:30
			},
			InstDocuValid : {
				required : true
			},
			ShareHolder : {
				required : true
			},
			RegistCapital : {
				required : true
			},
			IsControl : {
				required : true
			},
			IsBenefit : {
				required : true
			},
			IsBadRecord : {
				required : true
			},
			ReprSex : {
				required : true
			},
			ReprPosition : {
				required : true
			},
			ReprEmail : {
				required : true,
				regexp : ifmcounter.PubConstant.Email,
				maxlength:40
			},
			ReprDocuValid : {
				required : true
			},
			ReprTel : {
				required : true,
				// V3.0.0.3   20181011-01     yuanql      汇丰银行电话号码个性化校验 M201810110047 beg
				// regexp : ifmcounter.PubConstant.Tel,
				regexp : /^[0-9-]*$/,
				// V3.0.0.3   20181011-01     yuanql      汇丰银行电话号码个性化校验 M201810110047 end
				maxlength:24
			},
			ReprMobile : {
				required : true,
				regexp : ifmcounter.PubConstant.Mobile,
				minlength:<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("MobileMinLength"))?"11":SysConfigUtil.getSysConfig("ConstantConfig").getValue("MobileMinLength")%>,
				maxlength:<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("MobileMaxLength"))?"11":SysConfigUtil.getSysConfig("ConstantConfig").getValue("MobileMaxLength")%>
			},
			ReprPostCode : {
				required : true,
				regexp : ifmcounter.PubConstant.PostCode,
				maxlength:6
			},
			ReprWorkAddr : {
				required : true,
				regexp : ifmcounter.PubConstant.Address,
				minlength:<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("AddressMinLength")%>,
				maxlength:<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("AddressMaxLength")%>
			},
			ActorSex : {
				required : true
			},
			ActorPosition : {
				required : true
			},
			ActorEmail : {
				required : true,
				regexp : ifmcounter.PubConstant.Email,
				maxlength:40
			},
			ActorDocuValid : {
				required : true
			},
			ActorTel : {
				required : true,
				// V3.0.0.3   20181011-01     yuanql      汇丰银行电话号码个性化校验 M201810110047 beg
				// regexp : ifmcounter.PubConstant.Tel,
				regexp : /^[0-9-]*$/,
				// V3.0.0.3   20181011-01     yuanql      汇丰银行电话号码个性化校验 M201810110047 end
				maxlength:24
			},
			ActorMobile : {
				required : true,
				regexp : ifmcounter.PubConstant.Mobile,
				minlength:<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("MobileMinLength"))?"11":SysConfigUtil.getSysConfig("ConstantConfig").getValue("MobileMinLength")%>,
				maxlength:<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("MobileMaxLength"))?"11":SysConfigUtil.getSysConfig("ConstantConfig").getValue("MobileMaxLength")%>
			},
			ActorPostCode : {
				required : true,
				regexp : ifmcounter.PubConstant.PostCode,
				maxlength:6
			},
			ActorWorkAddr : {
				required : true,
				regexp : ifmcounter.PubConstant.Address,
				minlength:<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("AddressMinLength")%>,
				maxlength:<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("AddressMaxLength")%>
			},
			ActorAndInstRe : {
				required : true
			},
			<%}%>
			Nationality:{
				"required" : !<%=ParamCache.getInstance().getSysParamValue("IsAddressSeparate", "0").equals("0")%>
			},
			Adrsta:{
				"required" : !<%=ParamCache.getInstance().getSysParamValue("IsAddressSeparate", "0").equals("0")%>
			},
			Adrcty:{
				"required" : !<%=ParamCache.getInstance().getSysParamValue("IsAddressSeparate", "0").equals("0")%>
			},
			Adrsec:{
				"required" : !<%=ParamCache.getInstance().getSysParamValue("IsAddressSeparate", "0").equals("0")%>
			},
			//V3.0.0.67   20170426-01     zhouyao     营口银行配置推荐人工号必输 M201704141365 beg
			Recommender:{
		        required : <%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("ISRecommenderAllowBlank").equals("false")
		        			&&SysConfigUtil.getSysConfig("ConstantConfig").getValue("ISRecommenderAllowBlank","transcode").contains("100001")%>
		 	}
			//V3.0.0.67   20170426-01     zhouyao     营口银行配置推荐人工号必输 M201704141365 end
			 <%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("ShowSubOrgClientType").equals("true")){ %>  
			,
			SubOrgClientType:{
				required:true
			}
			 <% } %>
			 <%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("ReprBirthAllowBlank","value","false").equals("true")){ %>  
				,
				 ReprBirthday : {
				required : true
			}
			 <% } %>
			 <%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("ActorBirthdayAllowBlank","value","false").equals("true")){ %>  
				,
				ActorBirthday : {
				required : true
			}
			 <% } %>
			 ,PrdClasses:{
					required : true
				}
		},
		messages : {
			BankAcc : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.OrgBankAccText,
				maxlength:"输入内容长度超出最大长度"
			},
			IdType : {
				required : "该输入项为必输项"
			},
			IdCode : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.IdCodeText,
				maxlength:"输入内容长度超出最大长度"
			},
			ClientClass : {
				required : "该输入项为必输项"
			},
			InstType : {
				required : "该输入项为必输项"
			},
			ClientName : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.InstNameText,
				minlength:"输入内容长度小于最小长度",
				maxlength:"输入内容长度超出最大长度"
			},
			Address : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.AddressText,
				//2012-06-01-01    添加地址最小长度控制 beg
				minlength:"输入内容长度小于最短长度",
			    //2012-06-01-01    添加地址最小长度控制 end
				maxlength:"输入内容长度超出最大长度"
			},
			PostCode : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.PostCodeText,
				maxlength:"输入内容长度超出最大长度"
			},
			Tel : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.TelText,
				maxlength:"输入内容长度超出最大长度"
			},
			Fax : {
				regexp : ifmcounter.PubConstant.FaxText,
				maxlength:"输入内容长度超出最大长度"
			},
			Mobile : {
				regexp : ifmcounter.PubConstant.MobileText,
				"minlength":"手机号码长度小于最小长度",
				"maxlength":"手机号码长度超出最大长度"
			},
			Email : {
				regexp : ifmcounter.PubConstant.EmailText,
				maxlength:"输入内容长度超出最大长度"
			},
			ReprIdType : {
				required : "该输入项为必输项"
			},
			ReprIdCode : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.IdCodeText,
				maxlength:"输入内容长度超出最大长度"
			},
			ReprName : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.ClientNameText,
				maxlength:"输入内容长度超出最大长度",
				//V3.0.0.20 20130418-01	zhuqd 根据配置实现法人代表名称,联系人名称最小长度控制 beg
				minlength:"输入内容长度小于最小长度"
				//V3.0.0.20 20130418-01	zhuqd 根据配置实现法人代表名称,联系人名称最小长度控制 end
			},
			ActorIdType : {
				required : "该输入项为必输项"
			},
			ActorIdCode : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.IdCodeText,
				maxlength:"输入内容长度超出最大长度"
			},
			ActorName : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.ClientNameText,
				minlength:"输入内容长度小于最小长度",
				maxlength:"输入内容长度超出最大长度"
			},
			LinkIdCode : {
				regexp : ifmcounter.PubConstant.IdCodeText,
				maxlength:"输入内容长度超出最大长度"
			},
			LinkName : {
				regexp : ifmcounter.PubConstant.ClientNameText,
				maxlength:"输入内容长度超出最大长度",
				//V3.0.0.20 20130418-01	zhuqd 根据配置实现法人代表名称,联系人名称最小长度控制 beg
				minlength:"输入内容长度小于最小长度"
				//V3.0.0.20 20130418-01	zhuqd 根据配置实现法人代表名称,联系人名称最小长度控制 end
			},
			ClientManager : {
				"required": "该输入项为必输项",
				regexp : ifmcounter.PubConstant.ClientManagerText,
				maxlength:"输入内容长度超出最大长度"
			},
		    MultiClientManager:{
	    		required : "客户经理不能为空"
			},
			RiskLevelName:{
				required : "该输入项为必输项"
				},
			RiskDate:{
				required: "该输入项为必输项"
			},
			<%if(IDict.K_YORN.YORN_YES.equals(ParamCache.getInstance().getSysParamValue("APPROP_MANAGEMENT", IDict.K_YORN.YORN_NO))
					&& SysConfigUtil.getSysConfig().getValue("AppropManageAddition","value", "0").equals("1")){ %>
			OfficeAddress:{
				required: "该输入项为必输项",
				regexp : ifmcounter.PubConstant.AddressText,
				minlength:"输入内容长度小于最短长度",
				maxlength:"输入内容长度超出最大长度"
			},
			BusiScope:{
				required: "该输入项为必输项"
			},
			RegAddress:{
				required: "该输入项为必输项",
				regexp : ifmcounter.PubConstant.AddressText,
				minlength:"输入内容长度小于最短长度",
				maxlength:"输入内容长度超出最大长度"
			},
			InstAttr:{
				required: "该输入项为必输项"
			},
			BenefIdCode : {
				regexp : ifmcounter.PubConstant.IdCodeText,
				maxlength:"输入内容长度超出最大长度"
			},
			ControllerIdCode : {
				regexp : ifmcounter.PubConstant.IdCodeText,
				maxlength:"输入内容长度超出最大长度"
			},
			InstDocuValid : {
				required : "该输入项为必输项"
			},
			ShareHolder : {
				required : "该输入项为必输项"
			},
			RegistCapital : {
				required : "该输入项为必输项"
			},
			IsControl : {
				required : "该输入项为必输项"
			},
			IsBenefit : {
				required : "该输入项为必输项"
			},
			IsBadRecord : {
				required : "该输入项为必输项"
			},
			ReprSex : {
				required : "该输入项为必输项"
			},
			ReprPosition : {
				required : "该输入项为必输项"
			},
			ReprEmail : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.EmailText,
				maxlength:"输入内容长度超出最大长度"
			},
			ReprDocuValid : {
				required : "该输入项为必输项"
			},
			ReprTel : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.TelText,
				maxlength:"输入内容长度超出最大长度"
			},
			ReprMobile : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.MobileText,
				minlength:"手机号码长度小于最小长度",
				maxlength:"手机号码长度超出最大长度"
			},
			ReprPostCode : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.PostCodeText,
				maxlength:"输入内容长度超出最大长度"
			},
			ReprWorkAddr : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.AddressText,
				minlength:"输入内容长度小于最小长度",
				maxlength:"输入内容长度超出最大长度"
			},
			ActorSex : {
				required : "该输入项为必输项"
			},
			ActorPosition : {
				required : "该输入项为必输项"
			},
			ActorEmail : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.EmailText,
				maxlength:"输入内容长度超出最大长度"
			},
			ActorDocuValid : {
				required : "该输入项为必输项"
			},
			ActorTel : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.TelText,
				maxlength:"输入内容长度超出最大长度"
			},
			ActorMobile : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.MobileText,
				minlength:"手机号码长度小于最小长度",
				maxlength:"手机号码长度超出最大长度"
			},
			ActorPostCode : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.PostCodeText,
				maxlength:"输入内容长度超出最大长度"
			},
			ActorWorkAddr : {
				required : "该输入项为必输项",
				regexp : ifmcounter.PubConstant.AddressText,
				minlength:"输入内容长度小于最小长度",
				maxlength:"输入内容长度超出最大长度"
			},
			ActorAndInstRe : {
				required : "该输入项为必输项"
			},
			<%}%>
			Nationality:{
				"required" : "该输入项为必输项"
			},
			Adrsta:{
				"required" : "该输入项为必输项"
			},
			Adrcty:{
				"required" : "该输入项为必输项"
			},
			Adrsec:{
				"required" : "该输入项为必输项"
			},
			//V3.0.0.67   20170426-01     zhouyao     营口银行配置推荐人工号必输 M201704141365 beg
			Recommender:{
		        required : "该输入项为必输项"
		 	}
			//V3.0.0.67   20170426-01     zhouyao     营口银行配置推荐人工号必输 M201704141365 end
		 <%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("ShowSubOrgClientType").equals("true")){ %>  
			,
			SubOrgClientType:{
				required: "该输入项为必输项"
			}
		 <% } %>
		 <%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("ReprBirthAllowBlank","value","false").equals("true")){ %> 
			,
			 ReprBirthday : {
			 required : "该输入项为必输项"
			 }
		 <% } %>
		 <%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("ActorBirthdayAllowBlank","value","false").equals("true")){ %> 
			,
			 ActorBirthday : {
			 required : "该输入项为必输项"
			 }
		 <% } %>

		 ,PrdClasses:{
			 required : "该输入项为必输项"
			}
		}
	});

	var paperResult = "";//风险等级问卷内容
	var options = null;//提交评分参数

	var AccType = "1";//客户类型
	var Account = "";//客户标示
	var ClientType = "0";//机构户
	var PaperType = "0";//客户风险等级
	var OpenBranch = "";//开卡机构
	var ClientOpenBranch = "";//客户开卡机构

	var riskLevelName_value = "";//风险等级
	var riskLevel_value = "0";//风险等级
	var riskMonth_value = "";//风险有效期月数
	var ChannelAbleFlag = ""; // 是否开通：购买四级以上的理财产品在柜台以外渠道进行;选中为1，不选为0，或者空

	var investorType_value = "";//投资者类型
	var investorDate_value = "";//投资者类型有效截止日
	
	//公共窗体的回调函数
	function callback() {
		$.pubFunction.getCompByName("RiskLevelName").val(riskLevelName_value);
	}

	function trim(str) {
		while ((str.charCodeAt(0) == 32) && (str.length >= 1)) {
			str = str.substring(1, str.length);
		}
		while ((str.charCodeAt(str.length - 1) == 32) && (str.length >= 1)) {
			str = str.substring(0, str.length - 1);
		}
		return str;
	}

	//查询客户资料
	$.pubFunction.getCompByName("ClientNo").blur( function() {
		CancelReader();
		Account = "";//重新输入卡号后要求清空用户信息
			var bankAcc_value = "";
            var clientNo_value = $.pubFunction.getCompByName("ClientNo").val() ;
            
            if (clientNo_value == ""||$.pubFunction.getCompByName("ClientNo").val()==<%="\""+(SysConfigUtil.getSysConfig("ConstantConfig").getValue("bankAccText","text","")+"\"")%>) {
                    athene.dialog.alert("请先输入客户编号");
                    return;
                }

			;
			var params = {
				FunctionId : "100005",
				ClientType : ClientType,//机构户
				BankAcc : bankAcc_value,
				ClientNo : clientNo_value,
				Passwd : ifmcounter.IEncrypt.enCrypt(""),
				resCode : "T100005",
				opCode : "T100005_def",
				track2 : $.pubFunction.getCompByName("track2").val(),
				track3 : $.pubFunction.getCompByName("track3").val(),
				ClientInfoFlag : 1,
				PinpadID : $.pubFunction.getCompByName("PinpadID").val(),
				//V3.0.0.63   20161205-01     niqq		100005客户资料查询增加TransCode的传值 M201610090782 beg
				TransCode : "100001"
				//V3.0.0.63   20161205-01     niqq		100005客户资料查询增加TransCode的传值 M201610090782 end
			};

			var success = function(response) {
				if ($.pubFunction.call_method_handler("取客户资料发生错误", response)) {
					var result = response.dataSetResult[0].data[0];

					athene.combo.get("display-IdType").setValue(result.IdType);
					$.pubFunction.getCompByName("IdCode").val(result.IdCode);
					athene.combo.get("display-IdType").setReadOnly(true);
					$I("idCode").attr("readonly","readonly");
					$I("idCode").addClass("ux-item-readOnly");


					if (null == result.ClientClass
							|| '' == trim(result.ClientClass)) { //如果获取客户资料没有返回客户组别，必须通过界面选择输入
						//V3.0.0.39   20141110-01     wuxj        客户签约核心未返回客户组别时默认值可配置 M201411100136 begin
						<%if(!SysConfigUtil.getSysConfig("ConstantConfig").getValue("ClientClassOrg").equals("")){%>
						 	athene.combo.get("display-ClientClass").setValue(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("ClientClassOrg")%>);
						<%}%>
						//V3.0.0.39   20141110-01     wuxj        客户签约核心未返回客户组别时默认值可配置 M201411100136 end

					} else {
							athene.combo.get("display-ClientClass").setValue(result.ClientClass);
					}
                    athene.combo.get("display-ClientClass").setReadOnly(true);
                    $.pubFunction.getCompByName("ClientName").attr("readonly","readonly");
                    $.pubFunction.getCompByName("ClientName").addClass("ux-item-readOnly");
					$.pubFunction.getCompByName("ClientName").val(
							result.ClientName);
					$.pubFunction.getCompByName("Address").val(result.Address);
					$.pubFunction.getCompByName("PostCode").val(result.PostCode);
					$.pubFunction.getCompByName("Tel").val(result.Tel);
					$.pubFunction.getCompByName("Fax").val(result.Fax);
					$.pubFunction.getCompByName("Mobile").val(result.Mobile);
					$.pubFunction.getCompByName("Email").val(result.Email);
					$.pubFunction.getCompByName("HostClientNo").val(result.HostClientNo);
					$.pubFunction.getCompByName("HostIdType").val(result.HostIdType);
					$.pubFunction.getCompByName("HostClientType").val(result.HostClientType);
					//V3.0.0.29   20140403-01     huangsy     华润银行ECIF签约时需要保存传过来的contactdId beg -->
		       		$.pubFunction.getCompByName("ContactId").val(result.ContactId);
		       		//V3.0.0.29   20140403-01     huangsy     华润银行ECIF签约时需要保存传过来的contactdId end -->
					$.pubFunction.getCompByName("ReprIdCode").val(
							result.ReprIdCode);
					athene.combo.get("display-ReprIdType").setValue(result.ReprIdType);
					$.pubFunction.getCompByName("ReprName")
							.val(result.ReprName);
					$("#cardType").val(result.CardType);

					//V3.0.0.60   20161108-01     zhouyao	          成都银行增加国家省市区联动下拉框  M201610130987 beg
					if(<%=ParamCache.getInstance().getSysParamValue("IsAddressSeparate", "0").equals("1")%>){ 
                    	tempAdrsta = result.Adrsta;
						tempAdrcty = result.Adrcty;
						tempAdrsec = result.Adrsec;
						athene.combo.get("display-Nationality").setValue(result.Nationality);  //zhouyao
					}
					//V3.0.0.60   20161108-01     zhouyao	          成都银行增加国家省市区联动下拉框  M201610130987 end
					//V3.0.0.30 add by chenling 20140418   是否自动获取客户经理编号，若有获取到，则不可编辑，否则可以手工输入   beg
					if(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("ClientManagerFlag","value","0").equals("1")%>){
				    $.pubFunction.getCompByName("ClientManager").val(result.ClientManager);
					if(result.ClientManager){
						$.pubFunction.getCompByName("ClientManager").attr("readonly","readonly");
						$.pubFunction.getCompByName("ClientManager").addClass("ux-item-readOnly");
					}
					}
					//V3.0.0.30 add by chenling 20140418  是否自动获取客户经理编号，若有获取到，则不可编辑，否则可以手工输入   end
					
					//riskLevel_value = result.RiskLevel;//风险等级
					//$.pubFunction.getCompByName("RiskLevelName").val(result.RiskName);

					//V3.0.0.65    20161215-01     niqq		增加机构子类型  M201610090782 beg
					if(result.IsVirClientNo&&'1' == result.IsVirClientNo){
						athene.combo.get("display-IdType").setReadOnly(false);
						athene.combo.get("display-ClientClass").setReadOnly(false);
						athene.combo.get("display-ReprIdType").setReadOnly(false);
						$.pubFunction.getCompByName("IdCode").removeAttr("readonly");
						$.pubFunction.getCompByName("IdCode").removeClass("ux-item-readOnly");
						$.pubFunction.getCompByName("ClientName").removeAttr("readonly");
						$.pubFunction.getCompByName("ClientName").removeClass("ux-item-readOnly");
						$.pubFunction.getCompByName("ReprIdCode").removeAttr("readonly");
						$.pubFunction.getCompByName("ReprIdCode").removeClass("ux-item-readOnly");
						$.pubFunction.getCompByName("ReprName").removeAttr("readonly");
						$.pubFunction.getCompByName("ReprName").removeClass("ux-item-readOnly");
						
					}

                    athene.combo.get("display-ReprIdType").setReadOnly(true);
                    $.pubFunction.getCompByName("ReprName").attr("readonly","readonly");
                    $.pubFunction.getCompByName("ReprName").addClass("ux-item-readOnly");
                    $.pubFunction.getCompByName("ReprIdCode").attr("readonly","readonly");
                    $.pubFunction.getCompByName("ReprIdCode").addClass("ux-item-readOnly");

                    
					//V3.0.0.65    20161215-01     niqq		增加机构子类型  M201610090782 end
					//V3.0.0.77	20170816-01		dongxin 	修改跨版本问题   M201708160678  beg
					<%if(IDict.K_YORN.YORN_YES.equals(ParamCache.getInstance().getSysParamValue("APPROP_MANAGEMENT", IDict.K_YORN.YORN_NO))
							&& SysConfigUtil.getSysConfig().getValue("AppropManageAddition","value", "0").equals("1")){ %>
							//法人代表
							var ReprBirthdayName = result.ReprBirthday + "";   //先转化为字符串
							var ReprBirthdayNameString ="";
							if(typeof(result.ReprBirthday)!="undefined" && $.trim(result.ReprBirthday)!="" && ReprBirthdayName != "0"){
								//反显生日
								ReprBirthdayNameString = ReprBirthdayName.substring(0,4) + "-" +  ReprBirthdayName.substring(4,6) + "-" +  ReprBirthdayName.substring(6,8);
					            $.pubFunction.getCompById("datefield-ReprBirthday").val(ReprBirthdayName);
					            $.pubFunction.getCompById("display-ReprBirthday").val(ReprBirthdayNameString);
					            //根据生日反显年龄
					            var BirthdayNameString1 = $.pubFunction.getCompById("display-ReprBirthday").val();
								var BirthdayDate = parseDate(BirthdayNameString1);
								var newDate = new Date();
								var diffDate = Math.floor((newDate.getTime() - BirthdayDate.getTime())/(24*60*60*1000*365));
								$.pubFunction.getCompByName("ReprAge").val(diffDate);
					        } else {//根据证件类型反显生日和年龄
					        	setReprBith();
							}
							<%}%>
					//V3.0.0.77	20170816-01		dongxin 	修改跨版本问题   M201708160678  end
					//V3.0.0.82	20171206-01		wuxs		佛山农商，增加核心返回字段的回显 M201712050075 beg
					if(<%="true".equals(SysConfigUtil.getSysConfig("ConstantConfig").getValue("setAppropManageInfo","value","false"))%>){
					    $.pubFunction.getCompByName("OfficeAddress").val(result.OfficeAddress);
						$.pubFunction.getCompByName("RegAddress").val(result.RegAddress);
						$.pubFunction.getCompByName("ShareHolder").val(result.ShareHolder);
						formatCurrency ("RegistCapital",result.RegistCapital,2);
						athene.combo.get("display-ReprSex").setValue(result.ReprSex);
						$.pubFunction.getCompById("datefield-ReprDocuValid").val("20100101");
					    athene.combo.get("display-ActorSex").setValue(result.ActorSex);
						athene.combo.get("display-ActorPosition").setValue(result.ActorPosition);
						$.pubFunction.getCompByName("ActorWorkAddr").val(result.ActorWorkAddr);
						var ReprDocuValidName = result.ReprDocuValid + "";   //先转化为字符串
						var ReprDocuValidNameString ="";
						if(typeof(result.ReprDocuValid)!="undefined" && $.trim(result.ReprDocuValid)!="" && ReprDocuValidName != "0"){
							//反显法人代表证件有效期
							ReprDocuValidNameString = ReprDocuValidName.substring(0,4) + "-" +  ReprDocuValidName.substring(4,6) + "-" +  ReprDocuValidName.substring(6,8);
						    $.pubFunction.getCompById("display-ReprDocuValid").val(ReprDocuValidNameString);
						}
					}
					//V3.0.0.82	20171206-01		wuxs		佛山农商，增加核心返回字段的回显 M201712050075 end
				<%if(IDict.K_YORN.YORN_YES.equals(ParamCache.getInstance().getSysParamValue("APPROP_MANAGEMENT", IDict.K_YORN.YORN_NO))
						&& SysConfigUtil.getSysConfig().getValue("AppropManageAddition","value", "0").equals("1")
							&& SysConfigUtil.getSysConfig("ConstantConfig").getValue("isShowInvestorInfo","value","true").equals("true")){ %>

					var paramsInvestor = {
							FunctionId : "100685",
							resCode : "T100685",
							opCode : "T100685_def",
							AccType : "2",
							Account :  $.pubFunction.getCompByName("IdCode").val(),
							IdType : $.pubFunction.getCompByName("IdType").val()
						};
					
					var T100685Success = function(result, op) {
				
						if (result.returnCode != 0) {
							if(result.errorNo!='1905'){
								athene.dialog.alert("查询客户投资者类型失败" + "<br>" + "错误码："
										+ result.errorNo + "<br>" + "错误信息：" + result.errorInfo);	
							}
							resetInvestorInfo();
							hasGetClientInfo = "0"; // 未取得客户信息
							doUnMask();
							return;
						}
						var flag = result.dataSetResult[0].data[0].ErrorNo;
						if (flag != "0000") {
							alert(result.dataSetResult[0].data[0].ErrorNo);
							if(!result.dataSetResult[0].data[0].ErrorNo=='1905'){
							athene.dialog.alert("查询客户信息失败" + "<br>" + "错误码："
											+ result.dataSetResult[0].data[0].ErrorNo
											+ "<br>" + "错误信息："
											+ result.dataSetResult[0].data[0].ErrorInfo);
							}
							resetInvestorInfo();
							hasGetClientInfo = "0"; // 未取得客户信息
							doUnMask();
							return;
						}
						var temp = result.dataSetResult[0].data[0];
						investorType_value = temp.InvestorType;//投资类型	
						$.pubFunction.getCompByName("InvestorTypeName").val(temp.InvestorTypeName);
						investorDate_value = temp.InvestorDate;//投资类型有效截止日期
						$.pubFunction.getCompByName("InvestorDateName").val(temp.InvestorDateName);
						doUnMask();
			
			
					}
							
					
					var  T100685Failure = function (result, op) {
						$.pubFunction.call_method_failure(result);
						doUnMask();
					}
					var serviceUrl = "<%=basePath%>"+ "ifmcounter.pub.query.T100685Service.service";
					$.pubFunction.asynExecute(serviceUrl, paramsInvestor, T100685Success,T100685Failure,"正在取客户投资者类型，请稍后...",false);// 异步调用取客户投资者类型


					function resetInvestorInfo(){

						investorType_value = "";//投资类型	
						$.pubFunction.getCompByName("InvestorTypeName").val("");
						investorDate_value = 99999999;//投资类型有效截止日期
						$.pubFunction.getCompByName("InvestorDateName").val("");
					}
					
					<%}%>
					
					
					// V3.0.0.42   20141225-01     chenling    根据配置开通购买四级以上的理财产品在柜台以外渠道进行默认勾选隐藏M201412220070 beg
					if(<%=(SysConfigUtil.getSysConfig("ConstantConfig").getValue("isChannelAbleFlagShow").equals("false"))%>){
					//	$("#table-channelableflag").hide();  
					//	 document.getElementById("ChannelAbleFlag").checked = true ;
						}else{
					if(result.RiskLevel>=4 && <%= DictCache.getInstance().isExist("K_CPLX","1")%> ){//如果风险等级大于等于4并且业务类型支持行内理财，显示
					//	$("#table-channelableflag").show();                                           //“开通购买四级以上的理财产品在柜台以外渠道进行”复选框
						// v3.0.0.25 add by qudc 开通购买四级以上的理财产品在柜台以外渠道进行，行方要求系统在显示此选项时，系统默认是勾选状态，新增默认值控制。修改单号：M201311270024 beg
						if(<%= "true".equals(SysConfigUtil.getSysConfig("ConstantConfig").getValue("INBANK_CHANNELABLEFLAG_FIRST_SELECTED"))%>){
					//		document.getElementById("ChannelAbleFlag").checked = true ;
						}
						// v3.0.0.25 add by qudc 开通购买四级以上的理财产品在柜台以外渠道进行，行方要求系统在显示此选项时，系统默认是勾选状态，新增默认值控制。修改单号：M201311270024 end
					}else{
					//	$("#table-channelableflag").hide();
						// v3.0.0.25 add by qudc 开通购买四级以上的理财产品在柜台以外渠道进行，行方要求系统在显示此选项时，系统默认是勾选状态，新增默认值控制。修改单号：M201311270024 beg
					//	document.getElementById("ChannelAbleFlag").checked = undefined ;
						// v3.0.0.25 add by qudc 开通购买四级以上的理财产品在柜台以外渠道进行，行方要求系统在显示此选项时，系统默认是勾选状态，新增默认值控制。修改单号：M201311270024 end
					}
				    }
				    // V3.0.0.42   20141225-01     chenling    根据配置开通购买四级以上的理财产品在柜台以外渠道进行默认勾选隐藏M201412220070 end
					$.pubFunction.getCompByName("IdCode").isValidate("sign_org");
					$.pubFunction.getCompByName("ClientName").isValidate("sign_org");
					$.pubFunction.getCompByName("Address").isValidate("sign_org");
					$.pubFunction.getCompByName("PostCode").isValidate("sign_org");
					$.pubFunction.getCompByName("Tel").isValidate("sign_org");
					$.pubFunction.getCompByName("Mobile").isValidate("sign_org");
					$.pubFunction.getCompByName("Email").isValidate("sign_org");
					$.pubFunction.getCompByName("ReprIdCode").isValidate("sign_org");
					$.pubFunction.getCompByName("ReprName").isValidate("sign_org");
					//v3.0.0.80 	20171120-01		zhenglp		新增核心证件类型返回字段 M201711150793 beg
					if(<%=ParamCache.getInstance().getSysParamValue(IParamConstant.SUPPORT_FIRS,"false").equals("true")%>){
						athene.combo.get("display-HostToFirIdType").setValue(result.HostToFirIdType);
						athene.combo.get("display-InstType").setValue(result.InstType);
						if($.pubFunction.getCompByName("HostToFirIdType").val()=='<%=otherHostIdType %>'){
							$.pubFunction.getCompById("OtherIdTypeNameDiv").show();
							$.pubFunction.getCompByName("OtherIdTypeName").rules("add",{required:true,maxlength:60,messages:{required:"该输入项为必输项"}});
						}else{
							$.pubFunction.getCompByName("OtherIdTypeName").rules("remove");
							$.pubFunction.getCompByName("OtherIdTypeName").val("");
							$.pubFunction.getCompById("OtherIdTypeNameDiv").hide();
						}
					}
					//v3.0.0.80 	20171120-01		zhenglp		新增核心证件类型返回字段 M201711150793 end

					Account = result.ClientNo;
					OpenBranch = result.OpenBranch;
					ClientOpenBranch = result.ClientOpenBranch;
					$.pubFunction.getCompByName("PasswdFlag").val("true");
					//linxy add at 2012-01-31  begin 对公对私判断
					$.pubFunction.getCompById("returnClientType").val(result.ClientType);
					if($("#returnClientType").val()!="" && $("#returnClientType").val()!="0"){
						athene.dialog.alert("对私账户不能进行对公操作");
						$.pubFunction.getCompByName("BankAcc").val("");
						$.pubFunction.getCompByName("PasswdFlag").val("false");
						return;
					}
					//linxy add at 2012-01-31  end 对公对私判断
					/*V3.0.0.55   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617 beg */
			        <%if(DictCache.getInstance().isExist("K_CPLX","A")){ %>
						//客户类别明细判断
						var clientTypeDetail = result.ClientTypeDetail;
						if(bankSaveKHLBMX == "1" || (clientTypeDetail && ($.trim(clientTypeDetail)).length > 0)){//不为空，不需要界面输入
							$.pubFunction.getCompByName("ClientTypeDetail").rules("remove");
							athene.combo.get("display-ClientTypeDetail").setValue(clientTypeDetail);
							athene.combo.get("display-ClientTypeDetail").setEditable(false);
							athene.combo.get("display-ClientTypeDetail").setReadOnly(true);
							$("#clientTypeDetailDiv").hide();
						}else{//为空需要界面输入
							athene.combo.get("display-ClientTypeDetail").setEditable(true);
							athene.combo.get("display-ClientTypeDetail").setReadOnly(false);
							$.pubFunction.getCompByName("ClientTypeDetail").rules("add",{
								required : true,
								messages : {
									required : "客户类别明细不能为空"
								}
							});
							$("#clientTypeDetailDiv").show();
						}
					<%} %>
					/*V3.0.0.55   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617 end */
					

					
					var Params_300 = {
					  "FunctionId":"100300",
					  "resCode":"T100300",
					  "opCode":"T100300_def",
					  "AccType":"1",
					  "Account": Account
					  };
					  
					var success_300 = function(response){
						if (response.returnCode == 0) {
							var flag = response.dataSetResult[0].data[0].ErrorNo;
							if (flag == 0000){
								result_300 = response.dataSetResult[0].data[0];
								//20131226-01		yuhh	 	若分业务签约则不判断签约状态是否正常beg
								if(<%=(!SysConfigUtil.getSysConfig().getValue("PrdTypesMode").equals("true"))%>){
								//20131226-01		yuhh	 	若分业务签约则不判断签约状态是否正常end
								//20160324-01  zhouxy08989  青岛银行，大额存单自动签约分业务 M201603070416 beg
									if(<%=(!"1".equals(ParamCache.getInstance().getParamValue("000000", "AutoSignWithPrdTypes", "0"))) %>){
								//20160324-01  zhouxy08989  青岛银行，大额存单自动签约分业务 M201603070416end
								    	if(result_300.Status=="0" && (result_300.PrdTypes == " " || result_300.PrdTypes == "")){//全业务签约时tbclient表prdtypes为空格
								    		//V3.0.0.64   20161214-01     xiongt      村镇银行根据机构签约  M201612060456 beg
								    		if(!result_300.SignByBranch=="1"){
									    		$.pubFunction.getCompByName("PasswdFlag").val("false");
												$.pubFunction.getCompByName("ClientNo").val("");
									    		athene.dialog.alert("该客户已经签约");
									    	     $("#sign_org").reset();
									             $.pubFunction.getCompByName("ClientManager").val("<%=userinfo.getUserId()%>");
										         
									    	}
								    		//V3.0.0.64   20161214-01     xiongt      村镇银行根据机构签约  M201612060456 end
										}
									}
								}
							}
						}
					}
					  
					var serviceURL = window.ctxPath + "ifmcounter.pub.query.T100300.service";
					$.pubFunction.asynExecute(serviceURL,Params_300,success_300,failure,"正在取客户资料，请稍后...");
				}else{
					$.pubFunction.getCompByName("PasswdFlag").val("false");
					$.pubFunction.getCompByName("BankAcc").val("");
				}
				//v3.0.0.54    20160919-01  zhangzy       保定银行增加验印功能 M201608091110 beg
				if(<%="1".equals(SysConfigUtil.getSysConfig().getValue("CheckPrintFlag","value","0"))%>){
					if(<%=(!"".equals(SysConfigUtil.getSysConfig("ConstantConfig").getValue("CheckPrintTransCode","value",""))&&
							SysConfigUtil.getSysConfig("ConstantConfig").getValue("CheckPrintTransCode").contains("100200"))||
							"".equals(SysConfigUtil.getSysConfig("ConstantConfig").getValue("CheckPrintTransCode","value",""))%>){
						CheckPrint();
					}
				}
				//v3.0.0.54    20160919-01  zhangzy       保定银行增加验印功能 M201608091110 end
			};

			var failure = function(response) {
				$.pubFunction.call_method_failure(response);
			};
			var serviceURL = window.ctxPath
					+ "ifmcounter.pub.trans.T100005.service";
			$.pubFunction.asynExecute(serviceURL, params, success, failure,
					"正在取客户资料，请稍后...");
		});
//	V3.0.0.28	20140321-01		yuhh		支持证件类型证件号签约beg
 var IdCodeMode = function(){
	 CancelReader();
		Account = "";//重新输入卡号后要求清空用户信息
			var idCode_value = $.pubFunction.getCompByName("IdCode").val();

			if (!idCode_value) {
				athene.dialog.alert("请输入证件号");
				return;
			}
			;
			var params = {
				FunctionId : "100005",
				ClientType : ClientType,//机构户
				resCode : "T100005",
				opCode : "T100005_def",
				IdType : $.pubFunction.getCompByName("IdType").val(),
				AccType : "2",
				Account : $.pubFunction.getCompByName("IdCode").val(),
				ClientInfoFlag : 1,
				//V3.0.0.63   20161205-01     niqq		100005客户资料查询增加TransCode的传值 M201610090782 beg
				TransCode : "100001"
				//V3.0.0.63   20161205-01     niqq		100005客户资料查询增加TransCode的传值 M201610090782 end
			};

			var success = function(response) {
				var registFn = function(){//密码校验不通过清空密码
					var success_callback = function(response) {
					var commitFn = function(closeparam) {
						var form = $('#registerForm') ;
						var params = {
							resCode:"T100607_orgs",
							opCode:"T100607_orgs_def",
							FunctionId:"100607",
							ClientType:"0",
							ClientClass:$("#combobox-RegisClientClass").val(),
							IdType:$("#combobox-RegisIdType").val(),
							IdCode:$.pubFunction.getCompByName("RegisIdCode").val(),
							ClientName:$.pubFunction.getCompByName("RegisClientName").val(),
							ShortName:$.pubFunction.getCompByName("RegisShortName").val(),
							Address:$.pubFunction.getCompByName("RegisAddress").val(),
							PostCode:$.pubFunction.getCompByName("RegisPostCode").val(),
							Tel:$.pubFunction.getCompByName("RegisTel").val(),
							Fax:$.pubFunction.getCompByName("RegisFax").val(),
							Mobile:$.pubFunction.getCompByName("RegisMobile").val(),
							Email:$.pubFunction.getCompByName("RegisEmail").val(),
							ReprIdType:$("#combobox-RegisReprIdType").val(),
							ReprIdCode : $.pubFunction.getCompByName("RegisReprIdCode").val(),
							ReprName : $.pubFunction.getCompByName("RegisReprName").val(),
							Reserve:$.pubFunction.getCompByName("RegisReserve").val(),
							Remark1:$.pubFunction.getCompByName("RegisRemark1").val(),
							Remark2:$.pubFunction.getCompByName("RegisRemark2").val(),
							Remark3:$.pubFunction.getCompByName("RegisRemark3").val()
						};
						
						var success = function (response) {
							if ($.pubFunction.call_method_handler("登记信息失败",response)){
								result = response.dataSetResult[0].data[0];
								athene.combo.get("display-IdType").setValue($("#combobox-RegisIdType").val());
								$.pubFunction.getCompByName("IdCode").val($.pubFunction.getCompByName("RegisIdCode").val());
								//20140325-01		yuhh		信息登记客户组别若返回为空则取登记时信息beg
								if(result.ClientClass){
									athene.combo.get("display-ClientClass").setValue(result.ClientClass);
									}else{
										athene.combo.get("display-ClientClass").setValue($.pubFunction.getCompByName("RegisClientGroup").val());
									}
								//20140325-01		yuhh		信息登记客户组别若返回为空则取登记时信息end
								$.pubFunction.getCompByName("ClientNo").val(result.ClientNo);
								$.pubFunction.getCompByName("ClientName").val($.pubFunction.getCompByName("RegisClientName").val());
								$.pubFunction.getCompByName("Address").val($.pubFunction.getCompByName("RegisAddress").val());
								$.pubFunction.getCompByName("PostCode").val($.pubFunction.getCompByName("RegisPostCode").val());
								$.pubFunction.getCompByName("Tel").val($.pubFunction.getCompByName("RegisTel").val());
								$.pubFunction.getCompByName("Fax").val($.pubFunction.getCompByName("RegisFax").val());
								$.pubFunction.getCompByName("Mobile").val($.pubFunction.getCompByName("RegisMobile").val());
								$.pubFunction.getCompByName("Email").val($.pubFunction.getCompByName("RegisEmail").val());
								athene.combo.get("display-ReprIdType").setValue($.pubFunction.getCompByName("RegisReprIdType").val());
								$.pubFunction.getCompByName("ReprIdCode").val($.pubFunction.getCompByName("RegisReprIdCode").val());
								$.pubFunction.getCompByName("ReprName").val($.pubFunction.getCompByName("RegisReprName").val());
								$.pubFunction.getCompByName("PasswdFlag").val("true");
								$.pubFunction.getCompByName("RiskLevelName").val("");
								Account = result.ClientNo;
								$.pubFunction.getCompByName("Address").isValidate("sign_personal");
								$.pubFunction.getCompByName("ClientName").isValidate("sign_personal");
								$.pubFunction.getCompByName("IdCode").isValidate("sign_personal");
								$.pubFunction.getCompByName("Tel").isValidate("sign_personal");
								$.pubFunction.getCompByName("Fax").isValidate("sign_personal");
								$.pubFunction.getCompByName("Mobile").isValidate("sign_personal");
								$.pubFunction.getCompByName("Email").isValidate("sign_personal");
								$.pubFunction.getCompByName("PostCode").isValidate("sign_personal");
								cancelFn(false);
								}
							};
						var failure = function (response){
			   				$.pubFunction.call_method_failure(response);
			   			};
			   			var serviceURL = "<%=basePath%>" + "ifmcounter.pub.trans.T100607.service";
					
				    	if(form.valid()){
				    		$.pubFunction.asynExecute(serviceURL,params,success,failure,"正在注册用户信息，请稍后...");
				    	}
						};
					 var cancelFn = function(closeparam) {
						 if(!closeparam){
								athene.win.get('register').close();
								return;
							}
							var combos = athene.combo.getAll();
				        	for(var i =0;i<combos.length;i++){
				        		var combo = combos[i] ;
				        		if("display-RegisIdType" == combo.id ||"display-RegisClientGroup" == combo.id ||"display-RegisReprIdType" == combo.id  ){
				        			combo.destroy();
				        			combo = null;
				        			combos.splice(i,1);
				        			i--;
				        		}
				      		 }
				      };
				      var resetFn = function(closeparam) {
					      
				    	  $('#registerForm').reset();
				    	  athene.combo.get("display-RegisIdType").setValue($.pubFunction.getCompByName("IdType").val());
				    		$.pubFunction.getCompByName("RegisIdCode").val($.pubFunction.getCompByName("IdCode").val());
				    		athene.combo.get("display-RegisClientGroup").setValue("0");
					      };
				      
					var win=athene.win.open({
						id:"register",
						width:options.width||600,
						height:300,
						title:"用户信息登记",
						html:response,
						buttons:[{id:"btnSave",text:"提交",click:commitFn},{id:"btnReset",text:"重置",click:resetFn},{id:"btnExit",text:"取消",click:cancelFn}
						 ],
						onClose : function(){
							cancelFn(true);
						},
						onSetHtml:function(){
							$('#contentDiv').height(this.el.find(".win-content").innerHeight());
						}
					});
				}
				var failure_callback = function(xhr) {
					$.pubFunction.call_method.failure(xhr);
				}

				var complete_callback = function(xhr) {
					doUnMask();
				}
				var options = {
						"url" : "<%=basePath%>" + "jspui/ifmcounter/pub/trans/T100001_orgs_register.jsp",
						"data" : {},
						"beforeSend" : function() {
							doMask("正在处理，请稍等...");
						},
						"success" : success_callback,
						"error" : failure_callback,
						"complete" : complete_callback,
						"type" : "post",
						"dataType":"html"
					};
					$.ajax(options);
			}
				if (typeof(response) != 'object') {
					response = eval('(' + response + ')');
				}
				if (response.returnCode != 0 && response.returnCode != "0") {
					athene.dialog.alert(msg + "<br>" + "错误码：" + response.errorNo
							+ "<br>" + "错误信息：" + response.errorInfo); 
					return ;
				}
				var result = response.dataSetResult[0].data[0];
				if (result.ErrorNo != "0000") {
					athene.dialog.confirm("查用户信息失败，是否进行用户信息登记?",function(r){
						if(r==true){
							registFn();
						}else{
							return false;
						}
						}); 
					return ;
				}
				result = response.dataSetResult[0].data[0];

					athene.combo.get("display-IdType").setValue(result.IdType);
					$.pubFunction.getCompByName("IdCode").val(result.IdCode);
					if(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdReadonlyA").equals("true")%> && result.IdType=="A"){
						athene.combo.get("display-IdType").setReadOnly(true);
						$I("idCode").attr("readonly","readonly");
						$I("idCode").addClass("ux-item-readOnly");
					}
					
					
					if (null == result.ClientClass
							|| '' == trim(result.ClientClass)) { //如果获取客户资料没有返回客户组别，必须通过界面选择输入

					} else {
							athene.combo.get("display-ClientClass").setValue(result.ClientClass);
					}

					$.pubFunction.getCompByName("ClientName").val(
							result.ClientName);
					$.pubFunction.getCompByName("Address").val(result.Address);
					$.pubFunction.getCompByName("PostCode").val(result.PostCode);
					$.pubFunction.getCompByName("Tel").val(result.Tel);
					$.pubFunction.getCompByName("Fax").val(result.Fax);
					$.pubFunction.getCompByName("Mobile").val(result.Mobile);
					$.pubFunction.getCompByName("Email").val(result.Email);
					$.pubFunction.getCompByName("HostClientNo").val(result.HostClientNo);
					$.pubFunction.getCompByName("HostIdType").val(result.HostIdType);
					$.pubFunction.getCompByName("HostClientType").val(result.HostClientType);

					$.pubFunction.getCompByName("ReprIdCode").val(
							result.ReprIdCode);
					athene.combo.get("display-ReprIdType").setValue(result.ReprIdType);
					$.pubFunction.getCompByName("ReprName")
							.val(result.ReprName);
					$("#cardType").val(result.CardType);

					riskLevel_value = result.RiskLevel;//风险等级
					$.pubFunction.getCompByName("RiskLevelName").val(result.RiskName);

					//V3.0.0.65    20161215-01     niqq		增加机构子类型  M201610090782 beg
					if(result.IsVirClientNo&&'1' == result.IsVirClientNo){
						athene.combo.get("display-IdType").setReadOnly(false);
						athene.combo.get("display-ClientClass").setReadOnly(false);
						athene.combo.get("display-ReprIdType").setReadOnly(false);
						$.pubFunction.getCompByName("IdCode").removeAttr("readonly");
						$.pubFunction.getCompByName("IdCode").removeClass("ux-item-readOnly");
						$.pubFunction.getCompByName("ClientName").removeAttr("readonly");
						$.pubFunction.getCompByName("ClientName").removeClass("ux-item-readOnly");
						$.pubFunction.getCompByName("ReprIdCode").removeAttr("readonly");
						$.pubFunction.getCompByName("ReprIdCode").removeClass("ux-item-readOnly");
						$.pubFunction.getCompByName("ReprName").removeAttr("readonly");
						$.pubFunction.getCompByName("ReprName").removeClass("ux-item-readOnly");
						
					}
					//V3.0.0.65    20161215-01     niqq		增加机构子类型  M201610090782 end
					
					// V3.0.0.42   20141225-01     chenling    根据配置开通购买四级以上的理财产品在柜台以外渠道进行默认勾选隐藏M201412220070 beg
					if(<%=(SysConfigUtil.getSysConfig("ConstantConfig").getValue("isChannelAbleFlagShow").equals("false"))%>){
                      //  $("#table-channelableflag").hide();
					//	document.getElementById("ChannelAbleFlag").checked = true ;
						}else{
					if(result.RiskLevel>=4 && <%= DictCache.getInstance().isExist("K_CPLX","1")%> ){//如果风险等级大于等于4并且业务类型支持行内理财，显示
					//	$("#table-channelableflag").show();                                           //“开通购买四级以上的理财产品在柜台以外渠道进行”复选框
						
						if(<%= "true".equals(SysConfigUtil.getSysConfig("ConstantConfig").getValue("INBANK_CHANNELABLEFLAG_FIRST_SELECTED"))%>){
					//		document.getElementById("ChannelAbleFlag").checked = true ;
						}
						
					}else{
					//	$("#table-channelableflag").hide();
						
					//	document.getElementById("ChannelAbleFlag").checked = undefined ;
						
					}
			        }
			        // V3.0.0.42   20141225-01     chenling    根据配置开通购买四级以上的理财产品在柜台以外渠道进行默认勾选隐藏M201412220070 end
					$.pubFunction.getCompByName("IdCode").isValidate("sign_org");
					$.pubFunction.getCompByName("ClientName").isValidate("sign_org");
					$.pubFunction.getCompByName("Address").isValidate("sign_org");
					$.pubFunction.getCompByName("PostCode").isValidate("sign_org");
					$.pubFunction.getCompByName("Tel").isValidate("sign_org");
					$.pubFunction.getCompByName("Mobile").isValidate("sign_org");
					$.pubFunction.getCompByName("Email").isValidate("sign_org");
					$.pubFunction.getCompByName("ReprIdCode").isValidate("sign_org");
					$.pubFunction.getCompByName("ReprName").isValidate("sign_org");
					

					Account = result.ClientNo;
					OpenBranch = result.OpenBranch;
					ClientOpenBranch = result.ClientOpenBranch;
					$.pubFunction.getCompByName("PasswdFlag").val("true");
					$.pubFunction.getCompById("returnClientType").val(result.ClientType);
					if($("#returnClientType").val()!="" && $("#returnClientType").val()!="0"){
						athene.dialog.alert("对私账户不能进行对公操作");
						$.pubFunction.getCompByName("IdCode").val("");
						$.pubFunction.getCompByName("PasswdFlag").val("false");
						return;
					}
					//linxy add at 2012-01-31  end 对公对私判断

					var Params_300 = {
					  "FunctionId":"100300",
					  "resCode":"T100300",
					  "opCode":"T100300_def",
					  "AccType":"1",
					  "Account": Account
					  };
					  
					var success_300 = function(response){
						if (response.returnCode == 0) {
							var flag = response.dataSetResult[0].data[0].ErrorNo;
							if (flag == 0000){
								result_300 = response.dataSetResult[0].data[0];
								if(<%=(!SysConfigUtil.getSysConfig().getValue("PrdTypesMode").equals("true"))%>){
									if(result_300.Status=="0" && (result_300.PrdTypes == " " || result_300.PrdTypes == "")){//全业务签约时tbclient表prdtypes为空格
							    		//V3.0.0.64   20161214-01     xiongt      村镇银行根据机构签约  M201612060456 beg
							    		if(!result_300.SignByBranch=="1"){
								    		$.pubFunction.getCompByName("PasswdFlag").val("false");
											$.pubFunction.getCompByName("IdCode").val("");
								    		athene.dialog.alert("该客户已经签约");
								    	}
							    		//V3.0.0.64   20161214-01     xiongt      村镇银行根据机构签约  M201612060456 end
									}
								}
							}
						}
					}
					  
					var serviceURL = window.ctxPath + "ifmcounter.pub.query.T100300.service";
					$.pubFunction.asynExecute(serviceURL,Params_300,success_300,failure,"正在取客户资料，请稍后...");
				
			};
			var failure = function(response) {
				$.pubFunction.call_method_failure(response);
			};
			var serviceURL = window.ctxPath
					+ "ifmcounter.pub.trans.T100005.service";
			$.pubFunction.asynExecute(serviceURL, params, success, failure,
					"正在取客户资料，请稍后...");

 };
 //	V3.0.0.28	20140321-01		yuhh		支持证件类型证件号签约end
	//add by linxy 2012-03-16 100005如果返回风险有效日期，则反显示

	
	//发送方式级联
	function SendModeCascade() {
		/**
		var contacts = {
			mobile : $.pubFunction.getCompByName("Mobile").val(),
			email : $.pubFunction.getCompByName("Email").val(),
			fax : $.pubFunction.getCompByName("Fax").val(),
			address : $.pubFunction.getCompByName("Address").val()
		};
		return $.pubFunction.checkSendMode(
				$.pubFunction.send_mode_rollback_handler($.pubFunction.getCompByName("SendMode").val()),
				$("#combobox-SendFreq").val(), contacts);
		*/
		return true;
	};
	
	/*V3.0.0.55   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617 beg */
	/**
	 * 银行账号变更事件
	 */
	 $.pubFunction.getCompByName("BankAcc").change(function(){
		 <%if(DictCache.getInstance().isExist("K_CPLX","A")){ %>
			 $.pubFunction.getCompById("display-ClientTypeDetail").val("");//清空客户类别明细
		 	 $.pubFunction.getCompById("combobox-ClientTypeDetail").val("");//清空客户类别明细
	 	 <%} %>
	 });
	 /*V3.0.0.55   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617 end */

//V3.0.0.60   20161108-01     zhouyao	          成都银行增加国家省市区联动下拉框  M201610130987 beg
//国家省市区联动事件
var tempAdrsta = "";
var tempAdrcty = "";
var tempAdrsec = "";
function SelectAdrsta(item) {
	UpdateRegion(item, '1', 'Adrsta', tempAdrsta);
	tempAdrsta = ""; 
}
function SelectAdrcty(item) {
	UpdateRegion(item, '2', 'Adrcty', tempAdrcty);
	tempAdrcty = ""; 
}
function SelectAdrsec(item) {
	UpdateRegion(item, '3', 'Adrsec', tempAdrsec);
	tempAdrsec = ""; 
}
function UpdateRegion(item, level, targetArea, targetValue) {
	
	var params = {
		    resCode : "RegionTrans",
	        opCode  : "RegionTransQuery",
	        ParentCode: item.region_code,
	        RegionLevel: level
	};
	var serviceURL = window.ctxPath+"ifmcounter.pub.pub.RegionService.service"; 
	var comp = "display-"+targetArea;
	if(athene.combo.get(comp)) {
		athene.combo.get(comp).ajaxRefreshItems(params, serviceURL, function(){
			athene.combo.get(comp).removeSelectItem();
			if(targetValue!="" && targetValue != 'undefined' && targetValue!=null){
				athene.combo.get(comp).setValue(targetValue);
			}
			});
		}
	if(targetArea=="Adrsta"){
		athene.combo.get("display-Adrcty").removeSelectItem();
		athene.combo.get("display-Adrsec").removeSelectItem();
	}
	if(targetArea=="Adrcty"){
		athene.combo.get("display-Adrsec").removeSelectItem();
	}

}
//V3.0.0.60   20161108-01     zhouyao	          成都银行增加国家省市区联动下拉框  M201610130987 end
	 
	//提交签约
	$.pubFunction.getCompById("mysubmit").click( function() {
		//v3.0.0.54    20160919-01  zhangzy       保定银行增加验印功能 M201608091110 beg
		if(<%="1".equals(SysConfigUtil.getSysConfig().getValue("CheckPrintFlag","value","0"))%>){
			if(<%="1".equals(SysConfigUtil.getSysConfig().getValue("CheckPrintResult","value","0"))%>){
				if(<%=(!"".equals(SysConfigUtil.getSysConfig("ConstantConfig").getValue("CheckPrintTransCode","value",""))&&
						SysConfigUtil.getSysConfig("ConstantConfig").getValue("CheckPrintTransCode").contains("100200"))||
						"".equals(SysConfigUtil.getSysConfig("ConstantConfig").getValue("CheckPrintTransCode","value",""))%>){
					var yyResult = GetCheckPrintResult();
					if(yyResult!=""){
						athene.dialog.alert(yyResult);
						return;
					}
				}
			}
		}
		//v3.0.0.54    20160919-01  zhangzy       保定银行增加验印功能 M201608091110 end
		if(<%=!DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("checkNoEvaluate"))&&"true".equals(SysConfigUtil.getSysConfig("ConstantConfig").getValue("checkNoEvaluate"))%>){
			if($.pubFunction.getCompByName("RiskLevelName").val()=='未评定'){
				athene.dialog.alert("客户风险等级未评定，不能提交");
				return;
			}
		}

		//V3.0.0.68   20170524-01     wangyj      证券期货投资者适当性管理办法 M201705230053 beg
		<%if(IDict.K_YORN.YORN_YES.equals(ParamCache.getInstance().getSysParamValue("APPROP_MANAGEMENT", IDict.K_YORN.YORN_NO))
				&& SysConfigUtil.getSysConfig().getValue("AppropManageAddition","value", "0").equals("1")){ %>
		if (($.trim($.pubFunction.getCompByName("BenefIdType").val()) != "" && ($.trim($.pubFunction.getCompByName("BenefIdCode").val()) == "" || $.trim($.pubFunction.getCompByName("BenefName").val()) == ""))
				|| ($.trim($.pubFunction.getCompByName("BenefIdCode").val()) != "" && ($.trim($.pubFunction.getCompByName("BenefIdType").val()) == "" || $.trim($.pubFunction.getCompByName("BenefName").val()) == ""))
				|| ($.trim($.pubFunction.getCompByName("BenefName").val()) != "" && ($.trim($.pubFunction.getCompByName("BenefIdType").val()) == "" || $.trim($.pubFunction.getCompByName("BenefIdCode").val()) == ""))) {
			athene.dialog.alert("实际受益人证件类型，实际受益人证件号码，实际受益人姓名必须同时输入");
			return;
		}
		if (($.trim($.pubFunction.getCompByName("ControllerIdType").val()) != "" && ($.trim($.pubFunction.getCompByName("ControllerIdCode").val()) == "" || $.trim($.pubFunction.getCompByName("ControllerName").val()) == ""))
				|| ($.trim($.pubFunction.getCompByName("ControllerIdCode").val()) != "" && ($.trim($.pubFunction.getCompByName("ControllerIdType").val()) == "" || $.trim($.pubFunction.getCompByName("ControllerName").val()) == ""))
				|| ($.trim($.pubFunction.getCompByName("ControllerName").val()) != "" && ($.trim($.pubFunction.getCompByName("ControllerIdType").val()) == "" || $.trim($.pubFunction.getCompByName("ControllerIdCode").val()) == ""))) {
			athene.dialog.alert("实际控制人证件类型，实际控制人证件号码，实际控制人姓名必须同时输入");
			return;
		}
		//V3.0.0.73   20170725-01     zhangfeng   ‘是否存在实际控制关系’：默认值改为否，选是，实际控制关系说明不能为空M201707210729 beg
		if (($.trim($.pubFunction.getCompByName("IsControl").val()) == "1")&&($.trim($.pubFunction.getCompByName("ControlExplain").val()) == "")){
			athene.dialog.alert("存在实际控制关系时,实际控制关系说明不能为空");
			return;
		}
		//V3.0.0.73   20170725-01     zhangfeng   ‘是否存在实际控制关系’：默认值改为否，选是，实际控制关系说明不能为空M201707210729 end
		<%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("isShowQualifyCodeDate").equals("true")){ %>
		if (($.trim($.pubFunction.getCompByName("QualificationType").val()) != "" && ($.trim($.pubFunction.getCompByName("QualificationCode").val()) == "" || $.pubFunction.getCompByName("QualifyCodeDate").val() == 0 || $.trim($.pubFunction.getCompByName("QualifyCodeDate").val()) == ""))
				|| ($.trim($.pubFunction.getCompByName("QualificationCode").val()) != "" && ($.trim($.pubFunction.getCompByName("QualificationType").val()) == "" || $.pubFunction.getCompByName("QualifyCodeDate").val() == 0 || $.trim($.pubFunction.getCompByName("QualifyCodeDate").val()) == ""))
				|| ($.pubFunction.getCompByName("QualifyCodeDate").val() != 0 && $.trim($.pubFunction.getCompByName("QualifyCodeDate").val()) != "" && ($.trim($.pubFunction.getCompByName("QualificationType").val()) == "" || $.trim($.pubFunction.getCompByName("QualificationCode").val()) == ""))) {
			athene.dialog.alert("资格证书类型，资格证书号码，资格证书有效期必须同时输入");
			return;
		}
		<%}%>
		<%}%>
		//V3.0.0.68   20170524-01     wangyj      证券期货投资者适当性管理办法 M201705230053 end
		
		//对checkBoxGroup的值进行处理,调用pubFunction中的send_mode_handler函数

   	//20131217		yuhh		添加控制是否区分业务签约beg
		var prdTypesVal = "";
		var prdTypes = $.pubFunction.getCompByName("DisplayPrdTypes");
		for(var i = 0; i< prdTypes.length; i++){
			if(prdTypes[i].checked){
				prdTypesVal += prdTypes[i].value;
				}
			}
		$("#prdTypes").val(prdTypesVal);
		if(<%=(SysConfigUtil.getSysConfig().getValue("PrdTypesMode").equals("true"))%>){
			if(prdTypesVal==""){
				athene.dialog.alert("请选择业务类型");
				return;
				}
			}
		//20131217		yuhh		添加控制是否区分业务签约end
		var f = $("#sign_org");
		if (f.valid() && SendModeCascade()) {
			//提交签约成功
			var condition_submitSuccess = function(response) {
				ChannelAbleFlag = "";
				$.pubFunction.condition_submitSuccess(response, $.pubFunction.getCompById("mysubmit"), f);
				$.pubFunction.getCompByName("PasswdFlag").val("false");
				if(<%=!SysConfigUtil.getSysConfig("ConstantConfig").getValue("isCleanInf","value","true").equals("false")%>){
				$.pubFunction.getCompByName("BankAcc").val("");
				//$.pubFunction.getCompByName("IdCode").val("");
				//

				$("#targetselect-MultiClientManager").val("");
				//$("#targetselect-RiskLevelName").val("");
				//$("#riskDate").val("");
				}
				//V3.0.0.72   20170703-01     huzd       海口银行增加自动签约M201706230266 beg
				<%if(("true").equals(SysConfigUtil.getSysConfig("ConstantConfig").getValue("HKNSH_AutoSign"))  && "true".equals(isAutoSignFlag)){%>
				var tabs = parent.tabs;
				var resCode = "T100200InBank_orgs";
				var opCode = "T100200InBank_orgs_def";
				var url = "<%=basePath%>"
					+ "jspui/ifmcounter/inbank/trans/T100200_orgs.jsp?"
					+ "resCode=" + resCode + "&opCode=" + opCode+"&BankAcc=<%=bankAccTemp%>&flag=true";
				if(tabs.has('T100200InBank_orgs')){
					tabs.remove('T100200InBank_orgs');
					addTab(tabs, 'T100200InBank_orgs', '机构行内理财产品购买', url);
				}else{
					addTab(tabs, 'T100200InBank_orgs', '机构行内理财产品购买', url);
				}
				tabs.remove("T100001_orgs_def");
				<%}%>
				//V3.0.0.72   20170703-01     huzd       海口银行增加自动签约M201706230266 end
                $.pubFunction.getCompByName("ClientManager").val("<%=userinfo.getUserId()%>");
				
			};

			//提交签约失败
			var condition_submitFailure = function(response) {
				ifmcounter.PubFunction.condition_submitFailure(response, $.pubFunction.getCompById("mysubmit"));
				$.pubFunction.getCompByName("PasswdFlag").val("false");
				if(<%=!SysConfigUtil.getSysConfig("ConstantConfig").getValue("isCleanInf","value","true").equals("false")%>){
				$.pubFunction.getCompByName("BankAcc").val("");
				//$.pubFunction.getCompByName("IdCode").val("");
				}
			};

			<%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("isCheckInstRiskLevel").equals("true") && RiskMode.equals( "0")){ %>
			//add by linxy at 2012-02-16 begin 客户风险等级如果是未评定，是否可以提交交易 
				if(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("IsCheckRiskLevel0").equals("true")%>){
					if(riskLevel_value=='0'){
						athene.dialog.alert('客户未评定风险等级，不可以提交');
						return;
					}
				}	
			//add by linxy at 2012-02-16 end 
			<%}%>
			// v3.0.0.25 add by qudc 开通购买四级以上的理财产品在柜台以外渠道进行，行方要求系统在显示此选项时，系统默认是勾选状态，新增默认值控制。修改单号：M201311270024 beg
			if(undefined ==  $.pubFunction.getCompByName("ChannelAbleFlag").attr("checked")){
				ChannelAbleFlag = 0;
			} else {
				ChannelAbleFlag = 1;
			}
			// v3.0.0.25 add by qudc 开通购买四级以上的理财产品在柜台以外渠道进行，行方要求系统在显示此选项时，系统默认是勾选状态，新增默认值控制。修改单号：M201311270024 end
			//V3.0.0.57   20161011-01     zhangww     平顶山银行新增机构客户子类型，当做HostClientType赋值 M201610090123 beg
			var hostClientTypeVal = $.pubFunction.getCompByName("HostClientType").val();
			 <%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("ShowSubOrgClientType").equals("true")){ %>  
			 hostClientTypeVal = $.pubFunction.getCompByName("SubOrgClientType").val();
			 <% } %>
			//V3.0.0.57   20161011-01     zhangww     平顶山银行新增机构客户子类型，当做HostClientType赋值  M201610090123 end
			//linxy add 20121116-01 begin
			var params100001 ={
					ShortName :"",
					FunctionId : "100001",
					resCode : "T100001_pb_orgs",
					opCode : "T100001_pb_orgs_def",
					AccType : AccType,
					ClientNo : Account,
					Account : Account,
					ClientType : ClientType,
					OpenBranch : OpenBranch,
					ClientOpenBranch : ClientOpenBranch,
					ChannelAbleFlag:ChannelAbleFlag,
					RiskLevel : "5",
					ClientClass : "5",
					RiskDate : "21000101",
					RiskMonths : 0,
					<%if(IDict.K_YORN.YORN_YES.equals(ParamCache.getInstance().getSysParamValue("APPROP_MANAGEMENT", IDict.K_YORN.YORN_NO))
							&& SysConfigUtil.getSysConfig().getValue("AppropManageAddition","value", "0").equals("1")){ %>
					InvestorType : investorType_value,
					InvestorDate : investorDate_value,
					<%}%>
					Passwd : ifmcounter.IEncrypt.enCrypt(""),
					//SendMode : $.pubFunction.send_mode_handler( $("#sendMode").val()),
					track2 : $.pubFunction.getCompByName("track2").val(),
					track3 : $.pubFunction.getCompByName("track3").val(),
					HostClientNo:$.pubFunction.getCompByName("HostClientNo").val(),
					HostIdType:$.pubFunction.getCompByName("HostIdType").val(),
					//V3.0.0.57   20161011-01     zhangww     平顶山银行新增机构客户子类型，当做HostClientType赋值  M201610090123 beg
					HostClientType:hostClientTypeVal,
					//V3.0.0.57   20161011-01     zhangww     平顶山银行新增机构客户子类型，当做HostClientType赋值  M201610090123 end
					//V3.0.0.2   20180110-01     dingrong    汇丰银行个性化新增低柜签约、解约、理财账户撤销 M201712080086 beg
					PrdTypes : "0",
					//V3.0.0.2   20180110-01     dingrong    汇丰银行个性化新增低柜签约、解约、理财账户撤销 M201712080086 end
					//V3.0.0.35   20140811-01     chenling    增加推荐人编号M201408060029 beg			
					Reserve1 : $.pubFunction.getCompByName("Recommender").val(),
					//V3.0.0.35   20140811-01     chenling    增加推荐人编号M201408060029 end
					//V3.0.0.29   20140403-01     huangsy     华润银行ECIF签约时需要保存传过来的contactdId beg -->
					ContactId:$.pubFunction.getCompByName("ContactId").val(),
		       		//V3.0.0.29   20140403-01     huangsy     华润银行ECIF签约时需要保存传过来的contactdId end -->
					PinpadID : $.pubFunction.getCompByName("PinpadID").val()
			};
			if(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("SIGN_CLIENT_BY_ID").equals("1")%>){
				params100001.AccType = "2";
				params100001.Account =$.pubFunction.getCompByName("IdCode").val();
				params100001.IdType = $.pubFunction.getCompByName("IdType").val()
				}
			var T100001Commit = function(data){
				if(data!=null){
					$("#authOper").val(data.warrantUser);
					$("#authPwd").val(ifmcounter.IEncrypt.AuthEnCrypt(data.warrantPass));
				}else{
					$("#authOper").val("");
					$("#authPwd").val(ifmcounter.IEncrypt.AuthEnCrypt(""));
				}
				$.pubFunction.setButtonEnable("mysubmit",false);//变灰
				f.ajaxFormSubmit(condition_submitSuccess, condition_submitFailure, function(){}, params100001);
			}

			//柜外清confirm
	        var ifconfirm = <%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("NeedConfirm", "value", "false")%>;
	        if(ifconfirm){
		        doMask("等待客户确认中...");
		      	//V3.0.0.59   20161103-01     zhouyao	盛京银行调用柜外清函数增加传值的参数，当前日期和理财还是基金的判断标识  M201610090418 beg
		      	//V3.0.0.69   20170607-01     zhangfeng   修复低柜页面打开后数据库连接数不够，造成低柜无法操作问题M201705270841 beg
		        if(!ConfirmTranInfo("100001", "0", <%=DateUtil.getSysDate()%>, "1")){
			        //V3.0.0.69   20170607-01     zhangfeng   修复低柜页面打开后数据库连接数不够，造成低柜无法操作问题M201705270841 end
		        	//V3.0.0.59   20161103-01     zhouyao	盛京银行调用柜外清函数增加传值的参数，当前日期和理财还是基金的判断标识  M201610090418 end
		        	doUnMask();
		        	return
		        }
		        doUnMask();
	        }
	        
			var paramsAuth= {FunctionId : $.pubFunction.getCompByName("FunctionId").val()};
			$.widgets.showAuthWin('T100001_pb_orgs', 'T100001_pb_orgs_def',T100001Commit,paramsAuth);
			//linxy add 20121116-01 end
		}
	});

	//返回关闭窗口
	$.pubFunction.getCompById("myreset").click (function() {
		$("#sign_org").reset();
		document.getElementById("ChannelAbleFlag").checked = undefined ;
		ChannelAbleFlag="";
		$("#cardType").val("");
		

		<%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("IsOrgClientClassVisible").equalsIgnoreCase("false")){%>
		$("#ClientClassDiv").hide();
		var def = '<%= SysConfigUtil.getSysConfig("ConstantConfig").getValue("IsOrgClientClassVisible", "default")%>';
		if(def != ""){
			athene.combo.get("display-ClientClass").setValue(def);
		}
		<%}%>
	});

	var RiskLevelName_click = function() {
		if(!<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("SIGN_CLIENT_BY_ID").equals("1")%>){
		if($.pubFunction.getCompByName("BankAcc").val()==""){
			athene.dialog.alert("请输入银行账号");
			return;
		}
		}else{
			if($.pubFunction.getCompByName("IdType").val()==""){
				athene.dialog.alert("请输入证件类型");
				return;
			}
			if($.pubFunction.getCompByName("IdCode").val()==""){
				athene.dialog.alert("请输入证件号码");
				return;
			}
			}
		if(!$.pubFunction.String2Boolean($.pubFunction.getCompByName("PasswdFlag").val())) {
		       athene.dialog.alert("未取客户资料/取客户资料失败，不能进行此交易");
		       return;
		}
		
		var clientType = ClientType;
		var ClientClass = $.pubFunction.getCompByName("ClientClass")
				.val();
		var account = $.pubFunction.getCompByName("Account").val();
		var accountType = "1";//客户号
		var prdType = "";    //业务类别默认送空
		var callback = function(options) {

			riskLevel_value = options.RiskLevel;//风险等级
			$.pubFunction.getCompByName("RiskLevelName").val(options.RiskLevelName);
			$.pubFunction.getCompByName("RiskLevelName").isValidate("sign_org");

			//add by  qudc beg 20131111-01  保存请求返回的LastScore字段 M201311080019 beg
			$.pubFunction.getCompByName("LastScore").val(options.LastScore);
			//add by  qudc end 20131111-01  保存请求返回的LastScore字段 end
			
			//add by linxy 2012-02-17 返回风险截止日期 begin 
			$.pubFunction.getCompByName("RiskDate").val(options.RiskDate);
				//如果返回风险有效日期，则显示，且风险有效月数隐藏
			if(typeof(options.RiskDate)!="undefined"&& $.trim(options.RiskDate)!=""&&options.RiskDate>"0"){
					$("#riskDateDiv").show();
					$("#riskMonthsDiv").hide();
					$.pubFunction.getCompByName("RiskDate").setValidateRules({required :true},{required:"该输入项为必输项"});
			}else{
				$("#riskDateDiv").hide();
				$("#riskMonthsDiv").show();
				$.pubFunction.getCompByName("RiskDate").setValidateRules({required :false},{required:"该输入项为必输项"});
			}
			//add by linxy 2012-02-17  end  
			// V3.0.0.42   20141225-01     chenling    根据配置开通购买四级以上的理财产品在柜台以外渠道进行默认勾选隐藏M201412220070
			if(<%=(SysConfigUtil.getSysConfig("ConstantConfig").getValue("isChannelAbleFlagShow").equals("false"))%>){
			//	$("#table-channelableflag").hide();
			//	document.getElementById("ChannelAbleFlag").checked = true ;
			}else{
			if(options.RiskLevel>=4 && <%= DictCache.getInstance().isExist("K_CPLX","1")%> ){//如果风险等级大于等于4并且业务类型支持行内理财，显示
			//	$("#table-channelableflag").show();                                           //“开通购买四级以上的理财产品在柜台以外渠道进行”复选框
				// v3.0.0.25 add by qudc 开通购买四级以上的理财产品在柜台以外渠道进行，行方要求系统在显示此选项时，系统默认是勾选状态，新增默认值控制。修改单号：M201311270024 beg
				if(<%= "true".equals(SysConfigUtil.getSysConfig("ConstantConfig").getValue("INBANK_CHANNELABLEFLAG_FIRST_SELECTED"))%>){
			//		document.getElementById("ChannelAbleFlag").checked = true ;
				}
				// v3.0.0.25 add by qudc 开通购买四级以上的理财产品在柜台以外渠道进行，行方要求系统在显示此选项时，系统默认是勾选状态，新增默认值控制。修改单号：M201311270024 end
			}else{
			//	$("#table-channelableflag").hide(); 
				// v3.0.0.25 add by qudc 开通购买四级以上的理财产品在柜台以外渠道进行，行方要求系统在显示此选项时，系统默认是勾选状态，新增默认值控制。修改单号：M201311270024 beg
			//	document.getElementById("ChannelAbleFlag").checked = undefined ;
				// v3.0.0.25 add by qudc 开通购买四级以上的理财产品在柜台以外渠道进行，行方要求系统在显示此选项时，系统默认是勾选状态，新增默认值控制。修改单号：M201311270024 end
			}
			}
		};
		//add by liangshuang 20120110 beg
		var params = {
			IdType: $.pubFunction.getCompByName("IdType").val(),
			IdCode: $.pubFunction.getCompByName("IdCode").val(),
			ClientNo: Account,
			BankAcc:$.pubFunction.getCompByName("BankAcc").val(),
			ClientName:$("#clientName").val()
		}
		//add by liangshuang 20120110 end
		$.widgets.showRiskPaperWin(clientType, ClientClass, prdType,
				accountType, Account, params, callback);
	};

	//V3.0.0.68   20170524-01     wangyj      证券期货投资者适当性管理办法 M201705230053 beg
	var InvestorTypeName_click = function() {
		if(!<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("SIGN_CLIENT_BY_ID").equals("1")%>){
		if($.pubFunction.getCompByName("BankAcc").val()==""){
			athene.dialog.alert("请输入银行账号");
			return;
		}
		}else{
			if($.pubFunction.getCompByName("IdType").val()==""){
				athene.dialog.alert("请输入证件类型");
				return;
			}
			if($.pubFunction.getCompByName("IdCode").val()==""){
				athene.dialog.alert("请输入证件号码");
				return;
			}
			}
		if(!$.pubFunction.String2Boolean($.pubFunction.getCompByName("PasswdFlag").val())) {
		       athene.dialog.alert("未取客户资料/取客户资料失败，不能进行此交易");
		       return;
		}
		
		var clientType = ClientType;
		var ClientClass = $.pubFunction.getCompByName("ClientClass")
				.val();
		var account = $.pubFunction.getCompByName("Account").val();
		var accountType = "1";//客户号
		var prdType = "";    //业务类别默认送空
		var callback = function(options) {
			investorType_value = options.InvestorType;//投资类型	
			$.pubFunction.getCompByName("InvestorTypeName").val(options.InvestorTypeName);
			investorDate_value = options.InvestorDate;//投资者类型有效截止日
			$.pubFunction.getCompByName("InvestorDateName").val(options.InvestorDateName);
		};
		var params = {
			IdType: $.pubFunction.getCompByName("IdType").val(),
			IdCode: $.pubFunction.getCompByName("IdCode").val(),
			ClientNo: Account,
			BankAcc:$.pubFunction.getCompByName("BankAcc").val(),
			ClientName:$("#clientName").val()
		}
		$.widgets.showKnowPaperWin(clientType, ClientClass, prdType,
				accountType, Account, params, callback);
	};
	//V3.0.0.68   20170524-01     wangyj      证券期货投资者适当性管理办法 M201705230053 end

	
	//发送方式级联
	$.pubFunction.getCompByName("SendMode").change = function() {
		SendModeCascade();
	};


	//格式化日期
    function parseDate(dateStringInRange) {  
        var isoExp = /^\s*(\d{4})-(\d\d)-(\d\d)\s*$/,  
            date = new Date(NaN), month,  
            parts = isoExp.exec(dateStringInRange);  
  
        if(parts) {  
            month = +parts[2];  
            date.setFullYear(parts[1], month - 1, parts[3]);  
            if(month != date.getMonth() + 1) {  
                date.setTime(NaN);  
            }  
        }  
        return date;  
    }  
	//V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299 beg
	//根据身份证号获取年龄
	function getAgeByIdCode0(IdType, IdCode) {
		IdCode.setValidateRules({maxlength :<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdentificationCardMaxlength"))?"18":SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdentificationCardMaxlength")%>},{maxlength:"身份证号码长度不合法"});
		IdCode.setValidateRules({minlength :<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdentificationCardMinlength"))?"15":SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdentificationCardMinlength")%>},{minlength:"身份证号码长度不合法"});
		var BirthdayNameString = $.pubFunction.getBirthdayFromCard(
				IdType.val(), 
				IdCode.val());
		var BirthdayName = BirthdayNameString.substring(0,4)+"-"+  
		BirthdayNameString.substring(5,7)+"-"+  
		BirthdayNameString.substring(8,10);
		//var BirthdayYear =parseInt(BirthdayNameString.substring(0,4));
		var diff =  parseInt(24 * 60 * 60 * 1000 * 365);
		var NewDate = new Date();
		var BirthDate =parseDate(BirthdayName);
		return Math.floor((NewDate.getTime()-BirthDate.getTime())/diff);
	}
	//V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299 end
	
	//刷卡器准备就绪
	 $.pubFunction.getCompById("bankacc").live("focus", function() {
	         if (<%=(SysConfigUtil.getSysConfig("ConstantConfig").getValue("orgClientReadCardNoOrBankbookNoMode").equals("true"))%>) {
		          	if($("#combobox-SKFS").val()=='1'){//刷IC卡
			    		OrgICCardReady("bankacc");
			    	}else{
			    		OrgBankCardReady("bankacc");
			    	}
	         }
	 });

		var multiClientManager_click =  function() {
			var callback = function (result){
				$.pubFunction.getCompByName("MultiClientManager").val(result);
				$I("targetselect-MultiClientManager").isValidate("sign_org");
			};
			//modify by linxy 2013-01-31-01 begin
			//var options= {width:600,height:300,querystring:$.pubFunction.getCompByName("MultiClientManager").val()};
			var options= {width:600,height:300,
					querystring:$.pubFunction.getCompByName("MultiClientManager").val(),
					PrdType:'Z',
					ClientType:'0'
			};
			//modify by linxy 2013-01-31-01 end
			$.widgets.showMultiClientManagerWin(options,callback);
		};
//V3.0.0.36   20140915-01     chenling     推荐人校验 M201409010024 beg
$.pubFunction.getCompByName("Recommender").live("blur",function(){
	var params = {
			resCode : "getRecommenderInfo",
			opCode : "getRecommenderInfoQuery",
			recommenderCode : $.pubFunction.getCompByName("Recommender").val()
		};
	var Success = function(result) {

		if (result.returnCode != 0) {
			athene.dialog.alert("取该推荐人信息失败" + "<br>" + "错误码：" + result.errorNo
					+ "<br>" + "错误信息：" + result.errorInfo);
			$.pubFunction.getCompByName("Recommender").val("");
			return;
		}

		var flag = result.dataSetResult[0].data[0].ErrorNo;
		if (flag != "0000") {
			athene.dialog.alert("取该推荐人信息失败" + "<br>" + "错误码："
					+ result.dataSetResult[0].data[0].ErrorNo + "<br>"
					+ "错误信息：" + result.dataSetResult[0].data[0].ErrorInfo);
			$.pubFunction.getCompByName("Recommender").val("");
			return;
		}
		// add by  huangjing     平顶山银行添加“推荐人编号”字段并反显推荐人名称 M201609281112  beg 
		$.pubFunction.getCompByName("recommenderName").val(result.dataSetResult[0].data[0].recommenderName);
		// add by  huangjing     平顶山银行添加“推荐人编号”字段并反显推荐人名称 M201609281112  end
	}
	var Failure = function(response) {
		$.pubFunction.call_method_failure(response);
	}
	var serviceURL = window.ctxPath+"ifmcounter.pub.query.GetRecommenderInfoService.service";
	$.pubFunction.asynExecute(serviceURL, params, Success,Failure, "正在取该推荐人信息，请稍等...");

	});
//V3.0.0.56   20161005-01     huangjing   平顶山银行反显客户经理名称   M201609270910 beg
$.pubFunction.getCompByName("ClientManager").live("blur",function(){
	//V3.0.0.62   20161114-01     huangjing   增加参数控制是否校验客户经理编号  M201609270910 beg
	if(<%=SysConfigUtil.getSysConfig().getValue("isCheckManagerNo","value","0")%>=='0'){
		return;
	}
	//V3.0.0.62   20161114-01     huangjing   增加参数控制是否校验客户经理编号  M201609270910 end
	var params = {
			resCode : "getClientManagerInfo",
			opCode : "getClientManagerInfoQuery",
			clientManagerCode : $.pubFunction.getCompByName("ClientManager").val()
	};
	var Success = function(response) {
		if (typeof(response) != 'object') {
			response = eval('(' + response + ')');
		}
		if ($.pubFunction.call_method_handler("取客户经理信息发生错误",response)) {
			var result = response.dataSetResult[0].data[0];
			var managerName = $.trim(result.managerName);
			if(managerName == ""){
				athene.dialog.alert("该客户经理或关系人不存在");
				$.pubFunction.getCompByName("ClientManager").val("");
			}else{
				$.pubFunction.getCompByName("ManagerName").val(managerName);
			}
		}
	}
	var Failure = function(response) {
		$.pubFunction.call_method_failure(response); 
	}
	var serviceURL = window.ctxPath+"ifmcounter.pub.query.GetClientManagerInfoService.service";
	$.pubFunction.asynExecute(serviceURL,params,Success,Failure,"正在验证客户经理信息，请稍后...");
});
//V3.0.0.56   20161005-01     huangjing   平顶山银行反显客户经理名称   M201609270910 end
var ReprIdTypeSelectEvent = function(item){
	if($.pubFunction.getCompByName("ReprIdType").val()== "0" ){
    	$.pubFunction.getCompByName("ReprIdCode").setValidateRules({maxlength :<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdentificationCardMaxlength"))?"18":SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdentificationCardMaxlength")%>},{maxlength:"身份证号码长度不合法"});
    	$.pubFunction.getCompByName("ReprIdCode").setValidateRules({minlength :<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdentificationCardMinlength"))?"15":SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdentificationCardMinlength")%>},{minlength:"身份证号码长度不合法"});
    	$.pubFunction.getCompByName("ReprIdCode").setValidateRules({regexp :ifmcounter.PubConstant.IdentificationCard},{regexp:ifmcounter.PubConstant.IdentificationCardText});
	}else{
		$.pubFunction.getCompByName("ReprIdCode").setValidateRules({maxlength :32},{maxlength:"输入信息过长"});
    	$.pubFunction.getCompByName("ReprIdCode").setValidateRules({minlength :0},{minlength:"请输入信息"});
    	$.pubFunction.getCompByName("ReprIdCode").setValidateRules({regexp :ifmcounter.PubConstant.IdCode},{regexp:ifmcounter.PubConstant.IdCodeText});
	}
	$.pubFunction.getCompByName("ReprIdCode").isValidate("sign_org");
}

//V3.0.0.36   20140915-01     chenling     推荐人校验 M201409010024 beg		
		//V3.0.0.22   20130704-01     M201307040008 BEG
		var ActorIdTypeSelectEvent = function(item){
			if($.pubFunction.getCompByName("ActorIdType").val()== "0" ){
		    	$.pubFunction.getCompByName("ActorIdCode").setValidateRules({maxlength :<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdentificationCardMaxlength"))?"18":SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdentificationCardMaxlength")%>},{maxlength:"身份证号码长度不合法"});
		    	$.pubFunction.getCompByName("ActorIdCode").setValidateRules({minlength :<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdentificationCardMinlength"))?"15":SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdentificationCardMinlength")%>},{minlength:"身份证号码长度不合法"});
		    	$.pubFunction.getCompByName("ActorIdCode").setValidateRules({regexp :ifmcounter.PubConstant.IdentificationCard},{regexp:ifmcounter.PubConstant.IdentificationCardText});
			}else{
				$.pubFunction.getCompByName("ActorIdCode").setValidateRules({maxlength :32},{maxlength:"输入信息过长"});
		    	$.pubFunction.getCompByName("ActorIdCode").setValidateRules({minlength :0},{minlength:"请输入信息"});
		    	$.pubFunction.getCompByName("ActorIdCode").setValidateRules({regexp :ifmcounter.PubConstant.IdCode},{regexp:ifmcounter.PubConstant.IdCodeText});
			}
			$.pubFunction.getCompByName("ActorIdCode").isValidate("sign_org");
		}

		var LinkIdTypeSelectEvent = function(item){
			if($.pubFunction.getCompByName("LinkIdType").val()== "0" ){
		    	$.pubFunction.getCompByName("LinkIdCode").setValidateRules({maxlength :<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdentificationCardMaxlength"))?"18":SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdentificationCardMaxlength")%>},{maxlength:"身份证号码长度不合法"});
		    	$.pubFunction.getCompByName("LinkIdCode").setValidateRules({minlength :<%=DataUtil.isNullStr(SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdentificationCardMinlength"))?"15":SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdentificationCardMinlength")%>},{minlength:"身份证号码长度不合法"});
		    	$.pubFunction.getCompByName("LinkIdCode").setValidateRules({regexp :ifmcounter.PubConstant.IdentificationCard},{regexp:ifmcounter.PubConstant.IdentificationCardText});
			}else{
				$.pubFunction.getCompByName("LinkIdCode").setValidateRules({maxlength :32},{maxlength:"输入信息过长"});
		    	$.pubFunction.getCompByName("LinkIdCode").setValidateRules({minlength :0},{minlength:"请输入信息"});
		    	$.pubFunction.getCompByName("LinkIdCode").setValidateRules({regexp :ifmcounter.PubConstant.IdCode},{regexp:ifmcounter.PubConstant.IdCodeText});
			}
			$.pubFunction.getCompByName("LinkIdCode").isValidate("sign_org");
		}
		//V3.0.0.22   20130704-01     M201307040008 END
		
		//V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299 beg
		//由身份证刷新出生日期
		//刷新法人出生日期
		var setReprBith = function(){
			if($.pubFunction.getCompByName("ReprIdType").val()== "0"){	//法人代表身份证
				$.pubFunction.getCompByName("ReprAge").val(getAgeByIdCode0($.pubFunction.getCompByName("ReprIdType"), $.pubFunction.getCompByName("ReprIdCode")));
			var BirthdayNameString = $.pubFunction.getBirthdayFromCard(
					$.pubFunction.getCompByName("ReprIdType").val(), 
					$.pubFunction.getCompByName("ReprIdCode").val());
			var BirthdayName = BirthdayNameString.substring(0,4) +  
			BirthdayNameString.substring(5,7) +
			BirthdayNameString.substring(8,10);
			$.pubFunction.getCompById("display-ReprBirthday").val(BirthdayNameString);
			$.pubFunction.getCompById("datefield-ReprBirthday").val(BirthdayName);
			}
			}
		var setActorBith=function(){
			if($.pubFunction.getCompByName("ActorIdType").val()== "0"){	//经办人身份证
				$.pubFunction.getCompByName("ActorAge").val(getAgeByIdCode0($.pubFunction.getCompByName("ActorIdType"), $.pubFunction.getCompByName("ActorIdCode")));
			var BirthdayNameString = $.pubFunction.getBirthdayFromCard(
					$.pubFunction.getCompByName("ActorIdType").val(), 
					$.pubFunction.getCompByName("ActorIdCode").val());
			var BirthdayName = BirthdayNameString.substring(0,4) +  
			BirthdayNameString.substring(5,7) +
			BirthdayNameString.substring(8,10);
			$.pubFunction.getCompById("display-ActorBirthday").val(BirthdayNameString);
			$.pubFunction.getCompById("datefield-ActorBirthday").val(BirthdayName);
			}
			}
	$.pubFunction.getCompByName("ReprIdCode").blur(setReprBith);

	$.pubFunction.getCompByName("ActorIdCode").blur(setActorBith);

	$.pubFunction.getCompById("display-ReprBirthday").blur(
			function() {
				var BirthdayNameString1 = $.pubFunction.getCompById("display-ReprBirthday").val();
				//var BirthdayYear1 =parseInt(BirthdayNameString1.substring(0,4));
				//$.pubFunction.getCompByName("ReprAge").val(<%=initDate%> - BirthdayYear1);
				var BirthdayDate = parseDate(BirthdayNameString1);
				var newDate = new Date();
				var diffDate = Math.floor((newDate.getTime() - BirthdayDate.getTime())/(24*60*60*1000*365));
				$.pubFunction.getCompByName("ReprAge").val(diffDate);
			});

	$.pubFunction.getCompById("display-ActorBirthday").blur(
			function() {
				var BirthdayNameString1 = $.pubFunction.getCompById("display-ActorBirthday").val();
				//var BirthdayYear1 =parseInt(BirthdayNameString1.substring(0,4));
				//$.pubFunction.getCompByName("ActorAge").val(<%=initDate%> - BirthdayYear1);
				var BirthdayDate = parseDate(BirthdayNameString1);
				var newDate = new Date();
				var diffDate = Math.floor((newDate.getTime() - BirthdayDate.getTime())/(24*60*60*1000*365));
				$.pubFunction.getCompByName("ActorAge").val(diffDate);
			});

	//V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299 end
	    // 20170927-01     hutao       理财系统与报备系统对接修改 M201709251328 beg
		var idTypeSelectEvent = function(item){
			if(<%=ParamCache.getInstance().getSysParamValue(IParamConstant.SUPPORT_FIRS, "false").equals("true") %>){
				if($.pubFunction.getCompByName("IdType").val()== "I" ){
					$.pubFunction.getCompById("HostToFirIdTypeDiv").show();
					$.pubFunction.getCompByName("HostToFirIdType").rules("add",{required:true,maxlength:60,messages:{required:"该输入项为必输项"}});		
				}else{
					$.pubFunction.getCompByName("HostToFirIdType").rules("remove");
					$.pubFunction.getCompById("display-HostToFirIdType").val("");
					$.pubFunction.getCompByName("HostToFirIdType").val("");
					$.pubFunction.getCompById("HostToFirIdTypeDiv").hide();
					$.pubFunction.getCompByName("OtherIdTypeName").rules("remove");
					$.pubFunction.getCompByName("OtherIdTypeName").val("");
					$.pubFunction.getCompById("OtherIdTypeNameDiv").hide();				
				}
			}	
		}
		var HostToFirIdTypeSelectEvent = function(item){
			if(<%=ParamCache.getInstance().getSysParamValue(IParamConstant.SUPPORT_FIRS, "false").equals("true") %>){
				if($.pubFunction.getCompByName("HostToFirIdType").val() =='<%=otherHostIdType %>'){
					$.pubFunction.getCompById("OtherIdTypeNameDiv").show();
					$.pubFunction.getCompByName("OtherIdTypeName").rules("add",{required:true,maxlength:60,messages:{required:"该输入项为必输项"}});		
				}else{
					$.pubFunction.getCompByName("OtherIdTypeName").rules("remove");
					$.pubFunction.getCompByName("OtherIdTypeName").val("");
					$.pubFunction.getCompById("OtherIdTypeNameDiv").hide();
				}
				
			}
		}
        //	20170927-01     hutao       理财系统与报备系统对接修改 M201709251328 end

		//配置参数初始化
		$(function(){
			athene.combo.get("display-IdType").setReadOnly(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("IdReadonly")%>);
			athene.combo.get("display-ReprIdType").setReadOnly(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("ReprIdReadonly").equalsIgnoreCase("true")%>);
			athene.combo.get("display-ClientClass").setReadOnly(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("ClientClassReadonly")%>);
			//对账单寄送频率，不寄送
			//athene.combo.get("display-SendFreq").setValue(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("SendFreq","value","2")%>);
			//added zhanglm 20121213 参数控制对账单寄送频率是否可编辑 beg
			//athene.combo.get("display-SendFreq").setReadOnly(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("SendFreqReadOnly","value","false")%>);
			//added zhanglm 20121213 参数控制对账单寄送频率是否可编辑 end
			//是否短信通知，默认不需要
			//athene.combo.get("display-InformNote").setValue("0");
			//$.pubFunction.getCompByName("SendMode").val($.pubFunction.send_mode_rollback_handler("<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("SendMode","value","10000000")%>"));
			///$.pubFunction.setCheckBoxGroup("DisplaySendMode",$.pubFunction.send_mode_rollback_handler("<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("SendMode","value","10000000")%>"));
			
			
			//多客户经理必输提示符*,根据配置动态显示或者隐藏
			<%if(!SysConfigUtil.getSysConfig("ConstantConfig").getValue("IsSignClientManagerAllowBlank").equalsIgnoreCase("true")){%>
				$("#multiClientManager > td > pre > span").html("*");
			<%}else{%>
				$("#multiClientManager > td > pre > span").html("");
			<%}%>

			//linxy add at 2012-02-16 是否根据配置显示客户组别begin
			<%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("IsOrgClientClassVisible").equalsIgnoreCase("false")){%>
				$("#ClientClassDiv").hide();
				var def = '<%= SysConfigUtil.getSysConfig("ConstantConfig").getValue("IsOrgClientClassVisible", "default")%>';
				if(def != ""){
					athene.combo.get("display-ClientClass").setValue(def);
				}
			<%}%>
			//linxy add at 2012-02-16  end			
			//V3.0.0.52   20160803-01     youwh       增加配置,客户组别支持从理财系统中获取  M201606211093 beg
			<%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("IsClientClassEditable").equalsIgnoreCase("false")){%>
			athene.combo.get("display-ClientClass").setEditable(false);
			athene.combo.get("display-ClientClass").setReadOnly(true);
			<%}%>
			//V3.0.0.52  20160803-01     youwh       增加配置,客户组别支持从理财系统中获取  M201606211093 end
			//V3.0.0.34 add by chenling    20140803   根据配置显示发送频率和对账单发送方式字段   M201407110010 beg	
			if(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("IsSendFreqVisible").equals("false")%>){ 
				$.pubFunction.getCompById("SendFreqDiv").hide();
				$("#table-SendMode").hide();
			}
			//V3.0.0.34 add by chenling    20140803   根据配置显示发送频率和对账单发送方式字段   M201407110010 end	
			
			//2012-03-30  添加刷卡方式初始化
			if(<%=(SysConfigUtil.getSysConfig().getValue("IsORGSKFSEnable").equals("true"))%> ){
				$.pubFunction.getCompById("skfsDiv").show();
				if(<%=(SysConfigUtil.getSysConfig().getValue("DefaultSKFS").equals(""))%> ){//如果没配置默认刷卡方式则默认成0
					athene.combo.get("display-SKFS").setValue("0");
				}else{
					athene.combo.get("display-SKFS").setValue(<%=SysConfigUtil.getSysConfig().getValue("DefaultSKFS")%>);
				}
			}
			if(<%=(SysConfigUtil.getSysConfig().getValue("PrdTypesMode").equals("true"))%>){
				$.pubFunction.getCompById("table-PrdTypes").show();
				}
			if(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("SIGN_CLIENT_BY_ID").equals("1")%>){
				$.pubFunction.getCompByName("IdCode").bind("blur",IdCodeMode);
				}
			// V3.0.0.37   20140917-01     chenling     根据配置从核心取回信息是否可修改M201409160043 beg
			if(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("T100001ReadOnly","address","false").equalsIgnoreCase("true")%>){
				$.pubFunction.getCompByName("Address").attr("readonly","readonly");
				$.pubFunction.getCompByName("Address").addClass("ux-item-readOnly");
				}
			if(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("T100001ReadOnly","postCode","false").equalsIgnoreCase("true")%>){
				$.pubFunction.getCompByName("PostCode").attr("readonly","readonly");
				$.pubFunction.getCompByName("PostCode").addClass("ux-item-readOnly");
				}
			if(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("T100001ReadOnly","tel","false").equalsIgnoreCase("true")%>){
				$.pubFunction.getCompByName("Tel").attr("readonly","readonly");
				$.pubFunction.getCompByName("Tel").addClass("ux-item-readOnly");
				}
			if(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("T100001ReadOnly","fax","false").equalsIgnoreCase("true")%>){
				$.pubFunction.getCompByName("Fax").attr("readonly","readonly");
				$.pubFunction.getCompByName("Fax").addClass("ux-item-readOnly");
				}
			if(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("T100001ReadOnly","mobile","false").equalsIgnoreCase("true")%>){
				$.pubFunction.getCompByName("Mobile").attr("readonly","readonly");
				$.pubFunction.getCompByName("Mobile").addClass("ux-item-readOnly");
				}
			if(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("T100001ReadOnly","email","false").equalsIgnoreCase("true")%>){
				$.pubFunction.getCompByName("Email").attr("readonly","readonly");
				$.pubFunction.getCompByName("Email").addClass("ux-item-readOnly");
				}
			// V3.0.0.37   20140917-01     chenling     根据配置从核心取回信息是否可修改M201409160043 end
			
			if(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("T100001Hidden","fax","false").equalsIgnoreCase("true")%>){
				$("#tdFax").hide();
			}
			
			if(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("T100001Hidden","email","false").equalsIgnoreCase("true")%>){
				$("#tdEmail").hide();
			}
			if(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("T100001Hidden","linkman","false").equalsIgnoreCase("true")%>){
				$("#trLinkman").hide();
			}
			if(<%=SysConfigUtil.getSysConfig("ConstantConfig").getValue("T100001Hidden","postcode","false").equalsIgnoreCase("true")%>){
				$("#tdPostCode").hide();
			}
			
			//V3.0.0.55   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617 beg
			<%if(DictCache.getInstance().isExist("K_CPLX","A")){%>
				if(bankSaveKHLBMX == "1"){
					athene.combo.get("display-ClientTypeDetail").setEditable(false);
					athene.combo.get("display-ClientTypeDetail").setReadOnly(true);
					$("#clientTypeDetailDiv").hide();
				}
			<%}%>
			//V3.0.0.55   20151127-01     zhouxy      综合理财3.0大额存单子模块移植 M201512020617 end

			//若配置为不需要评定风险等级，则去掉*号
			<%if(!SysConfigUtil.getSysConfig("ConstantConfig").getValue("IsCheckRiskLevel0").equalsIgnoreCase("true")){%>
				//$("#RiskLevelNameDiv > table > tbody > tr > td > pre > span").html("");
			<%}%>
			//是否隐藏机构投资人类型
			<%if(SysConfigUtil.getSysConfig("ConstantConfig").getValue("InstTypeHidden").equalsIgnoreCase("true")){%>
				$.pubFunction.getCompByName("InstType").setValidateRules({required:false},{required:"该输入项为必输项"});
				$.pubFunction.getCompById("tdInstType").hide();

			<%}%>
			//V3.0.0.72   20170703-01     huzd       海口银行增加自动签约M201706230266 beg
			<%if("true".equals(isAutoSignFlag)){%>
			$.pubFunction.getCompByName("BankAcc").val("<%=bankAccTemp%>");
			$.pubFunction.getCompByName("BankAcc").blur();
			
			<%}%>
			<%if(("false").equals(SysConfigUtil.getSysConfig("ConstantConfig").getValue("IsSignKeyWordsEditable"))){%>
			athene.combo.get("display-IdType").setEditable(false);
			athene.combo.get("display-IdType").setReadOnly(true);
			$.pubFunction.getCompByName("IdCode").attr("readonly","readonly");
			$.pubFunction.getCompByName("IdCode").addClass("ux-item-readOnly");
			$.pubFunction.getCompByName("ClientName").attr("readonly","readonly");
			$.pubFunction.getCompByName("ClientName").addClass("ux-item-readOnly");
			athene.combo.get("display-ClientClass").setEditable(false);
			athene.combo.get("display-ClientClass").setReadOnly(true);
			<%}%>
			//V3.0.0.72   20170703-01     huzd       海口银行增加自动签约M201706230266 end
			//V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299 beg
			<%if(!"true".equals(SysConfigUtil.getSysConfig("ConstantConfig").getValue("isBusiScopeAllowBlank","value","true"))){%>
				$("#busiscope > td > pre > span").html("*");
			<%}else{%>
				$("#busiscope > td > pre > span").html("");
			<%}%>
			<%if(!"true".equals(SysConfigUtil.getSysConfig("ConstantConfig").getValue("isInstAttrAllowBlank","value","true"))){%>
				$("#instattr > td > pre > span").html("*");
			<%}else{%>
				$("#instattr > td > pre > span").html("");
			<%}%>
			//V3.0.0.71   20170626-01     wangyj      投资者适当性管理办法客户信息完善 M201706260299 end
            $.pubFunction.getCompByName("ClientManager").val("<%=userinfo.getUserId()%>");
			
		});

        
		 adjustScrollPage();



</script>
<!-- 引入OCX对象,调用serial.jsp生成 -->
<jsp:include page="<%=\"/\"+SysConfigUtil.getSysConfig().getValue(\"OCX_URL\")%>" flush="true"></jsp:include>
</body>
</html>