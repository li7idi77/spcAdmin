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

<h1 class="h1-tit">수강생/수료생 현황</h1>

<div class="search-wrap">
    <div class="search-cont search-sub">
        <div class="radio-cont">
            <input type="radio" class="radio-box" id="" name="" value="" checked>
            <label for="">전체</label>
        </div>
        <div class="radio-cont">
            <input type="radio" class="radio-box" id="" name="" value="">
            <input type="text" class="input-box" placeholder="회원명 직저입력"/>
        </div>

        <button class="search-btn">검색</button>
        <button type="button" class="search-btn white-btn ml20" onClick="fn_clear();">초기화</button>
    </div>
</div>

<div class="btn-cont mb20">
    <dl class="count-txt">
        <dt>수강생 <span>2700</span></dt>
    </dl>

    <button class="mid-btn black-btn">엑셀다운</button>
    <button class="mid-btn white-btn">선택삭제</button>
</div>

<div class="table-wrap">
    <table class="list-tb">
        <caption>선택, 분류3, 회원명(ID), 수강 시작일, 총 학습인증시간, 총 누적학습시간 정보가 있는 테이블</caption>
        <colgroup>
            <col width="8%"/>
            <col width="8%"/>
            <col width="*"/>
            <col width="14%"/>
            <col width="14%"/>
            <col width="14%"/>
            <col width="14%"/>
        </colgroup>
        <thead>
            <tr>
                <th><input type="checkbox" class="check-box"/></th>
                <th>No.</th>
                <th>분류3</th>
                <th>회원명(ID)</th>
                <th>수강 시작일</th>
                <th>총 학습 인증시간</th>
                <th>총 누적 학습시간</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="checkbox" class="check-box"/></td>
                <td>1</td>
                <td class="tl">보고 듣고 말하기 2.0</td>
                <td>
                    <a class="link">
                        <span class="block">이보람</span><span class="block">fgfdfdgfdgg</span>
                    </a>
                </td>
                <td>2021.10.05</td>
                <td><span>01</span>시간<span>25</span>분<span>10</span>초</td>
                <td><span>00</span>시간<span>25</span>분<span>10</span>초</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td class="tl"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td class="tl"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td class="tl"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td class="tl"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td class="tl"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td class="tl"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td class="tl"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td class="tl"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td class="tl"></td>
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