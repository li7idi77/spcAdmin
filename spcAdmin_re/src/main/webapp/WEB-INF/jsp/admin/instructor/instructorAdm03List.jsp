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

<div class="search-wrap">
    <div class="search-cont  search-sub full-width">
       <h1 class="h1-tit">강사 활동 신청 현황</h1>


                <div class="search-wrap">
                    <div class="search-cont  search-sub">
                        <h3 class="h3-tit">교육구분</h3>

                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="" checked>
                            <label for="">전체</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="">
                            <select class="select">
                                <option>분류1</option>
                            </select>
                            <select class="select">
                                <option>분류2</option>
                            </select>
                            <select class="select">
                                <option>분류3</option>
                            </select>
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

                    <div class="search-cont search-sub mr0">
                        <h3 class="h3-tit">지역</h3>

                        <div class="radio-cont">
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
                        <button class="search-btn white-btn ml20">초기화</button>
                    </div>

                </div>
                
                <div class="btn-cont mb20">
                    <button class="mid-btn black-btn">엑셀다운</button>
                    <button class="mid-btn white-btn">선택삭제</button>
                </div>
                
                <div class="table-wrap scroll-wrap">
                    <table class="list-tb">
                        <caption>선택, 지역, 기관명, 분류1, 분류2, 분류3, 교육대상, 교육인원, 신청일, 강사요건, 강의비, 신청현황, 노출, 수정 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="3%"/>
                            <col width="4%"/>
                            <col width="6%"/>
                            <col width="*"/>
                            <col width="8%"/>
                            <col width="9%"/>
                            <col width="10%"/>
                            <col width="6%"/>
                            <col width="6%"/>
                            <col width="7%"/>
                            <col width="6%"/>
                            <col width="6%"/>
                            <col width="6%"/>
                            <col width="6%"/>
                            <col width="5%"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th><input type="checkbox" class="check-box"/></th>
                                <th>No.</th>
                                <th>지역</th>
                                <th>기관명</th>
                                <th>분류1</th>
                                <th>분류2</th>
                                <th>분류3</th>
                                <th>교육대상</th>
                                <th>교육인원</th>
                                <th>신청일</th>
                                <th>강사요건</th>
                                <th>강의비</th>
                                <th>신청현황</th>
                                <th>노출</th>
                                <th>수정</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox" class="check-box"/></td>
                                <td>1</td>
                                <td>서울</td>
                                <td>기관명기관명기관명</td>
                                <td class="tl">분류분류분류분류1</td>
                                <td class="tl">분류분류분류분류분2</td>
                                <td class="tl">분류분류분류분류분류분류3</td>
                                <td>성인</td>
                                <td>120</td>
                                <td>2021.10.05</td>
                                <td></td>
                                <td></td>
                                <td><span>완료</span></td>
                                <td>노출</td>
                                <td><button class="sm-btn blue-btn">수정</button></td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" class="check-box"/></td>
                                <td>2</td>
                                <td>서울</td>
                                <td>기관명기관명기관명</td>
                                <td class="tl">분류분류분류분류1</td>
                                <td class="tl">분류분류분류분류분2</td>
                                <td class="tl">분류분류분류분류분류분류3</td>
                                <td>성인</td>
                                <td>120</td>
                                <td>2021.10.05</td>
                                <td></td>
                                <td></td>
                                <td><span class="link">섭외중</span></td>
                                <td>노출</td>
                                <td><button class="sm-btn blue-btn">수정</button></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="tl"></td>
                                <td class="tl"></td>
                                <td class="tl"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="tl"></td>
                                <td class="tl"></td>
                                <td class="tl"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="tl"></td>
                                <td class="tl"></td>
                                <td class="tl"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="tl"></td>
                                <td class="tl"></td>
                                <td class="tl"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="tl"></td>
                                <td class="tl"></td>
                                <td class="tl"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="tl"></td>
                                <td class="tl"></td>
                                <td class="tl"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="tl"></td>
                                <td class="tl"></td>
                                <td class="tl"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="tl"></td>
                                <td class="tl"></td>
                                <td class="tl"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="page-wrap">
                    <ul class="paging">
                        <li><a>&lt;&lt;</a></li>
                        <li><a>&lt;</a></li>
                        <li class="on"><a>1</a></li>
                        <li><a>2</a></li>
                        <li><a>3</a></li>
                        <li><a>4</a></li>
                        <li><a>5</a></li>
                        <li><a>6</a></li>
                        <li><a>7</a></li>
                        <li><a>8</a></li>
                        <li><a>9</a></li>
                        <li><a>10</a></li>
                        <li><a>&gt;</a></li>
                        <li><a>&gt;&gt;</a></li>
                    </ul>
                </div>