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
        <h1 class="h1-tit">강사 휴직 신청</h1>


                <div class="search-wrap">
                    <div class="search-cont search-sub">
                        <h3 class="h3-tit">연장사유</h3>

                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="" checked>
                            <label for="">전체</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="">
                            <label for="">출산 및 육아</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="">
                            <label for="">병가</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="">
                            <label for="">해외연수</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="" name="" value="">
                            <label for="">기타</label>
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
                        <caption>선택, 강사명, 지역, 수료증번호, 소속기관, 연장사유, 주소, 연락처, 이메일, 신청서 다운로드, 상태, 수정 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="3%"/>
                            <col width="4%"/>
                            <col width="6%"/>
                            <col width="6%"/>
                            <col width="8%"/>
                            <col width="8%"/>
                            <col width="10%"/>
                            <col width="*"/>
                            <col width="8%"/>
                            <col width="12%"/>
                            <col width="8%"/>
                            <col width="6%"/> 
                            <col width="6%"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th><input type="checkbox" class="check-box"/></th>
                                <th>No.</th>
                                <th>강사명(ID)</th>
                                <th>지역</th>
                                <th>수료증번호</th>
                                <th>소속기관</th>
                                <th>연장사유</th>
                                <th>주소</th>
                                <th>연락처</th>
                                <th>이메일</th>
                                <th>신청서<br/>다운로드</th>
                                <th>상태</th>
                                <th>수정</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox" class="check-box"/></td>
                                <td>1</td>
                                <td><span class="block">이보람</span><span  class="block">fgfdfdgfdgg</span></td>
                                <td>서울</td>
                                <td>128750kgdd765</td>
                                <td>소속기관소속</td>
                                <td>병가</td>
                                <td class="tl">주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소</td>
                                <td>01012345678</td>
                                <td>fgfdfdgfdgg@naver.com</td>
                                <td><a class="link">이보람신청서</a></td>
                                <td>승인</td>
                                <td><button class="sm-btn blue-btn">수정</button></td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" class="check-box"/></td>
                                <td>2</td>
                                <td><span class="block">이보람</span><span  class="block">fgfdfdgfdgg</span></td>
                                <td>서울</td>
                                <td>128750kgdd765</td>
                                <td>소속기관소속</td>
                                <td>병가</td>
                                <td class="tl">주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소</td>
                                <td>01012345678</td>
                                <td>fgfdfdgfdgg@naver.com</td>
                                <td><a class="link">이보람신청서</a></td>
                                <td>미승인</td>
                                <td><button class="sm-btn blue-btn">수정</button></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="tl"></td>
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
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="tl"></td>
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
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="tl"></td>
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
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="tl"></td>
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
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="tl"></td>
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
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="tl"></td>
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
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="tl"></td>
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
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="tl"></td>
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