package com.easycompany.web;

import java.io.File;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.easycompany.cmm.util.FileUtil;
import com.easycompany.cmm.util.StringUtil;
import com.easycompany.cmm.vo.DefaultVO;

import com.easycompany.service.vo.BoardVo;
import com.easycompany.service.BoardService;
import com.easycompany.service.DepartmentService;
import com.easycompany.service.EmployeeService;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("board")
public class BoardController {

	
	@Autowired
	private BoardService boardService;
	
	/** EgovPropertyService */
	@Autowired
	protected EgovPropertyService propertiesService;
	
	@Value("#{dbinfo['file.path']}")
	private String filePath;

	/** 게시판 - 목록  */
	@RequestMapping(value = "/boardList.do")
	public String getBoardList(@ModelAttribute("searchVO") DefaultVO searchVo, ModelMap model) throws Exception {

		/** EgovPropertyService.sample */
		searchVo.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVo.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVo.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVo.getPageUnit());
		paginationInfo.setPageSize(searchVo.getPageSize());
		
		/***  offSet 설정  ***/
		int offset = ((paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize());
		searchVo.setOffset(offset);
		
		List<BoardVo> list = boardService.getBoardList(searchVo);
		model.addAttribute("resultList", list);
			
		
		int totCnt = boardService.getBoardCount(searchVo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "boardList";
	}

	/** 게시판 - 글쓰기 */
	@RequestMapping(value = "/boardWrite.do")
	public String getBoardWrite(@ModelAttribute("searchVO") DefaultVO searchVo, ModelMap model) throws Exception {

		model.addAttribute("searchVo", searchVo);
		return "boardWrite";
	}
	
	/** 게시판 - 등록 */
	@RequestMapping(value = "/insertBoard.do")
	@ResponseBody
	public BoardVo insertBoard(HttpServletRequest request, BoardVo boardVo) throws Exception {
	    
		//fileUpload
		BoardVo fileVo= FileUtil.uploadFile ( request,  filePath);
		
		boardVo.setFile_uuid(fileVo.getFile_uuid());
		boardVo.setFile_name(fileVo.getFile_name());
		boardVo.setFile_full_path(fileVo.getFile_full_path());
		boardVo.setFile_size(fileVo.getFile_size());
	    int resultCnt = boardService.insertBoard(boardVo);
        boardVo.setResult((resultCnt > 0 ? "SUCCESS" : "FAIL") );
        
       return boardVo;
	}

	/** 게시판 - 글 상세 보기 **/
	
	@RequestMapping(value = "/boardView.do")
	public String getBoardView(HttpServletRequest request, HttpServletResponse response,BoardVo boardVo, ModelMap model) throws Exception {
		
	   model.addAttribute("searchVo", boardVo);
	   model.addAttribute("boardSeq", boardVo.getBoard_seq());
       return "boardView";
	}
	
	/** 게시판 - 상세 조회 */
	@RequestMapping(value = "/getBoardDetail.do")
	@ResponseBody
	public BoardVo getBoardDetail(HttpServletRequest request, HttpServletResponse response, BoardVo boardVo) throws Exception {

		
		BoardVo boardVoForm = (BoardVo)boardService.getBoardDetail(boardVo);

		return boardVoForm;
	}
	
	/** 게시판 - 삭제 */
	@RequestMapping(value = "/deleteBoard.do")
	@ResponseBody
	public BoardVo deleteBoard(HttpServletRequest request, HttpServletResponse response, BoardVo boardVo) throws Exception {

		int resultCnt = boardService.deleteBoard(boardVo);
	    boardVo.setResult((resultCnt > 0 ? "SUCCESS" : "FAIL") );    
	    return boardVo;
	}
	
	/** 게시판 - 수정 페이지 이동 */
	@RequestMapping(value = "/boardUpdate.do")
	public String boardUpdate(HttpServletRequest request, HttpServletResponse response,BoardVo boardVo, ModelMap model) throws Exception {
		model.addAttribute("searchVo", boardVo);
		model.addAttribute("boardSeq", boardVo.getBoard_seq());
		return "boardUpdate";
	}

	/** 게시판 - 수정 */
	@RequestMapping(value = "/updateBoard.do")
	@ResponseBody
	public BoardVo updateBoard(HttpServletRequest request, HttpServletResponse response, BoardVo boardVo) throws Exception {

		int resultCnt = boardService.updateBoard(boardVo);
		boardVo.setResult((resultCnt > 0 ? "SUCCESS" : "FAIL") );  
		return boardVo;
	}
		
	/** 게시판 - 답글 페이지 이동 */
	@RequestMapping(value = "/boardReply.do")
	public String boardReply(HttpServletRequest request, HttpServletResponse response,BoardVo boardVo, ModelMap model) throws Exception {
		model.addAttribute("searchVo", boardVo);
		model.addAttribute("boardSeq", boardVo.getBoard_seq());
		return "boardReply";
	}

	/** 게시판 - 답글 등록 */
	@RequestMapping(value = "/insertBoardReply.do")
	@ResponseBody
	public BoardVo insertBoardReply(HttpServletRequest request, HttpServletResponse response, BoardVo boardVo) throws Exception {
		
		int resultCnt = boardService.insertBoardReply(boardVo);
		boardVo.setResult((resultCnt > 0 ? "SUCCESS" : "FAIL") );  
		return boardVo;
	}
	
	/** 게시판 -   File Downlaod */
	@RequestMapping(value = "/fileDownload.do")
	@ResponseBody
	public void fileDownload(HttpServletRequest request, HttpServletResponse response, BoardVo boardVo) throws Exception {
		
		BoardVo boardVoForm = (BoardVo)boardService.getBoardDetail(boardVo);
		FileUtil.fileDownload(request, response, boardVoForm);
		
	}
}
