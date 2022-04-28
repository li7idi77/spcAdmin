
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

 $(document).ready(function(){		
 });
 
 function fn_save(){
	 	var radio_chk = $(':radio[name="ins_check"]:checked').val();
	 	if(radio_chk == null){
	 		return false
	 	}
		var param = radio_chk.split(",");
		var sch_no = param[0];
		var user_nm = param[1];
		if(confirm("변경이 불가하오니 신중하게 선택하시기 바랍니다.\n선택하시겠습니까?")){
			//{"schedule_no" : param[0], "user_nm" : param[1] },
			$.ajax({	
				data       : {},
			    url		   : "<c:url value='/user/updateInsData.do'/>?schedule_no="+sch_no+"&user_nm="+user_nm,
			    dataType   : "JSON",
				type	   : "POST",	
			    processData: false,
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
<div class="pop-wrap">
        <div class="pop-header">
            <h1 class="h1-tit">강사 선택</h1>
        </div>
        <div class="pop-cont">
			<div class="table-wrap">
                <table class="list-tb">
                    <caption>선택, 강사명, 성별, 지역, 소속기관 정보가 있는 테이블</caption>
                    <colgroup>
                        <col width="8%"/>
                        <col width="10%"/>
                        <col width="16%"/>
                        <col width="16%"/>
                        <col width="16%"/>
                        <col width="*"/>
                    </colgroup>
                    <thead>
                        <tr>
                            <th>선택</th>
                            <th>No.</th>
                            <th>강사명</th>
                            <th>성별</th>
                            <th>지역</th>
                            <th>소속기관</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="result" items="${resultList}" varStatus="status">
                        <tr>
                            <td><input type="radio" class="radio-box" id="ins_check" name="ins_check" value="${result.SCHEDULE_NO},${result.USER_NM}"></td>
                            <td>${status.index + 1}</td>
                            <td>${result.USER_NM}</td>
                            <td>${result.USER_SEX}</td>
                            <td>${result.AREA_NM}</td>
                            <td>${result.INSTRUCTOR_COPER_NM}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
		</div>
		
        <div class="pop-footer">
            <button class="mid-btn navy-btn" onClick="fn_save();">확인</button>
            <button class="mid-btn white-btn" onClick="self.close();">취소</button>
        </div>
    </div>