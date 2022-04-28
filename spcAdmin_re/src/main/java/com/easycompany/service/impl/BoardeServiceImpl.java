package com.easycompany.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.mapper.BoardMapper;
import com.easycompany.service.BoardService;
import com.easycompany.service.vo.BoardVo;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("boardService")
public  class BoardeServiceImpl extends EgovAbstractServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper boardMapper;	
	
	public List<BoardVo> getBoardList(DefaultVO searchVO) throws Exception{
		return boardMapper.getBoardList(searchVO);
	}
	  
	public int getBoardCount(DefaultVO searchVO) {
		return boardMapper.getBoardCount(searchVO);
	}

	public int insertBoard(BoardVo boardVo) {
		
		if(boardVo.getFile_uuid() != null && boardVo.getFile_uuid().length() > 0) {
			boardMapper.insertBoardFile(boardVo);
		}
		return boardMapper.insertBoard(boardVo);
	}
	public BoardVo getBoardDetail(BoardVo boardVo) {
		return (BoardVo)boardMapper.getBoardDetail(boardVo);
	}
	
	public int deleteBoard(BoardVo boardVo) {
		return boardMapper.deleteBoard(boardVo);
	}
	
	public int updateBoard(BoardVo boardVo) {
		return boardMapper.updateBoard(boardVo);
	}
	public int insertBoardReply(BoardVo boardVo) {
		
		BoardVo boardReplayInfo = boardMapper.getBoardReplyInfo(boardVo);

		boardVo.setBoard_seq(boardReplayInfo.getBoard_seq());
		boardVo.setBoard_re_lev(boardReplayInfo.getBoard_re_lev());
		boardVo.setBoard_re_ref(boardReplayInfo.getBoard_re_ref());
		boardVo.setBoard_re_seq(boardReplayInfo.getBoard_re_seq());
		
		boardMapper.updateBoardReSeq(boardVo);
		
		return boardMapper.insertBoardReply(boardVo);
	}
	

	
}
