package com.easycompany.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.easycompany.service.vo.AdBoardVo;
import com.easycompany.service.vo.BoardVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("adBoardMapper")
public class AdBoardMapper extends EgovAbstractMapper {
	
	String nameSpace = "com.easycompany.mapper.AdBoardMapper";

	public List<AdBoardVo> getBoardList(AdBoardVo adBoardVo) {
		return selectList(nameSpace + ".getBoardList", adBoardVo);
	}

	public int getBoardCount(AdBoardVo adBoardVo) {
		return selectOne(nameSpace + ".getBoardCount", adBoardVo);
	}

	public AdBoardVo selectDetailBoard(AdBoardVo adBoardVo) {
		return selectOne(nameSpace + ".selectDetailBoard", adBoardVo);
	}

	public int insertBoard(AdBoardVo adBoardVo) {
		return (Integer) insert(nameSpace + ".insertBoard", adBoardVo);
	}

	public int updateBoard(AdBoardVo adBoardVo) {
		return (Integer) update(nameSpace + ".updateBoard", adBoardVo);
	}

	public int delBoard(HashMap<String, Object> map) {
		return (Integer) update(nameSpace + ".delBoard", map);
	}

	public void insertFile(Map<String, Object> fileSavelist) {
		insert(nameSpace + ".insertFile", fileSavelist);
		
	}

	public List<BoardVo> selectFileList(AdBoardVo adBoardVo) {
		return selectList(nameSpace + ".selectFileList", adBoardVo);
	}

	public BoardVo selectFile(BoardVo boardVo) {
		return selectOne(nameSpace + ".selectFile", boardVo);
	}

	public int deleteBoardFile(BoardVo boardVo) {
		return Integer.valueOf(delete(this.nameSpace + ".deleteBoardFile", boardVo)).intValue();
	}

	public int deleteBoardMapFile(HashMap<String, Object> map) {
		return Integer.valueOf(delete(this.nameSpace + ".deleteBoardMapFile", map)).intValue();
	}

	public List<Map<String, Object>> delFileSelect(HashMap<String, Object> map) {
		return selectList(nameSpace + ".delFileSelect", map);
	}

	public int updateBoardViewCount(AdBoardVo adBoardVo) {
		return (Integer) update(nameSpace + ".updateBoardViewCount", adBoardVo);
	}
	
	public AdBoardVo selectViewDetailBoard(AdBoardVo adBoardVo) {
		return selectOne(nameSpace + ".selectViewDetailBoard", adBoardVo);
	}
}
