package com.easycompany.service;

import java.util.List;


import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.service.vo.BoardVo;


public interface BoardService {
	
	
	public List<BoardVo> getBoardList(DefaultVO searchVO) throws Exception;
	public int getBoardCount(DefaultVO searchVO);
	public int insertBoard(BoardVo boardVo);
	public BoardVo getBoardDetail(BoardVo boardVo);
	public int deleteBoard(BoardVo boardVo);	
	public int updateBoard(BoardVo boardVo);
	public int insertBoardReply(BoardVo boardVo);
	
	
}
