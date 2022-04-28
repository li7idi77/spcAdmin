<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>

<!-- 공통 JavaScript -->
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>

<script type="text/javascript">
	
	$(document).ready(function(){		
		getBoardDetail();		
	});
	
	/** 게시판 - 목록 페이지 이동 */
	function goBoardList(){	
		var frm = document.boardForm;
		frm.action = "<c:url value='/board/boardList.do'/>";
		frm.submit();
	}
	
	/** 게시판 - 상세 조회  */
	function getBoardDetail(boardSeq){
		
		var boardSeq = $("#board_seq").val();

		if(boardSeq != ""){
			
			$.ajax({	
				
			    url     : "<c:url value='/board/getBoardDetail.do'/>",
			    data    : $("#boardForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	getBoardDetailCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
		} else {
			alert("오류가 발생했습니다.\n관리자에게 문의하세요.");
		}			
	}

	
	/** 게시판 - 상세 조회  콜백 함수 */
	function getBoardDetailCallback(obj){
		
		var str = "";
		
		if(obj != null){								
							
			var boardSeq		= obj.board_seq; 
			var boardReRef 		= obj.board_re_ref; 
			var boardReLev 		= obj.board_re_lev; 
			var boardReSeq 		= obj.board_re_seq; 
			var boardWriter 	= obj.board_writer; 
			var boardSubject 	= obj.board_subject; 
			var boardContent 	= obj.board_content; 
			var boardHits 		= obj.board_hits;
			var delYn 			= obj.del_yn; 
			var insUserId 		= obj.ins_user_id;
			var insDate 		= obj.ins_date; 
			var updUserId 		= obj.upd_user_id;
			var updDate 		= obj.upd_date;
					
			$("#board_subject").val(boardSubject);			
			$("#board_content").val(boardContent);
			$("#board_writer").val(boardWriter);
			
		} else {			
			alert("등록된 글이 존재하지 않습니다.");
			return;
		}		
	}
	
	/** 게시판 - 수정  */
	function updateBoard(){

		var board_subject = $("#board_subject").val();
		var board_content = $("#board_content").val();
		var board_writer = $("#board_writer").val();
	
			
		if (board_subject == ""){			
			alert("제목을 입력해주세요.");
			$("#board_subject").focus();
			return;
		}
		if (board_writer == ""){			
			alert("이름을 입력해주세요.");
			$("#board_writer").focus();
			return;
		}
		
		if (board_content == ""){			
			alert("내용을 입력해주세요.");
			$("#board_content").focus();
			return;
		}
		
		var yn = confirm("게시글을 수정하시겠습니까?");		
		if(yn){
				
			$.ajax({	
			    url     : "<c:url value='/board/updateBoard.do'/>",
			    data    : $("#boardForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
		        async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	updateBoardCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		    });
		}
	}
	
	/** 게시판 - 수정 콜백 함수 */
	function updateBoardCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("게시글 수정을 성공하였습니다.");				
				goBoardList();				 
			} else {				
				alert("게시글 수정을 실패하였습니다.");	
				return;
			}
		}
	}
		
</script>
</head>
<body>
<div id="wrap">
	<div id="container">
		<div class="inner">	
			<h2>게시글 상세</h2>
			<form id="boardForm" name="boardForm">	
				<table width="100%" class="table02">
				<caption><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></caption>
				    <colgroup>
				         <col width="20%">
				        <col width="*">
				    </colgroup>
				    <tbody id="tbody">
				       <tr>
							<th>제목<span class="t_red">*</span></th>
							<td><input id="board_subject" name="board_subject" value="" class="tbox01"/></td>
						</tr>
						 <tr>
							<th>작성자</th>
							<td><input id="board_writer" name="board_writer" size="20"   readonly/></td>
						</tr>
						<tr>
							<th>내용<span class="t_red">*</span></th>
							<td colspan="3"><textarea id="board_content" name="board_content" cols="50" rows="5" class="textarea01"></textarea></td>
						</tr>
				    </tbody>
				</table>	
				<input type="hidden" id="board_seq"		name="board_seq"	value="${boardSeq}"/> <!-- 게시글 번호 -->
				<input type="hidden" id="search_type"	name="search_type"	value="U"/> <!-- 조회 타입 - 상세(S)/수정(U) -->
			</form>
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goBoardList();">목록으로</button>
				<button type="button" class="btn black" onclick="javascript:updateBoard();">수정하기</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>