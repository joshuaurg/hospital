<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/context/common.jsp"%>
<!DOCTYPE>
<html>
<head>
<title>患者详情</title>
</head>
<style type="text/css">
	.pdiv{margin-left: 30px;margin-top:20px;font-size: 17px;}
</style>
<body>
<%@ include file="/WEB-INF/pages/back/common/head.jsp"%>
<%@ include file="/WEB-INF/pages/back/common/menu.jsp"%>
<div id="page-wrapper" class="gray-bg">
    <div class="row wrapper border-bottom white-bg page-heading">
         <div class="col-lg-10">
             <h2>患者列表</h2>
             <ol class="breadcrumb">
                 <li><a href="${ctx}/back/home">首页</a></li>
                 <li class="active">患者详情</li>
             </ol>
         </div>
         <div class="col-lg-2 pull-right" style="margin-top: 30px;">
    	</div>
    </div>
    <div class="wrapper wrapper-content animated">
		<div class="ibox float-e-margins white-bg" >
		<div class="row show-grid">
	         <div class="col-md-1 text-right">用户名：</div>
	         <div class="col-md-1">
	         	${p.username }
	         </div>
	          <div class="col-md-1 text-right">姓名：</div>
	         <div class="col-md-1">
	         	${p.name }
	         </div>
	         <div class="col-md-1 text-right">性别：</div>
	         <div class="col-md-1">
	         	${p.agender }
	         </div>
	     </div>
		<div class="row show-grid">
	         <div class="col-md-1 text-right">体重：</div>
	         <div class="col-md-1">
	         	 ${p.weight }kg
	         </div>
	          <div class="col-md-1 text-right">手机号：</div>
	         <div class="col-md-1">
	         	${p.mobile }
	         </div>
	         <div class="col-md-1 text-right"> 出生日期：</div>
	         <div class="col-md-1">
	         	${p.birthday }
	         </div>
	     </div>
		<div class="row show-grid">
	         <div class="col-md-1 text-right"> 患者积分</div>
	         <div class="col-md-1">
	         	${p.score }
	         </div>
	         <div class="col-md-1 text-right"> 注册日期：</div>
	         <div class="col-md-2">
	         	${p.registerTime }
	         </div>
	     </div>
		<div class="row show-grid">
	         <div class="col-md-1 text-right">病史备注</div>
	         <div class="col-md-11">
	         	${p.illProfile }
	         </div>
	     </div>
		<div class="row show-grid">
		 <div class="col-md-1 text-right"></div>
	         <div class="col-md-7">
	         	<button class="btn btn-w-m  btn-success" type="button" onclick="updatePatient('${p.userId }')">编辑</button>
	         </div>
	     </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
	function updatePatient(id){
		window.location.href = "${ctx}/back/patient/updatePatientView?id="+id;
		
	}
</script>
</html>