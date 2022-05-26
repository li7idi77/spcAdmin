
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


 <script type="text/javaScript" language="javascript" defer="defer">
 $(document).ready(function(){			 
 });
 
 function sortSelect(){
	 var frm = document.commonForm;
 	 frm.action = "<c:url value='/my/my04eduAppDetail.do'/>";
   	 frm.submit();
 }
 
	function openWindowPop(url, name){
	    var options = 'top=10, left=10, width=800px, height=1200px, status=no, menubar=no, toolbar=no, resizable=no';
	    window.open(url, name, options);
	}	
	function fn_egov_link_page(pageNo){
		 var frm = document.commonForm;
		 $("#pageIndex").val(pageNo); 
	 	 frm.action = "<c:url value='/my/my04eduResultDetail.do'/>";
	   	 frm.submit();
	 }
</script>
     <!-- container  begin -->
            <div id="container">

                    <div class="tit-wrap">
                        <h1 class="h1-tit">교육명 별 신청자</h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>마이페이지</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>기관</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>교육명 별 신청자</span>
                        </div>
                    </div>

                    <div class="contents-wrap">

                        <!---- search-wrap begin ---->
                        <form  id="commonForm" name="commonForm"  method="post"  action="">
		    			<input type="hidden" id="pageIndex"  name="pageIndex" value=1 />
                        
                        <div class="search-wrap">							
							<div class="search-cont">
                                <label>이름 :</label>
                                <!-- <div class="radio-cont">
                                    <input type="radio" class="radio-box" id="" name="" value="" checked>
                                    <label for="">전체</label>
                                </div> -->
                                <div class="radio-cont">
                                    <!-- <input type="radio" class="radio-box" id="" name="" value=""> -->
                                    <input type="text" class="input-box lg-width" id="user_nm" name="user_nm" placeholder="직접입력"/>
                                </div>
                            </div>

                            <div class="btn-cont">
                                <button class="lg-btn orange-btn">검색</button>
                                <button type="button" class="lg-btn navy-btn" onClick="fn_clear();">초기화</button>
                            </div>
                        </div>
                        
                        <div class="btn-cont mb20">
                            <select class="select" id="sortType" name="sortType" onChange="sortSelect();">
                                <option value="date" <c:if test="${sortType == 'date'}">selected</c:if>>신청일순</option>
                                <option value="name" <c:if test="${sortType == 'name'}">selected</c:if>>이름순(가나다)</option>
                            </select>
                        </div>
                        </form>
                        <!---- search-wrap end ---->
                        
                        <div class="comp mt0">
                            <div class="table-wrap">
                                <table class="list-tb">
                                    <caption>이름, 성별, 직업, 생년월일, 이메일, 연락처, 주소, 신청일 정보가 있는 테이블</caption>
                                    <colgroup>
                                        <col width="5%"/>
                                        <col width="8%"/>
                                        <col width="6%"/>
                                        <col width="9%"/>
                                        <col width="11%"/>
                                        <col width="15%"/>
                                        <col width="14%"/>
                                        <col width="*"/>
                                        <col width="11%"/>
                                        <col width="9%"/>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>이름</th>
                                            <th>성별</th>
                                            <th>직업</th>
                                            <th>생년월일</th>
                                            <th>이메일</th>
                                            <th>연락처</th>
                                            <th>주소</th>
                                            <th>신청일</th>
                                            <th>수료증<br/>발급하기</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="result" items="${resultList}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${result.USER_NM}</td>
                                            <td>${result.USER_SEX}</td>
                                            <td>${result.JOB_CD}</td>
                                            <td>${result.BIRTH_YMD}</td>
                                            <td>${result.EML_ADDR}</td>
                                            <td>${result.MBL_TELNO}</td>
                                            <td class="tl">${result.JUSO} ${result.JUSO_DETAIL}</td>
                                            <td>${result.REG_DT}</td>
                                            <td><button type="button" class="sm-btn white-btn" onClick="javascript:openWindowPop('<c:url value='/my/popMyWarrant.do'/>?cour_no=${result.COUR_NO}&edu_no=${result.EDU_NO}','popup');">발급</button></td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty resultList }">
							             <tr>
							                 <td colspan='10'/>Data 없습니다.</td>
							             </tr>
							        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                            
    
                           <div class="page-wrap">
						     <ul class="paging">
						         <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
						     </ul>
						</div>

                    </div>
                </div>
                <!--  container end -->