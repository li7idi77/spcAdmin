<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<h1 class="h1-tit">강사 자격 정보</h1>

<div class="table-wrap">
    <h2 class="h2-tit">회원정보</h2>

    <table class="detail-tb">
        <caption>아이디, 이름, 비밀번호, 전화번호, 휴대폰, 팩스번호, 이메일, 성별 정보가 있는 테이블</caption>
        <colgroup>
            <col width="20%"/>
            <col width="*"/>
        </colgroup>
        <tbody>
            <tr>
                <th>아이디</th>
                <td></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" class="input-box lg-width" value=""/></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="text" class="input-box lg-width" value=""/>
                    <span class="point">변경 할 경우에만 입력하세요.</span>
                </td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>
                    <input type="text" class="input-box lg-width" placeholder="- 없이 입력해주세요" value=""/>
                </td>
            </tr>
            <tr>
                <th>휴대폰</th>
                <td>
                    <input type="text" class="input-box lg-width" placeholder="- 없이 입력해주세요" value=""/>
                </td>
            </tr>
            <tr>
                <th>팩스번호</th>
                <td>
                    <input type="text" class="input-box lg-width" placeholder="- 없이 입력해주세요" value=""/>
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <div class="tb-cont">
                        <input type="text" class="input-box" value=""/>
                        <span>@</span>
                        <input type="text" class="input-box" value=""/>
                        <select class="select">
                            <option>직접입력</option>
                            <option>naver.com</option>
                            <option>gmail.com</option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                    <div class="tb-cont">
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="" checked>
                            <label>남자</label>
                        </div>
                          
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="">
                            <label>여자</label>
                        </div>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div class="table-wrap">
    <h2 class="h2-tit">강사정보 1</h2>

    <table class="detail-tb">
        <caption>활동상태, 강사분류, 지역, 기관명, 휴직이력, 신청서 보기, 휴직기간 정보가 있는 테이블</caption>
        <colgroup>
            <col width="20%"/>
            <col width="30%"/>
            <col width="20%"/>
            <col width="*"/>
        </colgroup>
        <tbody>
            <tr>
                <th>활동상태</th>
                <td colspan="3">
                    <div class="tb-cont">
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="" checked>
                            <label>활동</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="">
                            <label>상실(일반)</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="">
                            <label>휴직</label>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <th>활동상태</th>
                <td colspan="3">
                    <div class="tb-cont">
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="" checked>
                            <label>전체</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="">
                            <label>일반강사</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="">
                            <label>실무자</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="">
                            <label>공공기간(학교, 군, 경찰, 도시철도 등)</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="">
                            <label>기업(삼성,현대. sk 등)</label>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <th>지역</th>
                <td>
                    <select class="select">
                        <option>서울</option>
                        <option>부산</option>
                    </select>
                </td>
                <th>기관명</th>
                <td>
                    <input type="text" class="input-box" value=""/>
                </td>
            </tr>
            <tr>
                <th>휴직이력</th>
                <td>
                    <input type="text" class="input-box" value=""/>
                </td>
                <th>신청서 보기</th>
                <td>
                    <a class="link block">신청서1</a>
                    <a class="link block">신청서2</a>
                    <a class="link block">신청서3</a>
                </td>
            </tr>
            <tr>
                <th>휴직기간</th>
                <td colspan="3">
                    <div class="picker-wrap">
                        <input type="text" id="datepickerFrom02" class="input-box"/>
                        <span class="next-ico">-</span>
                        <input type="text" id="datepickerTo02" class="input-box"/>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div class="table-wrap">
    <h2 class="h2-tit">강사정보 2</h2>

    <table class="detail-tb">
        <caption>수료증번호, 최종수료일, 교육횟수, 교육 누적횟수, 오프라인 2회 교육, 온라인 보수 교육 정보가 있는 테이블</caption>
        <colgroup>
            <col width="20%"/>
            <col width="30%"/>
            <col width="20%"/>
            <col width="*"/>
        </colgroup>
        <tbody>
            <tr>
                <th>수료증번호</th>
                <td>교육 제21 – 0000호</td>
                <th>최종 수료일</th>
                <td>
                    <div class="picker-wrap">
                        <input type="text" id="datepickerDefault" class="input-box"/>
                    </div>
                </td>
            </tr>
            <tr>
                <th>교육횟수 (해당 년도)</th>
                <td>32</td>
                <th>교육 누적횟수</th>
                <td>82</td>
            </tr>
            <tr>
                <th>오프라인 2회 교육</th>
                <td colspan="3">
                    <div class="tb-cont">
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="" checked>
                            <label>완료</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="">
                            <label>미완료</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="">
                            <label>해당년도 수료 시 체크 ( 오프/온라인 교육 모두 완료 시 1년 자격연장 )</label>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <th>온라인 보수 교육</th>
                <td colspan="3">
                    <div class="tb-cont">
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="" checked>
                            <label>완료</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="">
                            <label>미완료</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="">
                            <label>해당년도 수료 시 체크 ( 오프/온라인 교육 모두 완료 시 1년 자격연장 )</label>
                        </div>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div class="table-wrap">
    <h2 class="h2-tit">강사 자격기간 정보</h2>

    <!------   20211223  수정  ------>
<table class="list-tb">
    <caption>자격기간, 강사자격정보, 수료일, 유지기간, 관리 정보가 있는 테이블</caption>
    <colgroup>
        <col width="15%"/>
        <col width="*"/>
        <col width="15%"/>
        <col width="30%"/>
        <col width="10%"/>
    </colgroup>
    <thead>
        <tr>
            <th>자격기간</th>
            <th>강사 자격정보</th>
            <th>수료일</th>   
            <th>유지기간</th>
            <th>관리</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan="4" class="no-border-b"></td>
            <td class="tl">보고듣고말하기 2.0 기본형</td>
            <td><input type="text" class="input-box" value="" readonly/></td>
            <td>
                <div class="picker-wrap">
                    <input type="text" id="datepickerFrom" class="input-box"/>
                    <span class="next-ico">-</span>
                    <input type="text" id="datepickerTo" class="input-box"/>
                </div>
            </td>
            <td><button class="sm-btn blue-btn">수정</button></td>
        </tr>
        <tr>
            <td class="tl">보고듣고말하기 2.0 중학생</td>
            <td><input type="text" class="input-box" value="" readonly/></td>
            <td>
                <div class="picker-wrap">
                    <input type="text" id="datepickerFrom" class="input-box"/>
                    <span class="next-ico">-</span>
                    <input type="text" id="datepickerTo" class="input-box"/>
                </div>
            </td>
            <td><button class="sm-btn blue-btn">수정</button></td>
        </tr>
        <tr>
            <td class="tl">이어줌인 직장인</td>
            <td><input type="text" class="input-box" value="" readonly/></td>
            <td>
                <div class="picker-wrap">
                    <input type="text" id="datepickerFrom" class="input-box"/>
                    <span class="next-ico">-</span>
                    <input type="text" id="datepickerTo" class="input-box"/>
                </div>
            </td>
            <td><button class="sm-btn blue-btn">수정</button></td>
        </tr>
        <tr>
            <td class="tl">이어줌인 노인</td>
            <td><input type="text" class="input-box" value="" readonly/></td>
            <td>
                <div class="picker-wrap">
                    <input type="text" id="datepickerFrom" class="input-box"/>
                    <span class="next-ico">-</span>
                    <input type="text" id="datepickerTo" class="input-box"/>
                </div>
            </td>
            <td><button class="sm-btn blue-btn">수정</button></td>
        </tr>
    </tbody>
</table><!------   // 20211223  수정  ------>
</div>

<div class="btn-cont">
    <button class="mid-btn blue-btn">저장하기</button>
    <button class="mid-btn white-btn">취소</button>
</div>