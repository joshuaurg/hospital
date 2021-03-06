<%@page import="com.dpc.utils.memcached.MemSession"%>
<%@ page language="java" pageEncoding="utf-8"%>
        <div id="wrapper">
	        <nav class="navbar-default navbar-static-side" role="navigation">
	        	<div class="sidebar-collapse">
	                <ul class="nav metismenu" id="side-menu">
	                    <li class="active" id="article">
	                        <a href="index.html"><i class="fa fa-th-large"></i> <span class="nav-label">文章管理</span> <span class="fa arrow"></span></a>
	                        <ul class="nav nav-second-level collapse">
	                            <li><a href="${ctx }/back/article/view/patient/add">文章上传(患者)</a></li>
	                            <li><a href="${ctx }/back/article/list/2">文章列表(患者)</a></li>
	                            <li><a href="${ctx }/back/article/view/doctor/add">文章上传(医生)</a></li>
	                            <li><a href="${ctx }/back/article/list/1">文章列表(医生)</a></li>
	                        </ul>
	                    </li>
	                    <li  id="patient">
	                        <a href="#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">患者管理</span><span class="fa arrow"></span></a>
	                        <ul class="nav nav-second-level collapse">
	                            <li><a href="${ctx }/back/patient/list">患者列表</a></li>
	                        </ul>
	                    </li>
	                    <li  id="doctor">
	                        <a href="#"><i class="fa fa-pie-chart"></i><span class="nav-label">医生管理</span><span class="fa arrow"></span></a>
	                        <ul class="nav nav-second-level collapse">
	                            <li><a href="${ctx }/back/doctor/list">医生列表</a></li>
	                            <li><a href="${ctx }/back/doctor/diaexp/list">诊后心得</a></li>
	                            <li><a href="${ctx }/back/doctor/academicSupport/list">学术支持</a></li>
	                            <li><a href="${ctx }/back/doctor/getCaseAnalysisList">病例精析</a></li>
	                            <li><a href="${ctx }/back/doctor/newCaseAnalysis">新建病例精析</a></li>
	                        </ul>
	                    </li>
	                    <li id="verify">
	                        <a href="#"><i class="fa fa-edit"></i><span class="nav-label">审核认证管理</span><span class="fa arrow"></span></a>
	                        <ul class="nav nav-second-level collapse">
	                            <li><a href="${ctx }/back/doctor/authentication/list">医生认证审核</a></li>
<!-- 	                            <li><a href="toastr_notifications.html">银行绑定认证</a></li> -->
	                        </ul>
	                    </li>
	                    <li  id="post">
	                        <a href="#"><i class="fa fa-desktop"></i><span class="nav-label">帖子管理</span><span class="fa arrow"></span></a>
	                        <ul class="nav nav-second-level collapse">
	                            <li><a href="${ctx }/back/post/patient/list/view">帖子列表(患者)</a></li>
	                            <li><a href="${ctx }/back/post/patient/add/view">新建帖子(患者)</a></li>
	                            <li><a href="${ctx }/back/post/doctor/list/view">帖子列表(医生)</a></li>
	                            <li><a href="${ctx }/back/post/doctor/add/view">新建帖子(医生)</a></li>
	                        </ul>
	                    </li>
	                    <li id="will">
	                        <a href="#"><i class="fa fa-files-o"></i><span class="nav-label">心愿管理</span><span class="fa arrow"></span></a>
	                        <ul class="nav nav-second-level collapse">
	                            <li><a href="${ctx }/back/patient/wish/list">心愿列表</a></li>
	                        </ul>
	                    </li>
	                    <li id="setting">
	                        <a href="#"><i class="fa fa-flask"></i><span class="nav-label">设置</span><span class="fa arrow"></span></a>
	                        <ul class="nav nav-second-level collapse">
	                            <li><a href="${ctx }/back/toModifyPwd">修改密码</a></li>
	                            <li><a href="${ctx }/back/feedback/list">意见反馈</a></li>
	                            <li><a href="${ctx }/back/hopital/import/view">医院管理</a></li>
	                            <li><a href="${ctx }/back/manager/view">管理员管理</a></li>
	                        </ul>
	                    </li>
	                    <li id="interface">
	                        <a href="#"><i class="fa fa-flask"></i><span class="nav-label">接口管理</span><span class="fa arrow"></span></a>
	                        <ul class="nav nav-second-level collapse">
<%-- 	                            <li><a href="${ctx }/back/interface/category/list">接口分类</a></li> --%>
	                            <li><a href="${ctx }/back/interface/view/list">接口管理</a></li>
	                        </ul>
	                    </li>
	                </ul>
	            </div>
	        </nav>
        </div>
        <<script type="text/javascript">
			$(function(){
				<%
				String menu = "";
				MemSession mem = MemSession.getSession("menu_"+session.getId(), false, "default");
				if(mem.getMap()!=null){
					menu = (String) mem.getAttribute("menu");
				%>
				var menu = '<%=menu%>';
				$("ul.metismenu").children("li").each(function(){
					alert
					if($(this).attr("id")==menu){
						$(this).addClass("active");
						$(this).find("ul.collapse").addClass("in");
					}else{
						$(this).removeClass("active");
						$(this).find("ul.collapse").removeClass("in");
					}
				});
				<%
				}
				%>
				
			});
		</script>
        
