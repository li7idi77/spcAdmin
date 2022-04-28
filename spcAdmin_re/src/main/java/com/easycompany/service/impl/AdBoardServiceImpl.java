package com.easycompany.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easycompany.cmm.util.FileUtil;
import com.easycompany.cmm.util.StringUtil;
import com.easycompany.mapper.AdBoardMapper;
import com.easycompany.service.AdBoardService;
import com.easycompany.service.vo.AdBoardVo;
import com.easycompany.service.vo.BoardVo;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("adBoardService")
@Transactional
public class AdBoardServiceImpl extends EgovAbstractServiceImpl implements AdBoardService {
	
	@Autowired
	private AdBoardMapper adBoardMapper;

	@Override
	public List<AdBoardVo> getBoardList(AdBoardVo adBoardVo) {
		return adBoardMapper.getBoardList(adBoardVo);
	}

	@Override
	public int getBoardCount(AdBoardVo adBoardVo) {
		return adBoardMapper.getBoardCount(adBoardVo);
	}

	@Override
	public AdBoardVo selectDetailBoard(AdBoardVo adBoardVo) {
		return adBoardMapper.selectDetailBoard(adBoardVo);
	}

	@Override
	public int insertBoard(AdBoardVo adBoardVo, List<Map<String, Object>> fileSavelist) {
		int result = adBoardMapper.insertBoard(adBoardVo);
		
		if (fileSavelist.size() > 0) {
			int index = 0; 
			for (Map<String, Object> map : fileSavelist) {
				map.put("file_gubun", "board");
				map.put("file_key", adBoardVo.getBoard_idx());
				map.put("file_oreder_by", index + 1);
				adBoardMapper.insertFile(map);
				index++;
			}
		}
		return result;
	}

	@Override
	public int updateBoard(AdBoardVo adBoardVo, List<Map<String, Object>> fileSavelist) {
		int cnt = 1;
		  
		  //선택된 파일 삭제
		  String[] ArraysStr = adBoardVo.getCheckdstr().split(",");
		  if(ArraysStr.length > 0 ){
			  BoardVo boardVo = new BoardVo();
			  for (String s : ArraysStr) {
		        	if(!StringUtil.isEmpty(s)) {
		        		boardVo.setFile_seq(Integer.parseInt(s));
		        		cnt = adBoardMapper.deleteBoardFile(boardVo);
		        	}        	
		      }   
		  }
		  
		  if (fileSavelist !=null && fileSavelist.size() > 0) {
			  	int index = 0;
		  	    for(int i = 0; i<fileSavelist.size();i++) {
					for (Map<String, Object> map : fileSavelist) {
						map.put("file_gubun", "board");
						map.put("file_key", adBoardVo.getBoard_idx());
						map.put("file_oreder_by", index + 1);
						adBoardMapper.insertFile(map);
						index++;
					}
			  }
		  	    
		  }
		  if (cnt > 0) {
			  return adBoardMapper.updateBoard(adBoardVo);
		  }
	  return cnt;
	}

	@Override
	public int delBoard(HashMap<String, Object> map) {
		List<Map<String, Object>> files = adBoardMapper.delFileSelect(map);
		for (Map<String, Object>file : files) {
			FileUtil.deleteFile((String) file.get("FILE_FULL_PATH"));
		}
		int result = adBoardMapper.delBoard(map);
		if (result > 0) {
			adBoardMapper.deleteBoardMapFile(map);
		}
		return result;
	}

	@Override
	public List<BoardVo> selectFileList(AdBoardVo adBoardVo) {
		return adBoardMapper.selectFileList(adBoardVo);
	}

	@Override
	public BoardVo selectFile(BoardVo boardVo) {
		return adBoardMapper.selectFile(boardVo);
	}
	
	@Override
	public int updateBoardViewCount(AdBoardVo adBoardVo) {
		return adBoardMapper.updateBoardViewCount(adBoardVo);
	}
	
	@Override
	public AdBoardVo selectViewDetailBoard(AdBoardVo adBoardVo) {
		return adBoardMapper.selectViewDetailBoard(adBoardVo);
	}


}
