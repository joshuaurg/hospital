<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/context/common.jsp"%>
<!DOCTYPE>
<html>
<head>
<title>新建学术活动</title>
</head>
<style type="text/css">
	#content{}
	#meeting{margin: 0 0 0 70px;}
	#meeting .row{margin: 10px 0 20px 20px;}
</style>
<body>
<%@ include file="/WEB-INF/pages/back/common/head.jsp"%>
<%@ include file="/WEB-INF/pages/back/common/menu.jsp"%>
<div id="page-wrapper" class="gray-bg">
    <div class="row wrapper border-bottom white-bg page-heading">
         <div class="col-lg-10">
             <h2>新建学术活动</h2>
         </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
   	   <form class="form-inline" enctype="multipart/form-data" id="meetingform" action="${ctx }/back/doctor/academicSupport/add" method="post">
	       <div class="row">
	          <div class="col-lg-12" id="meeting">
	          	  <div class="row">
	                  <div class="form-group">
	                      <label >会议标题：</label>
	                      <input type="text" name="title" class="form-control">
	                  </div>
	                  <div class="form-group" style="margin-left: 100px;">
	                      <label for="exampleInputPassword2">会议状态：</label>
	                      <select class="form-control" name="type">
	                      	<option value="0">近期会议</option>
	                      	<option value="1">往期会议</option>
	                      </select>
	                  </div>
                  </div>
	          	  <div class="row">
   	  				<label>新建时间：</label>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                             <input type="text" name="creTime" class="form-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
                        </div>
                    </div>
                  </div>
                  
                  <div class="row">
   	  				<label>宣传图片：</label>
                    <div class="form-group">
                        <div class="input-group">
                             <input type="file" name="promoteImage" class="form-control">
                        </div>
                    </div>
                  </div>
                  
	          	  <div class="row">
	                  <div class="form-group">
	                      <label >参会积分：</label>
	                      <input type="text" name="score" class="form-control">分
	                  </div>
                  </div>
	          	  <div class="row">
	                  <div class="form-group">
	                      <div class="control-label" style="float: left;">会议内容</div>
	                      <div class="col-lg-10" id="contentDiv" >
                                   	
                          </div>
                          <input type="hidden" name="content" id="content" />
	                  </div>
                  </div>
	          	  <div class="row">
	          	  <div class="form-group col-lg-10">
	                  <button style="width:130px"  class="btn btn-success pull-right" id="btnPost">提交</button>
                  </div>
                  </div>
	          </div>
	        </div>
        </form>
    </div>
</div>
</body>
<script type="text/javascript">
	$(function(){
		var ue = UE.getEditor('contentDiv',{
	         initialFrameHeight:800
	     });
	     
		$("#btnPost").on("click",function(){
			$("#content").val(UE.getEditor('contentDiv').getContent());
			$("#meetingform").submit();
		});
	});
</script>
</html>