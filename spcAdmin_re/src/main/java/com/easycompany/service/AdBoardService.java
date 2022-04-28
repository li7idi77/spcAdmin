package com.easycompany.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.easycompany.service.vo.AdBoardVo;
import com.easycompany.service.vo.BoardVo;

public interface AdBoardService {

	List<AdBoardVo> getBoardList(AdBoardVo adBoardVo);

	int getBoardCount(AdBoardVo adBoardVo);

	AdBoardVo selectDetailBoard(AdBoardVo adBoardVo);

	int insertBoard(AdBoardVo adBoardVo, List<Map<String, Object>> fileSavelist);

	int updateBoard(AdBoardVo adBoardVo, List<Map<String, Object>> fileSavelist);

	int delBoard(HashMap<String, Object> map);

	List<BoardVo> selectFileList(AdBoardVo adBoardVo);

	BoardVo selectFile(BoardVo boardVo);
	
	int updateBoardViewCount(AdBoardVo adBoardVo);
	
	AdBoardVo selectViewDetailBoard(AdBoardVo adBoardVo);

}
