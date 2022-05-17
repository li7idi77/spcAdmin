
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>

 <script type="text/javaScript" language="javascript" defer="defer">
 
 </script>
 
           <form  id="commonForm" name="commonForm"  method="post"  >
			<input type="hidden" id="pageIndex"      name="pageIndex"      class="input-box" value=1 />
			
         	<h1 class="h1-tit">교육 결과 보고</h1>

            <div class="search-wrap">
                <div class="search-cont">
                    <div class="radio-cont">
                        <input type="radio" class="radio-box" id="" name="" value="" checked>
                        <label for="">전체</label>
                    </div>

                    <div class="radio-cont">
                        <input type="radio" class="radio-box" id="" name="" value="">
                        <label for="">교육완료/결과보고</label>
                    </div>
                    
                    <div class="radio-cont">
                        <input type="radio" class="radio-box" id="" name="" value="">
                        <label for="">보고완료</label>
                    </div>
                </div>

                <div class="search-cont search-sub">
                    <h3 class="h3-tit">기관명</h3>

                    <div class="radio-cont">
                        <input type="radio" class="radio-box" id="" name="" value="" checked>
                        <label for="">전체</label>
                    </div>
                    <div class="radio-cont">
                        <input type="radio" class="radio-box" id="" name="" value="">
                        <input type="text" class="input-box" placeholder="직접입력"/>
                    </div>
                </div>

                <div class="search-cont search-sub">
                    <h3 class="h3-tit">강사명</h3>

                    <div class="radio-cont">
                        <input type="radio" class="radio-box" id="" name="" value="" checked>
                        <label for="">전체</label>
                    </div>
                    <div class="radio-cont">
                        <input type="radio" class="radio-box" id="" name="" value="">
                        <input type="text" class="input-box" placeholder="직접입력"/>
                    </div>
                </div>

                <div class="search-cont search-sub">
                    <h3 class="h3-tit">교육명</h3>

                    <div class="radio-cont">
                        <input type="radio" class="radio-box" id="" name="" value="" checked>
                        <label for="">전체</label>
                    </div>
                    <div class="radio-cont">
                        <input type="radio" class="radio-box" id="" name="" value="">
                        <input type="text" class="input-box" placeholder="직접입력"/>
                    </div>
                </div>

                <div class="search-cont search-sub">
                    <h3 class="h3-tit">지역</h3>

                    <div class="radio-cont">
                        <input type="radio" class="radio-box" id="" name="" value="" checked>
                        <label for="">전체</label>
                    </div>
                    <div class="radio-cont">
                        <input type="radio" class="radio-box" id="" name="" value="">
                        <input type="text" class="input-box" placeholder="직접입력"/>
                    </div>
                </div>

                <div class="search-cont">
                    <div class="radio-cont">
                        <input type="radio" class="radio-box" id="dateAll" name="radioGroupDate" value="" checked>
                        <label for="dateAll">전체</label>
                    </div>
                      
                    <div class="radio-cont">
                        <input type="radio" class="radio-box" id="dateToday" name="radioGroupDate" value="">
                        <label for="dateToday">오늘</label>
                    </div>
                    
                    <div class="radio-cont mr10">
                        <input type="radio" class="radio-box" id="dateTerm" name="radioGroupDate" value="">
                        <label for="dateTerm">기간선택</label>
                    </div>
                    <div class="picker-wrap">
                        <input type="text" id="datepickerFrom" class="input-box"/>
                        <span class="next-ico">-</span>
                        <input type="text" id="datepickerTo" class="input-box"/>
                    </div>
                    
                    <button class="search-btn">검색</button>
                    <button class="search-btn white-btn ml20" onClick="fn_clear();">초기화</button>
                </div>

            </div>
            </form>
            
            <div class="btn-cont mb20">
                <dl class="count-txt">
                    <dt>전체 <span>115</span></dt>
                    <dt class="green-txt">교육완료(결과보고)<span>115</span></dt>
                    <dt class="gray-txt">보고완료 <span>115</span></dt>
                </dl>

                <button class="mid-btn black-btn">엑셀다운</button>
                <button class="mid-btn white-btn">선택삭제</button>
            </div>
            
            <div class="table-wrap scroll-wrap">
                <table class="list-tb">
                    <caption>선택, 교육명, 교육일, 지역, 기관명, 교육대상, 교육장소, 교육인원, 강사(ID), 진행현황, 보고서, 수정 정보가 있는 테이블</caption>
                    <colgroup>
                        <col width="4%"/>
                        <col width="5%"/>
                        <col width="*"/>
                        <col width="6%"/>
                        <col width="6%"/>
                        <col width="8%"/>
                        <col width="6%"/>
                        <col width="6%"/>
                        <col width="6%"/>
                        <col width="7%"/>
                        <col width="10%"/>
                        <col width="6%"/>
                        <col width="6%"/>
                    </colgroup>
                    <thead>
                        <tr>
                            <th><input type="checkbox" class="check-box"/></th>
                            <th>No.</th>
                            <th>교육명</th>
                            <th>교육일</th>
                            <th>지역</th>
                            <th>기관명</th>
                            <th>교육대상</th>
                            <th>교육장소</th>
                            <th>교육인원</th>
                            <th>강사(ID)</th>
                            <th>진행현황</th>
                            <th>보고서</th>
                            <th>수정</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" class="check-box"/></td>
                            <td>1</td>
                            <td class="tl">교육명교육명교육명교육명교육명교육명교육명교육명교육명</td>
                            <td>2021.10.05</td>
                            <td>서울</td>
                            <td></td>
                            <td>교사</td>
                            <td>회의실</td>
                            <td><span>89</span>/<span>100</span></td>
                            <td><span class="block">이보람</span><span  class="block">fgfdfdgfdgg</span></td>
                            <td><span class="green-txt">교육완료(결과보고)</span></td>
                            <td><button class="sm-btn white-btn">보기</td>
                            <td><button class="sm-btn blue-btn">수정</button></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="check-box"/></td>
                            <td>2</td>
                            <td class="tl">교육명교육명교육명교육명교육명교육명교육명교육명교육명</td>
                            <td>2021.10.05</td>
                            <td>서울</td>
                            <td></td>
                            <td>교사</td>
                            <td>회의실</td>
                            <td><span>89</span>/<span>100</span></td>
                            <td><span class="block">이보람</span><span  class="block">fgfdfdgfdgg</span></td>
                            <td><span class="gray-txt">보고완료</span></td>
                            <td><button class="sm-btn white-btn">보기</td>
                                <td><button class="sm-btn blue-btn">수정</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
          <div class="page-wrap">
              <ul class="paging">
    		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
  	  		</ul>
          </div>
