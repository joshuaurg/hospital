<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/context/common.jsp"%>
<!DOCTYPE>
<html>
<head>
<title>医生列表</title>
</head>
<meta charset="UTF-8">
<body>
<%@ include file="/WEB-INF/pages/back/common/head.jsp"%>
<%@ include file="/WEB-INF/pages/back/common/menu.jsp"%>
<div id="page-wrapper" class="gray-bg">
    <div class="row wrapper border-bottom white-bg page-heading">
         <div class="col-lg-10">
             <h2>患者列表</h2>
             <ol class="breadcrumb">
                 <li><a href="${ctx}/back/home">首页</a></li>
                 <li class="active">患者列表</li>
             </ol>
         </div>
         <div class="col-lg-2 pull-right" style="margin-top: 30px;">
    	</div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
       <div class="row">
          <div class="col-lg-12">
				<div class="ibox float-e-margins">
                       <form role="form" class="form-inline" method="POST" action="${ctx }/back/patient/list">
                         	 <div class="row show-grid">
                         	 	<div class="form-group col-lg-3">
	                         	 	<div class="form-group" style="margin-left: 39px;">
		                                 <label for="">用户名：</label>
		                                 <input type="text" name="username" class="form-control">
		                             </div>
                         	 	</div>
                         	 	<div class="form-group col-lg-3" style="margin-left: -65px;">
		                             <div class="form-group">
		                                 <label for="">姓名：</label>
		                                 <input type="text" name="name" class="form-control">
		                             </div>
		                         </div>
		                         <div class="form-group col-lg-3" style="margin-left: -108px;>
	                                 <label for="">注册起始时间：</label>
	                                 <div class="input-group">
	                                 <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
	                                    <input type="text" class="form-control" name="startDate" id="startDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
	                                </div>
	                             </div>
	                             <div class="form-group col-lg-3">
	                                 <label for="">注册终止时间：</label>
	                                 <div class="input-group">
	                                 <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
	                                    <input type="text" class="form-control" name="endDate" id="endDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
	                                </div>
	                             </div>
                             </div>
                             <div class="row show-grid" style="margin-left: 26px;">
                             	<div class="form-group col-lg-5">
	                                 <label for="">可用积分：</label>
	                                 <input type="text" id="" name="startScore" class="form-control"> --
	                                 <input type="text" id="" name="endScore" class="form-control">
	                             </div>
	                             <div class="form-group col-lg-3">	
									<button type="submit" style="width: 150px" class="btn btn-primary">查询</button>	                             
									<button type="button" style="width: 150px" class="btn btn-primary" onclick="exportPatient()">导出</button>	
								</div>
                             </div>
                         </form>
                </div>
           </div>
           <div class="col-lg-12">
           		 <div class="panel-body">
           		 <jsp:include page="/WEB-INF/pages/context/pagination.jsp">
						<jsp:param value="${ctx}/back/patient/list" name="url" />
					</jsp:include>
					<table
						class="table table-striped table-bordered table-hover">
						<tr>
							<th>序号</th>
							<th>用户名</th>
							<th>姓名</th>
							<th>性别</th>
							<th>出生日期</th>
							<th>手机号</th>
							<th>注册时间</th>
							<th>患者积分</th>
							<th>详情</th>
						</tr>
						<c:forEach var="item" items="${page.datas}" varStatus="st">
							<tr>
								<td>${st.index+1}</td>
								<td>${item.username}</td>
								<td>${item.name}</td>
								<td>
									<c:if test="${item.agender == 1}">男</c:if>
									<c:if test="${item.agender == 2}">女</c:if>
								</td>
								<td>${item.birthday}</td>
								<td>${item.mobile}</td>
								<td>${item.registerTime}</td>
								<td>${item.score}</td>
								<td>
									<button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" onclick="detail('${item.userId}')">查看详情</button> 
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
           </div>
       </div>
    </div>
</div>
</body>
<script type="text/javascript">


	function exportPatient(){
		window.location.href = "${ctx }/back/patient/export";
	}
	function detail(id){
		window.location.href = "${ctx }/back/patient/detail?id="+id;
	}
</script>
</html>