
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
 function fn_detail(edu_no){
	document.location = "<c:url value='/user/sectorView.do'/>"+"?edu_no="+edu_no+"&idx="+$('#idx').val();
 }	
</script>
     <!-- container  begin -->
                <div id="container">
                    <div class="tit-wrap">
                        <h1 class="h1-tit">강사자격 정보</h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>생명지킴이 강사 공간</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>자격관리</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>강사자격 정보</span>
                        </div>
                    </div>

                    <div class="contents-wrap">

                        <!---- view-wrap begin ---->
                        <div class="view-wrap">
                            <h4 class="h4-tit">강사 기본정보</h4>
                            <ul class="summary-cont">
                                <li>
                                    <label>소속기관 :</label>
                                    <span>${result.COPER_NM}</span>
                                </li>
                                <li>
                                    <label>지역 :</label>
                                    <span>${result.AREA_NM}</span>
                                </li>
                                <li>
                                    <label>연락처 :</label>
                                    <span>${result.MBL_TELNO}</span>
                                </li>
                            </ul>

                            <h4 class="h4-tit">강사 수료 정보 <span class="point">( 강사수료증 발급은 마이페이지에서 가능합니다.)</span>
                            </h4>
                            
                            <ul class="summary-cont">
                                <li>
                                    <label>수료번호 :</label>
                                    <span>${result.LICENSE_NUMBER}</span>
                                </li>
                                <li>
                                    <label>수료일 :</label>
                                    <span>${result.REG_DT}</span>
                                </li>
                                <li>
                                    <label>강사상태 :</label>
                                    <span>${result.STATUS}</span>
                                </li>
                            </ul>
                        </div>
                        <!---- view-wrap end ---->


                        <div class="comp">
                            <h4 class="h4-tit">자격범위 및 자격유지 기간</h4>

                            <div class="table-wrap">
                                <table class="list-tb"> <!------  20211224 수정  --------->
                                    <caption>자격범위 및 자격유지 기간, 자격, 자격 유지기간 정보가 있는 테이블</caption>
                                    <colgroup>
                                        <col width="*"/>
                                        <col width="10%"/>
                                        <col width="30%"/>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>자격범위 및 자격유지 기간</th>
                                            <th>자격</th>
                                            <th>자격 유지기간</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="result" items="${resultList}" varStatus="status">
                                        <tr>
                                            <td class="tl">${result.CATEGORY3_NAME}</td>
                                            <td><input type="checkbox" class="check-box" <c:if test="${result.EDU_CD != null}">checked</c:if>/></td>
                                            <td>
                                                <span>${result.AUTH_SDATE}</span>~<span>${result.AUTH_EDATE}</span></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table><!------  //20211224 수정  --------->
                            </div>
                        </div>
                    </div>
                </div>
                <!--  container end -->