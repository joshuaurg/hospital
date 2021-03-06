<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/context/common.jsp"%>
<!DOCTYPE>
<html>
<head>
<title>医院列表</title>
</head>
<body>
<%@ include file="/WEB-INF/pages/back/common/head.jsp"%>
<%@ include file="/WEB-INF/pages/back/common/menu.jsp"%>
<div id="page-wrapper" class="gray-bg">
    <div class="row wrapper border-bottom white-bg page-heading">
         <div class="col-lg-10">
             <h2>医院列表</h2>
             <ol class="breadcrumb">
                 <li><a href="${ctx}">首页</a></li>
                 <li class="active">医院列表</li>
             </ol>
         </div>
         <div class="col-lg-2 pull-right" style="margin-top: 30px;">
    		
    	</div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
       <div class="row">
	 		<div class="col-sm-2">
		 		<select class="form-control m-b" onchange="getCity()" id="pSel">
		 				<c:forEach items="${plist }" var="p">
		 				 <option value="${p.id }">${p.name }</option>
		 				</c:forEach>
	               	</select>
	  		</div>	
	 		<div class="col-sm-2">
		 		<select class="form-control m-b" id="citySel" onchange="getCounty()"><option value='-1'>-请选择-</option></select>
	  		</div>	
	 		<div class="col-sm-2">
		 		<select class="form-control m-b" id="countySel"><option value='-1'>-请选择-</option></select>
	  		</div>	
	  		<button  class="btn btn-w-m btn-success" onclick="getHospital()">查询</button>
	  		<button type="button" class="btn btn-w-m btn-success" onclick="addHospital()">添加医院</button>
       </div>
       <div class="row">
       		<div class="col-lg-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>医院列表</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>医院名称</th>
                            </tr>
                            </thead>
                            <tbody id="hospitalList"></tbody>
                        </table>
                    </div>
                </div>
            </div>
       </div>
    </div>
</div>
</body>
<script type="text/javascript">
	$(function(){
		$.ajax({
	 		type : "post",
			url : "${ctx}/back/getCity",
			async : false,
			dataType : "json",
			data : {
				p : 1
			},
			success : function(data){
				for(var i=0;i<data.length;i++){
					var id = data[i].id;
					var name = data[i].name;
					var option = "<option value='"+id+"'>"+name+"</option>";
					$("#citySel").append(option);
				}
			}
	 	});
		
		$.ajax({
	 		type : "post",
			url : "${ctx}/back/getCounty",
			async : false,
			dataType : "json",
			data : {
				cid : 1
			},
			success : function(data){
				for(var i=0;i<data.length;i++){
					var id = data[i].id;
					var name = data[i].name;
					var option = "<option value='"+id+"'>"+name+"</option>";
					$("#countySel").append(option);
				}
			}
	 	});
	})
	function getCity(){
		$("#citySel").html("");
		$("#countySel").html("");
		var p = $("#pSel").find("option:selected").val();
		$.ajax({
	 		type : "post",
			url : "${ctx}/back/getCity",
			async : false,
			dataType : "json",
			data : {
				p : p
			},
			success : function(data){
				for(var i=0;i<data.length;i++){
					var id = data[i].id;
					var name = data[i].name;
					var option = "<option value='"+id+"'>"+name+"</option>";
					$("#citySel").append(option);
				}
			}
	 	});
	}
	function getCounty(){
		$("#countySel").html("");
		var p = $("#citySel").find("option:selected").val();
		$.ajax({
	 		type : "post",
			url : "${ctx}/back/getCounty",
			async : false,
			dataType : "json",
			data : {
				cid : p
			},
			success : function(data){
				for(var i=0;i<data.length;i++){
					var id = data[i].id;
					var name = data[i].name;
					var option = "<option value='"+id+"'>"+name+"</option>";
					$("#countySel").append(option);
				}
			}
	 	});
	}
	
	function getHospital(){
		var p = $("#pSel").find("option:selected").val();
		var c = $("#citySel").find("option:selected").val();
		var t = $("#countySel").find("option:selected").val();
		var params = p+"-"+c+"-"+t;
		$.ajax({
	 		type : "post",
			url : "${ctx}/back/getHospital",
			async : false,
			dataType : "json",
			data : {
				params : params
			},
			success : function(data){
				$("#hospitalList").html("");
				if(data!=null&&data.length>0){
					for(var i=0;i<data.length;i++){
						var hospital = data[i].hospital;
						var option = "<tr><td>"+i+1+"</td><td>"+hospital+"</td></tr>";
						$("#hospitalList").append(option);
					}
				}else{
					$("#hospitalList").html("暂无医院");
				}
			}
	 	});
	}
	function addHospital(){
		window.location.href ="${ctx}/back/addHospital";
	}
</script>
</html>