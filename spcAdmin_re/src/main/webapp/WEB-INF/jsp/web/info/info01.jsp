
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


     <!-- container  begin -->
     <div id="container">

         <div class="tit-wrap">
             <h1 class="h1-tit">생명지킴이 교육</h1>

             <div class="side-cont">
                 <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                 <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                 <span>개요</span>
                 <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                 <span>생명지킴이 교육</span>
             </div>
         </div>

         <div class="contents-wrap">

                        <div class="comp">
                            <h2 class="h2-tit">주요내용</h2>
                            <p class="txt">자살에 대한 올바른 지식, 생명지킴이의 개념, 생명지킴이의 역할, 생명지킴이 역할 수행 시 알아야 할 정보, 자살위기자가 도움받을 수 있는 기관 등의 자원을 알려줍니다.</p>
                        </div>

                        <div class="comp">
                            <h2 class="h2-tit">신청방법</h2>
                            
                            <ul class="dot-list">
                                <li>교육비는 무료로, 만 14세 이상 회원가입을 한 누구나 교육을 신청하고, 수강할 수 있습니다.</li>
                                <li>온라인 교육은 현재 “보고듣고말하기2.0(기본형, 중학생, 고등학생, 청년편, 중년편)”과 “이어줌人(청소년, 노인)”, “연예 관련 종사자 대상 자살예방 교육”만 제공하고 있으며, 생명지킴이 교육신청 > 교육신청 > 온라인교육에서 상시 학습 가능합니다.</li>
                                <li>생명지킴이 교육신청 > 교육신청 > 교육 기관별에서는 대면교육, 실시간 화상교육(줌)으로 진행되는 모든 생명지킴이 교육 프로그램 목록이 있습니다. 해당 기관으로 문의 후 교육 신청을 하시기 바랍니다.</li>
                            </ul>

                        </div>


                        <div class="comp">
                            <h2 class="h2-tit">생명지킴이 교육 프로그램의 종류</h2>
                            
                            <ul class="dot-list">
                                <li>
                                    <p>아래의 프로그램은 한국생명존중희망재단에서 개발 및 보급하는 것으로 자세한 내용은 재단 통합 홈페이지(<a href="https://www.kfsp.org/">https://www.kfsp.org/</a>)의 자료실 > 자살예방 프로그램 인증제 > 프로그램 자료실에서 확인하실 수 있습니다. 또한, 해당 내용에 대해 문의사항이 있을 경우에는 교육운영팀(02-3706-0421~5) 및 기획개발팀(02-3706-0411~4)으로 연락하시기 바랍니다.</p>

                                    <div class="table-wrap">
                                        <table class="list-tb">
                                            <colgroup>
                                                <col width="6%"/>
                                                <col width="30%"/>
                                                <col width="*"/>
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>프로그램명</th>
                                                    <th>내용</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <th>보고듣고말하기 직장인(1.6W)</th>
                                                    <td>
                                                        <p class="tl">직장인을 위한 보고듣고말하기 교육으로 국내 자살 현황 및 실태, 자살의 위험요인 및 보호요인을 파악하는 자살예방교육 자료를 제공하며, 자살 위험 대처능력을 향상시키고자 함</p>
                                                        <dl><dt>교육시간</dt><dd>110분</dd><dt>교육인원</dt><dd>최대 200명</dd><dt>교육대상</dt><dd>직장인</dd></dl>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <th>보고듣고말하기2.0</th>
                                                    <td>
                                                        <p class="tl">보고듣고말하기1.6에서 업데이트된 버전이며,</p>
                                                        <ul class="dot-list">
                                                            <li>보기(자살을 암시하는 언어적, 행동적, 상황적 신호 확인)</li>
                                                            <li>듣기(실제 자살생각을 묻고 죽음의 이유와 삶의 이유 경청)</li>
                                                            <li>말하기(안전점검 목록을 확인하고 전문가에게 도움 의뢰)과정을 통해 주변의 자살위기자를 도울 수 있도록 함.<br/>또한, 기본형·중학생·고등학생·청년·중년·노인 버전으로 구성되어 생애주기별 특성을 고려한 생명지킴이 양성이 가능함</li>
                                                        </ul>
                                                        <table class="small-list">
                                                            <colgroup>
                                                                <col width="14%"/>
                                                                <col width="14%"/>
                                                                <col width="14%"/>
                                                                <col width="14%"/>
                                                                <col width="14%"/>
                                                                <col width="14%"/>
                                                                <col width="*"/>
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th>구분</th>
                                                                    <th>기본형</th>
                                                                    <th>중학생</th>
                                                                    <th>고등학생</th>
                                                                    <th>청년</th>
                                                                    <th>중년</th>
                                                                    <th>노인</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <th>교육시간</th>
                                                                    <td>120분</td>
                                                                    <td>45분</td>
                                                                    <td>50분</td>
                                                                    <td>60분</td>
                                                                    <td>60분</td>
                                                                    <td>60분</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>교육대상</th>
                                                                    <td>성인</td>
                                                                    <td>중학생</td>
                                                                    <td>고등학생</td>
                                                                    <td>청년</td>
                                                                    <td>중년</td>
                                                                    <td>노인</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>교육인원</th>
                                                                    <td>최대 200명</td>
                                                                    <td>최대 50명</td>
                                                                    <td>최대 50명</td>
                                                                    <td>최대 200명</td>
                                                                    <td>최대 200명</td>
                                                                    <td>최대 200명</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <th>이어줌人</th>
                                                    <td>
                                                        <p class="tl">생명지킴이교육 프로그램의 다양화를 통해 생명지킴이교육 활성화에 기여하고 있으며, 청소년·대학생·성인·노인·직장인 총 5가지 버전으로 이루어져 있음</p>
                                                        <table class="small-list">
                                                            <colgroup>
                                                                <col width="16%"/>
                                                                <col width="16%"/>
                                                                <col width="18%"/>
                                                                <col width="16%"/>
                                                                <col width="*"/>
                                                                <col width="16%"/>
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th>구분</th>
                                                                    <th>청소년</th>
                                                                    <th>대학생</th>
                                                                    <th>성인</th>
                                                                    <th>노인</th>
                                                                    <th>직장인</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <th>교육시간</th>
                                                                    <td>50분</td>
                                                                    <td>60분</td>
                                                                    <td>110분</td>
                                                                    <td>50분</td>
                                                                    <td>60분</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>교육대상</th>
                                                                    <td>14~19세</td>
                                                                    <td>대학생 및 대학생 연령대</td>
                                                                    <td>성인</td>
                                                                    <td>65세 이상 노인 관련 기관 실무자</td>
                                                                    <td>직장인</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>교육인원</th>
                                                                    <td>최대 50명</td>
                                                                    <td>최대 200명</td>
                                                                    <td>최대 200명</td>
                                                                    <td>최대 200명</td>
                                                                    <td>최대 200명</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <th>보건복지종사자 대상 자살예방 생명지킴이 교육 프로그램</th>
                                                    <td>
                                                        <p class="tl">보건복지종사자를 위한 교육으로 지역사회 내 자살위험군을 신속히 발굴하여 전문기관에 연계할 수 있도록 함. 기본편과 심화편으로 이루어졌으며, 심화편은 청소년·성인·노인 대상 실무자용으로 구성됨</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>5</td>
                                                    <th>연예 관련 종사자 대상 자살예방 교육</th>
                                                    <td>
                                                        <p class="tl">연예인의 자살을 예방하기 위해 연예 산업 종사자 및 매니저를 대상으로 한 자살예방교육 제공</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>6</td>
                                                    <th>의료기관 보건의료인력 대상 자살예방 생명지킴이 교육 프로그램</th>
                                                    <td>
                                                        <p class="tl">일차 및 이차 의료기관에 종사하는 보건의료인력(의사 및 간호사)의 자살 위기 환자에 대한 인지율 향상과 선별 및 대처방법에 대한 교육을 목표로 함</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>7</td>
                                                    <th>정신장애인 자살예방 교육 프로그램</th>
                                                    <td>
                                                        <p class="tl">정신장애인 당사자용·가족용·실무자용으로 구성되었으며, 자살 고위험군인 정신장애인의 자살 위험 신호에 대해 체계적인 정보를 제공하고 자살위험대처 능력을 향상시킬 수 있도록 함</p>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </li>

                                <li>
                                    <p>아래의 프로그램은 재단 외의 기관에서 개발한 것으로 프로그램에 대해 자세한 내용을 알고 싶을 경우, 재단 통합 홈페이지(<a href="https://www.kfsp.org/">https://www.kfsp.org/</a>)의 자료실 > 자살예방 프로그램 인증제 > 프로그램 자료실에서 확인하실 수 있습니다.</p>
                                    
                                    <div class="table-wrap">
                                        <table class="list-tb">
                                            <colgroup>
                                                <col width="6%"/>
                                                <col width="*"/>
                                                <col width="25%"/>
                                                <col width="25%"/>
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>프로그램명</th>
                                                    <th>개발 및 보급기관</th>
                                                    <th>연락처</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>자살예방 주민참여 프로그램</td>
                                                    <td>강서구정신건강복지센터</td>
                                                    <td>02-2600-5926~9</td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="3">2</td>
                                                    <td rowspan="3">이·통장 자살예방 생명지킴이 교육프로그램 「세상살이」</td>
                                                    <td>강원도광역정신건강복지센터</td>
                                                    <td>033-251-2293</td>
                                                </tr>
                                                <tr>
                                                    <td>한림대학교 생사학연구소</td>
                                                    <td>-</td>
                                                </tr>
                                                <tr>
                                                    <td>한림대학교 임상역학연구소</td>
                                                    <td>-</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>생명사랑 틴틴교실 게이트키퍼 버전</td>
                                                    <td rowspan="2">경기도자살예방센터</td>
                                                    <td rowspan="2">031-212-0437</td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td class="border-r">생명사랑 틴틴교실 자해 예방 버전</td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="2">5</td>
                                                    <td rowspan="2">경찰동료 게이트키퍼 교육 프로그램</td>
                                                    <td>경찰청</td>
                                                    <td>02-3150-0264</td>
                                                </tr>
                                                <tr>
                                                    <td>한국EAP협회</td>
                                                    <td>-</td>
                                                </tr>
                                                <tr>
                                                    <td>6</td>
                                                    <td>요즘어때?</td>
                                                    <td>광주동구정신건강복지센터</td>
                                                    <td>062-233-0468</td>
                                                </tr>
                                                <tr>
                                                    <td>7</td>
                                                    <td>생명지구대</td>
                                                    <td rowspan="2">광주북구정신건강복지센터</td>
                                                    <td rowspan="2">062-267-5510</td>
                                                </tr>
                                                <tr>
                                                    <td>8</td>
                                                    <td class="border-r">마인드프렌즈</td>
                                                </tr>
                                                <tr>
                                                    <td>9</td>
                                                    <td>소방공무원 동료 게이트키퍼 훈련 프로그램 봄!봄!봄!</td>
                                                    <td rowspan="2">구미정신건강복지센터</td>
                                                    <td rowspan="2">054-444-0199</td>
                                                </tr>
                                                <tr>
                                                    <td>10</td>
                                                    <td class="border-r">또래생명지킴이 훈련 프로그램 ‘나?! 우리학교 게이트키퍼야!’</td>
                                                </tr>
                                                <tr>
                                                    <td>11</td>
                                                    <td>노인생명존중교육 생명충전기</td>
                                                    <td rowspan="2">대구광역자살예방센터</td>
                                                    <td rowspan="2">053-256-0199</td>
                                                </tr>
                                                <tr>
                                                    <td>12</td>
                                                    <td class="border-r">청소년 생명존중교육 생명톡톡</td>
                                                </tr>
                                                <tr>
                                                    <td>13</td>
                                                    <td>청소년 생명존중교육 ‘누군가에게 말해보세요.’</td>
                                                    <td>대구학생자살예방센터</td>
                                                    <td>053-326-9279/9280</td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="2">14</td>
                                                    <td rowspan="2">응급의료종사자대상 자살 관련 교육</td>
                                                    <td>대한응급의학회</td>
                                                    <td>-</td>
                                                </tr>
                                                <tr>
                                                    <td>대한응급의료지도의사협의회</td>
                                                    <td>-</td>
                                                </tr>
                                                <tr>
                                                    <td>15</td>
                                                    <td>생명보듬이(Gatekeeper) 기초교육 ‘무지개’</td>
                                                    <td>라이프호프기독교자살예방센터</td>
                                                    <td>03-2138-0807</td>
                                                </tr>
                                                <tr>
                                                    <td>16</td>
                                                    <td>생명존중약국 생명지킴이 양성 교육</td>
                                                    <td>부산서구정신건강복지센터</td>
                                                    <td>051-246-1981</td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="2">17</td>
                                                    <td rowspan="2">교사를 위한 자살예방지킴이 교육</td>
                                                    <td>서울시자살예방센터</td>
                                                    <td>02-3458-1000</td>
                                                </tr>
                                                <tr>
                                                    <td>18</td>
                                                    <td>자살예방 지킴이 훈련 프로그램</td>
                                                </tr>
                                                <tr>
                                                    <td>19</td>
                                                    <td>자살예방 게이트키퍼 교육 프로그램</td>
                                                    <td>성남시정신건강복지센터 부설 자살예방센터</td>
                                                    <td>031-754-3220</td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="2">20</td>
                                                    <td rowspan="2">소방공무원을 위한 보고듣고말하기(내근직편·화재구조편·구급편)</td>
                                                    <td>소방청</td>
                                                    <td>044-205-7422~3</td>
                                                </tr>
                                                <tr>
                                                    <td>한국자살예방협회</td>
                                                    <td>-</td>
                                                </tr>
                                                <tr>
                                                    <td>21</td>
                                                    <td>청소년 자살예방 게이트키퍼 양성 프로그램 친구사이</td>
                                                    <td rowspan="2">수원시자살예방센터</td>
                                                    <td rowspan="2">031-247-3279</td>
                                                </tr>
                                                <tr>
                                                    <td>22</td>
                                                    <td class="border-r">(노인대상)생명지킴이양성교육 이심전심</td>
                                                </tr>
                                                <tr>
                                                    <td>23</td>
                                                    <td>안녕하십니까?</td>
                                                    <td rowspan="2">전라남도광역정신건강복지센터</td>
                                                    <td rowspan="2">061-350-1700</td>
                                                </tr>
                                                <tr>
                                                    <td>24</td>
                                                    <td class="border-r">청소년용 생명지킴이 양성교육 프로그램 “안녕, 괜찮니?”</td>
                                                </tr>
                                                <tr>
                                                    <td>25</td>
                                                    <td>생명지킴이 전문강사과정</td>
                                                    <td rowspan="4">전라북도광역정신건강복지센터</td>
                                                    <td rowspan="4">063-251-0650~1</td>
                                                </tr>
                                                <tr>
                                                    <td>26</td>
                                                    <td class="border-r">청소년 전담인력 생명지킴이</td>
                                                </tr>
                                                <tr>
                                                    <td>27</td>
                                                    <td class="border-r">생명사랑 지킴이 양성교육&강사양성교육</td>
                                                </tr>
                                                <tr>
                                                    <td>28</td>
                                                    <td class="border-r">자살예방교육 프로그램 소중한 ‘숨’</td>
                                                </tr>
                                                <tr>
                                                    <td>29</td>
                                                    <td>생명사랑지킴이양성교육 ‘생명사랑톡톡65+’</td>
                                                    <td>제주광역정신건강복지센터</td>
                                                    <td>064-717-3000</td>
                                                </tr>
                                                <tr>
                                                    <td>30</td>
                                                    <td>경찰용 생명지킴이 양성교육‘생명배달’</td>
                                                    <td rowspan="3">충청북도광역정신건강복지센터</td>
                                                    <td rowspan="3">043-217-0597</td>
                                                </tr>
                                                <tr>
                                                    <td>31</td>
                                                    <td class="border-r">소방용 생명지킴이 양성교육‘생명배달’</td>
                                                </tr>
                                                <tr>
                                                    <td>32</td>
                                                    <td class="border-r">생명지킴이 양성교육‘생명배달’</td>
                                                </tr>
                                                <tr>
                                                    <td>33</td>
                                                    <td>생명이어달리기(청소년용·성인용·노인용)</td>
                                                    <td>충청남도광역정신건강복지센터</td>
                                                    <td>041-633-9185</td>
                                                </tr>
                                                <tr>
                                                    <td>34</td>
                                                    <td>성소수자 자살예방지킴이 양성교육 무지개돌봄</td>
                                                    <td>한국게이인권운동단체 친구사이</td>
                                                    <td>02-745-7942</td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="2">35</td>
                                                    <td rowspan="2">교사용 보고듣고말하기(게이트키퍼 전문인력양성) 프로그램</td>
                                                    <td>한국교육환경보호원<br/>(센터:학생정신건강지원센터)</td>
                                                    <td>02-6959-4640</td>
                                                </tr>
                                                <tr>
                                                    <td>한국자살예방협회</td>
                                                    <td>-</td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="2">36</td>
                                                    <td rowspan="2">공군을 위한 보고듣고말하기<br/>1.8AF</td>
                                                    <td>공군본부</td>
                                                    <td>042-552-1227</td>
                                                </tr>
                                                <tr>
                                                    <td>한국자살예방협회</td>
                                                    <td>-</td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="2">37</td>
                                                    <td rowspan="2">육군을 위한 보고듣고말하기<br/>1.9KN</td>
                                                    <td>육군본부</td>
                                                    <td>042-550-1351</td>
                                                </tr>
                                                <tr>
                                                    <td>한국자살예방협회</td>
                                                    <td>-</td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="2">38</td>
                                                    <td rowspan="2">해군을 위한 보고듣고말하기<br/>1.9KN</td>
                                                    <td>해군본부</td>
                                                    <td>042-550-1354</td>
                                                </tr>
                                                <tr>
                                                    <td>한국자살예방협회</td>
                                                    <td>-</td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="2">39</td>
                                                    <td rowspan="2">해병대를 위한 보고듣고말하기<br/>1.9ROKMC</td>
                                                    <td>해병대사령부</td>
                                                    <td>031-8012-3148</td>
                                                </tr>
                                                <tr>
                                                    <td>한국자살예방협회</td>
                                                    <td>-</td>
                                                </tr>
                                                <tr>
                                                    <td>40</td>
                                                    <td>청소년 자살예방 게이트키퍼 양성교육 ‘WHAT’S UP‘</td>
                                                    <td>화성시정신건강복지센터</td>
                                                    <td>031-352-0175</td>
                                                </tr>
                                                <tr>
                                                    <td>41</td>
                                                    <td>자살시도 중재협상 프로그램</td>
                                                    <td>㈜CNS</td>
                                                    <td>02-722-5869</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--  container end -->
     </div>
   