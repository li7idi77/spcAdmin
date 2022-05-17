
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

 $(document).ready(function(){		
 });
 
 function fn_save(){
	 var formData = new FormData($('#commonForm')[0]);
		if(confirm("취소 신청 하시겠습니까?")){
			//{"schedule_no" : param[0], "user_nm" : param[1] },
			$.ajax({	
				data       : formData,
			    url		   : "<c:url value='/user/saveAppCancel.do'/>",
			    dataType   : "JSON",
				type	   : "POST",	
			    processData: false,
		        contentType: false,
		        success    : function(obj) {
		        	commonCallBack(obj);				
		        },	       
		        error 	: function(xhr, status, error) {} 		        
		    });
		}
}	
function commonCallBack(obj){
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("성공하였습니다.");				
				self.close()			 
			}else {				
				alert("등록이 실패 했습니다.");	
				return false;
			}
		}
	}	

</script>
<c:set var="currentDt" value="<%=new Date()%>" />
<fmt:formatDate value="${currentDt}" type="date" var="currentDate" pattern="yyyy.MM.dd"/>
<div class="pop-wrap">
        <div class="pop-header">
            <h1 class="h1-tit">신청취소</h1>
        </div>
        <div class="pop-cont">
			<div class="table-wrap">
				<form  id="commonForm" name="commonForm"  method="post"  action="">
				<input type="hidden" id="schedule_no" name="schedule_no" value="${sch_no}">
				<table class="detail-tb">
                    <caption>취소사유, 취소날짜, 취소요청자, 취소요청자 연락처, 비고 정보가 있는 테이블</caption>
                    <colgroup>
                        <col width="35%"/>
                        <col width="*"/>
                    </colgroup>
                    <tbody>
                    <c:if test="${chk == null}">
                    	<tr>
                            <th>취소날짜</th>
                            <td>${currentDate}</td>
                        </tr>
                        <tr>
                            <th>취소사유</th>
                            <td><textarea id="cancel_reason" name="cancel_reason" class="editor"></textarea></td>
                        </tr>
                        <tr>
                            <th>취소요청자</th>
                            <td><input type="text" id="cancel_user" name="cancel_user" class="input-box"/></td>
                        </tr>
                        <tr>
                            <th>취소요청자 연락처</th>
                            <td><input type="text" id="cancel_tel" name="cancel_tel" class="input-box"/></td>
                        </tr>
                        <tr>
                            <th>비고</th>
                            <td><textarea id="cancel_remark" name="cancel_remark" class="editor"></textarea></td>
                        </tr>
                    </c:if>
                    <c:if test="${chk != null}">
                    	<tr>
                            <th>취소날짜</th>
                            <td>${result.CANCEL_DATE}</td>
                        </tr>
                        <tr>
                            <th>취소사유</th>
                            <td>${result.CANCEL_REASON}</td>
                        </tr>
                        <tr>
                            <th>취소요청자</th>
                            <td>${result.CANCEL_USER}</td>
                        </tr>
                        <tr>
                            <th>취소요청자 연락처</th>
                            <td>${result.CANCEL_TEL}</td>
                        </tr>
                        <tr>
                            <th>비고</th>
                            <td>${result.CANCEL_REMARK}</td>
                        </tr>
                    </c:if>
                        
                        
                    </tbody>
                </table>
                </form>
            </div>
		</div>
		<c:if test="${chk == null}">
        <div class="pop-footer">
            <button class="mid-btn navy-btn" onClick="fn_save();">확인</button>
            <button class="mid-btn white-btn" onClick="self.close();">취소</button>
        </div>
        </c:if>
    </div>