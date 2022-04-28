package com.easycompany.mapper;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.service.vo.BoardVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("boardMapper")
public class BoardMapper extends EgovAbstractMapper{

	//private static final Logger LOGGER = LoggerFactory.getLogger(BoardMapper.class);
	
	String nameSpace = "com.easycompany.mapper.BoardMapper";
	
	public List<BoardVo> getBoardList(DefaultVO searchVO) throws DataAccessException {
		return selectList(nameSpace + "." +"getBoardList", searchVO);
	}


	public int getBoardCount(DefaultVO searchVO) {
		return (Integer)selectOne(nameSpace + "." +"getBardCount", searchVO);
	}

	public int insertBoard(BoardVo boardVo) {
		return (Integer) insert(nameSpace + "." + "insertBoard", boardVo);
	}
	
	public int insertBoardFile(BoardVo boardVo) {
		return (Integer) insert(nameSpace + "." + "insertBoardFile", boardVo);
	}
	
	public BoardVo getBoardDetail(BoardVo boardVo) {
		
		String searchType = boardVo.getSearch_type();

		if ("S".equals(searchType)) {
			update(nameSpace + "." + "updateBoardHits", boardVo);
		}
		return (BoardVo)selectOne(nameSpace + "." +"getBoardDetail", boardVo);
	}
	
	public int deleteBoard(BoardVo boardVo) {
		return (Integer) delete(nameSpace + "." + "deleteBoard", boardVo);
	}
	
	public int updateBoard(BoardVo boardVo) {
		return (Integer) update(nameSpace + "." + "updateBoard", boardVo);
	}
	
	public BoardVo getBoardReplyInfo(BoardVo boardVo) {
		return (BoardVo)selectOne(nameSpace + "." +"getBoardReplyInfo", boardVo);
	}
	
	public int updateBoardReSeq(BoardVo boardVo) {
		return (Integer) update(nameSpace + "." + "updateBoardReSeq", boardVo);
	}
	
	public int insertBoardReply(BoardVo boardVo) {
		return (Integer) insert(nameSpace + "." + "insertBoardReply", boardVo);
	}
	
	
	
}
