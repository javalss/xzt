<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>${sysConfig.schoolName } 添加预约</title>
   <meta name="keywords" content="${fns:getConfig('keywords')} ${sysConfig.schoolName } ">
   <meta name="description" content="${fns:getConfig('description')} ${sysConfig.schoolName }">
	<%@ include file="/WEB-INF/views/include/commoncss.jsp" %>
	<link href="${hplusStatic }/css/plugins/iCheck/custom.css" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>添加预约</h5>
                        <div class="ibox-tools"></div>
                    </div>
					<div class="ibox-content">
                    <form class="form-horizontal m-t" id="inputForm" action="${ctx}/counsel/counselorUserBook/save" method="post">
                            <input type="hidden" name="id" value="${counselorUserBook.id }">
							<input type="hidden" id="reserveDate" name="reserveDate" value='<fmt:formatDate value="${counselorUserBook.reserveDate}" pattern="yyyy-MM-dd"/>'>
							<input type="hidden" id="beginTime" name="beginTime" value="<fmt:formatDate value="${counselorUserBook.beginTime}" pattern="HH:mm:ss"/>">
							<input type="hidden" id="endTime" name="endTime" value="<fmt:formatDate value="${counselorUserBook.endTime}" pattern="HH:mm:ss"/>">
							<input type="hidden" id="counselorId" name="counselorId" value="${counselorUserBook.counselorId }" />
                            <div class="form-group">
                                <label class="col-sm-3 control-label">学号：</label>
                                <div class="col-sm-8">
									<select id="visitorId" name="visitorId" class="form-control">
										<c:forEach items="${visitorInfoList}" var="visitor">
											<option value="${visitor.id }">${visitor.visitorNo }</option>
										</c:forEach>
									</select>
                                </div>
                            </div>
							<div class="form-group">
                                <label class="col-sm-3 control-label">咨询师姓名：</label>
                                <div class="col-sm-8">
									${counselorUserBook.counselor.user.name }
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">咨询时间段：</label>
                                <div class="col-sm-2">
                                	<fmt:formatDate value="${counselorUserBook.reserveDate}" pattern="yyyy-MM-dd"/> 
                                	<fmt:formatDate value="${counselorUserBook.beginTime}" pattern="HH:mm"/> 至  
									<fmt:formatDate value="${counselorUserBook.endTime}" pattern="HH:mm"/>
                                </div>
                            </div>
							<div class="form-group">
								<label class="col-sm-3 control-label">咨询方式：</label>
								<div class="col-sm-8">
									<div class="i-checks">
									 <fieldset>
	                                    <div class="radio radio-info radio-inline">
	                                        <input type="radio" id="consultation1" value="0" name="consultation" ${counselorUserBook.consultation==0?"checked":"" } >
	                                        <label for="consultation1">面询</label>
	                                    </div>
	                                    <div class="radio radio-inline">
	                                        <input type="radio" id="consultation2" value="1" name="consultation" ${counselorUserBook.consultation==1?"checked":"" } >
	                                        <label for="consultation2">网上咨询</label>
	                                    </div>
	                                    <div class="radio radio-inline">
	                                        <input type="radio" id="consultation3" value="2" name="consultation" ${counselorUserBook.consultation==2?"checked":"" } >
	                                        <label for="consultation3">电话咨询</label>
	                                    </div>
	                                </fieldset>
	                                </div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">预约方式：</label>
								<div class="col-sm-4">
									<div class="i-checks">
									 <fieldset>
	                                    <div class="radio radio-info radio-inline">
	                                        <input type="radio" id="reservation1" value="0" name="reservation" ${counselorUserBook.reservation==0?"checked":"" } >
	                                        <label for="reservation1">当面</label>
	                                    </div>
	                                    <div class="radio radio-inline">
	                                        <input type="radio" id="reservation2" value="1" name="reservation" ${counselorUserBook.reservation==1?"checked":"" } >
	                                        <label for="reservation2">电话</label>
	                                    </div>
	                                    <div class="radio radio-inline">
	                                        <input type="radio" id="reservation3" value="2" name="reservation" ${counselorUserBook.reservation==2?"checked":"" } >
	                                        <label for="reservation3">网上</label>
	                                    </div>
	                                </fieldset>
	                                </div>
								</div>
							</div>
							<div class="form-group">
                                <label class="col-sm-3 control-label">问题类型：</label>
                                <div class="col-sm-8">
									<select id="questionType" name="questionType" class="form-control">
										<c:forEach items="${fns:getDictList('question_type')}" var="item">
											<option value="${item.value }">${item.label }</option>
										</c:forEach>
									</select>
                                </div>
                            </div>
                            <div class="form-group">
								<label class="col-sm-3 control-label">是否重点个案：</label>
								<div class="col-sm-4">
									<div class="i-checks">
									 <fieldset>
	                                    <div class="radio radio-info radio-inline">
	                                        <input type="radio" id="isCase1" value="1" name="isCase" ${counselorUserBook.isCase==1?"checked":"" } >
	                                        <label for="isCase1">是</label>
	                                    </div>
	                                    <div class="radio radio-inline">
	                                        <input type="radio" id="isCase2" value="0" name="isCase" ${counselorUserBook.isCase==0?"checked":"" } >
	                                        <label for="isCase2">否</label>
	                                    </div>
	                                </fieldset>
	                                </div>
								</div>
							</div>
							<div class="form-group">
                                <label class="col-sm-3 control-label">咨询内容描述：</label>
                                <div class="col-sm-8">
                                	<textarea name="description" rows="10" cols="128" class="form-control"></textarea> 
                                </div>
                            </div>
							<div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3">
									<shiro:hasPermission name="counsel:counselorUserBook:edit">
									<input id="btnSubmit" class="btn btn-primary" type="submit" value="添加"/>&nbsp;
									</shiro:hasPermission>
									<input id="btnCancel" class="btn" type="button" value="取消" />&nbsp;
									<input id="btnDeleteTimePart" class="btn" type="button" value="删除此时间段?" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" ></script>
<script src="${hplusStatic }/js/jquery.min.js?v=2.1.4"></script>
<script src="${hplusStatic }/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${hplusStatic }/js/content.min.js?v=1.0.0"></script>
<script src="${hplusStatic }/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${hplusStatic }/js/plugins/validate/messages_zh.min.js"></script>
<script src="${hplusStatic }/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript">
	$(function() {
		var visitorId = '${counselorUserBook.visitorId }', 
			counselorId = '${counselorUserBook.counselorId }', 
			questionType = '${counselorUserBook.questionType}';
		$("#visitorId").val(visitorId);
		$("#counselorId").val(counselorId);
		$("#questionType").val(questionType);
		$("#btnDeleteTimePart").on("click", function(){
			var counselorId = $("#counselorId").val(), 
				reserveDate = $("#reserveDate").val(), 
				beginTime =  $("#beginTime").val(),
				endTime =  $("#endTime").val();
			location.href="${ctx}/counsel/counselorSchedule/delete?counselorId=" + counselorId 
					+ "&scheduleDate=" + reserveDate + "&beginTime=" + beginTime + "&endTime=" + endTime;
		});
		$("#inputForm").validate({
			submitHandler: function(form){
				form.submit();
			},
			errorContainer: "#messageBox",
			errorPlacement: function(error, element) {
				$("#messageBox").text("输入有误，请先更正。");
				if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
					error.appendTo(element.parent().parent());
				} else {
					error.insertAfter(element);
				}
			}
		});
		$("#btnCancel").on("click", function(){
			location.href = "${ctx}/counsel/counselorSchedule/list";
		});
		$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"})
	});
</script>
</body>
</html>