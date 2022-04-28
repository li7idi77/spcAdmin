<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 작성</title>

<!-- 공통 JavaScript -->
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>

<script type="text/javascript">
	
	$(document).ready(function(){		
	});
		
	/** 게시판 - 목록 페이지 이동 */
	function goBoardList(){	
		var frm = document.boardForm;
		frm.action = "<c:url value='/board/boardList.do'/>";
		frm.submit();
	}
	
	/** 게시판 - 작성  */
	function insertBoard(){
	
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
		
		var formData = new FormData(); 
		formData.append("board_subject", board_subject);
		formData.append("board_content", board_content);
		formData.append("board_writer", board_writer);
		//formData.append("board_content", $("textarea[name=board_content]").text());
		formData.append("file_names", $("input[name=fileNm]")[0].files[0]);

		var yn = confirm("게시글을 등록하시겠습니까?");		
		if(yn){
				
			$.ajax({	
				//data    : $("#boardForm").serialize(),
			    url		   : "<c:url value='/board/insertBoard.do'/>",
			    data       : formData,
			    //enctype    : 'multipart/form-data',
		        dataType   : "JSON",
		        processData: false, 
		        contentType: false,
				type	: "POST",	
		        success : function(obj) {
		        	insertBoardCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		    });
		}
	}	
	/** 게시판 - 작성 콜백 함수 */
	function insertBoardCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("게시글 등록을 성공하였습니다.");				
				goBoardList();				 
			} else {				
				alert("게시글 등록을 실패하였습니다.");	
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
			<h2>게시글 작성</h2>
			<form id="boardForm" name="boardForm"  method="post"  enctype="multipart/form-data" >
				<table width="100%" class="table02">
				<caption><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></caption>
				    <colgroup>
				        <col width="20%">
				        <col width="*">
				    </colgroup>
				    <tbody id="tbody">
						<tr>
							<th>제목<span class="t_red">*</span></th>
							<td><input id="board_subject" name="board_subject" size="20"/></td>
						</tr>
						<tr>
							<th>작성자<span class="t_red">*</span></th>
							<td><input id="board_writer" name="board_writer" size="20"/></td>
						</tr>
						<tr>
							<th>내용<span class="t_red">*</span></th>
							<td><textarea id="board_content" name="board_content" cols="60" rows="10" ></textarea></td>
						</tr>
						<tr>
							<th>내용<span class="t_red">*</span></th>
							<td><input name="fileNm" type="file" id="fileNm"/></td>
						</tr>
				    </tbody>
				</table>
			</form>
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goBoardList();">목록으로</button>
				<button type="button" class="btn black" onclick="javascript:insertBoard();">등록하기</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>

