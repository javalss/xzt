<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${sysConfig.schoolName } 家属信息管理--家属信息查询与维护</title>
    <meta name="keywords" content="${fns:getConfig('keywords')} ${sysConfig.schoolName } ">
    <meta name="description" content="${fns:getConfig('description')} ${sysConfig.schoolName }">
	<%@ include file="/WEB-INF/views/include/commoncss.jsp"%>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="row row-lg">
					<div class="col-sm-12">
						<h4 class="example-title">家属列表</h4>
						<div class="example">
							<div class="btn-group " id="exampleTableEventsToolbar" role="group">
									<a class="J_menuItem" href="${ctx}/ante/parents/form">
										<button type="button" class="btn btn-outline btn-default">
											<shiro:hasPermission name="ante:parents:view">
												<i class="glyphicon glyphicon-plus text-navy" aria-hidden="false"></i>
											</shiro:hasPermission>
										</button>
									</a>
							</div>
							<form id="searchForm" action="${ctx}/ante/parents/list" method="post" class="form-inline">
								<div class="form-group">
									<label>来访者编号：</label>
									<input id="studentCode" name="studentCode" value="${parents.studentCode}" class="form-control" type="text" maxlength="30"/>
								</div>
								<div class="form-group">
									<label>来访者姓名：</label>
									<input id="visitorName" name="visitorInfo.user.name" class="form-control" type="text" maxlength="30"/>
								</div>
								<div class="form-group">
									<label>家属编号：</label>
									<input id="parentNo" name="parentNo" value="${parents.parentNo}" class="form-control" type="text" maxlength="30"/>
								</div>
								<div class="form-group">
									<label>家属姓名：</label>
									<input id="name" name="name" value="${parents.name}" class="form-control" type="text" maxlength="30"/>
								</div>
								<div class="form-group">
									<button id="btnQuery" class="btn btn-primary">查询</button>
								</div>
							</form>
							<table id="exampleTableToolbar" data-toggle="table"
								data-query-params="queryParams" data-mobile-responsive="true"
								data-height="400" data-pagination="true" data-search="false">
								<thead>
									<tr>
										<th data-checkbox="true" aria-hidden="true"></th>
                                    	<th data-field="id" data-visible="false"></th>
										<th data-field="studentCode">来访者编号</th>
										<th data-field="visitorInfo.user.name">来访者姓名</th>
										<th data-field="user.name">家属姓名</th>
										<th data-field="gender">性别</th>
										<th data-field="age">年龄</th>
										<shiro:hasPermission name="ante:parents:edit">
											<th>操作</th>
										</shiro:hasPermission>
									</tr>
								</thead>
								<c:forEach items="${page.list}" var="parentsVo">
									<tr>
										<td>${parentsVo.id}</td>
										<td>${parentsVo.id}</td>
										<td><a class="text-navy" href="${ctx}/ante/parents/view?id=${parentsVo.id}">${parentsVo.studentCode}</a></td>
										<td>${parentsVo.visitorInfo.user.name}</td>
										<td>${parentsVo.user.name}</td>
										<td>${parentsVo.gender==1?"男":"女"}</td>
										<td>${parentsVo.age}</td>
										<td>
											<shiro:hasPermission name="ante:parents:edit">
												<a class="text-navy"
													href="${ctx}/ante/parents/view?id=${parentsVo.id}">
													<i class="glyphicon glyphicon-eye-open" aria-hidden="true" title="查看"></i>
												</a>&nbsp;&nbsp;
												<a class="text-navy"
													href="${ctx}/ante/parents/form?id=${parentsVo.id}">
													<i class="glyphicon glyphicon-edit" aria-hidden="true" title="修改"></i>
												</a>&nbsp;&nbsp;
												<a href="#" class="text-danger" onclick="delOne('${parentsVo.id}')" title="删除">
													<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
												</a>&nbsp;&nbsp;
												<a class="text-info" href="${ctx}/ante/commentInfo/viewList?userId1=${parentsVo.user.id}" title="评语记录">
													<i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>
												</a>
											</shiro:hasPermission>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Panel Basic -->
	</div>
</body>
	<%@ include file="/WEB-INF/views/include/commonlistjs.jsp"%>
	<script type="text/javascript">
		/**
		 * 删除一条
		 */    
		function delOne(id){
	        layer.confirm('确认要删除吗？', {
	            btn: ['确认','取消'], //按钮
	            title:'删除确认',
	            shade: false //不显示遮罩
	        }, function(){
	            document.location.href="${ctx}/ante/parents/delete?id="+id;
	            layer.msg('删除成功！', {icon: 6});
	        }, function(){
	            layer.msg('已取消', {icon: 1});
	        });
	    }
	</script>
</html>