package com.easycompany.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easycompany.cmm.util.StringUtil;
import com.easycompany.mapper.EduMapper;
import com.easycompany.service.EduService;
import com.easycompany.service.vo.CategoryVo;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("eduService")
@Transactional
public class EduServiceImpl extends EgovAbstractServiceImpl  implements EduService
{

  @Autowired
  private EduMapper eduMapper;

  public List<CategoryVo> getCategoryList(CategoryVo categoryVo)
    throws Exception
  {
    return this.eduMapper.getCategoryList(categoryVo);
  }

  public int getCategoryCount(CategoryVo categoryVo) {
    return this.eduMapper.getCategoryCount(categoryVo);
  }

  public int getCategoryExist(CategoryVo categoryVo) {
    return this.eduMapper.getCategoryExist(categoryVo);
  }

  public int getCourseStatus(CategoryVo categoryVo) {
	    return this.eduMapper.getCourseStatus(categoryVo);
  }
  
  public int insertCatgegory(CategoryVo categoryVo)
  {
    return this.eduMapper.insertCatgegory(categoryVo);
  }

  public int insertEducation(CategoryVo categoryVo)
  {
    int cnt = 1;

    categoryVo.setEdu_no(this.eduMapper.getEducationNo(categoryVo));

    if ("YES".equals(categoryVo.getFileExit())) {
      cnt = this.eduMapper.insertCommonFile(categoryVo);
    }

    if (!"eduInfoOffline".equals(categoryVo.getGubun2())) {
    	
    	if ((cnt > 0) &&   (categoryVo.getEdu_curr1_arr() != null) && (categoryVo.getEdu_curr1_arr().length > 0))    {
    	      for (int i = 0; i < categoryVo.getEdu_curr1_arr().length; i++) {
    	        
    	    	  categoryVo.setEdu_curr1(categoryVo.getEdu_curr1_arr() != null ? categoryVo.getEdu_curr1_arr()[i] : "");
    	        categoryVo.setEdu_curr2(categoryVo.getEdu_curr2_arr() != null ? categoryVo.getEdu_curr2_arr()[i] : "");
    	        categoryVo.setEdu_curr3(categoryVo.getEdu_curr3_arr() != null ? categoryVo.getEdu_curr3_arr()[i] : "");
    	        
    	        if (  !(StringUtil.isEmpty(categoryVo.getEdu_curr1_arr()[i]) 
    	                && StringUtil.isEmpty(categoryVo.getEdu_curr2_arr()[i]) 
    	                && StringUtil.isEmpty(categoryVo.getEdu_curr3_arr()[i]))
    	                ){
    	               cnt = this.eduMapper.insertEducationSub(categoryVo);
    	             }
    	      }
    	    }	
    }
    

    if (cnt > 0) {
      return this.eduMapper.insertEducation(categoryVo);
    }
    return 0;
  }

  public int updateEduCation(CategoryVo categoryVo) {
    int cnt = 1;

    if ("YES".equals(categoryVo.getFileExit())) {
    	if( StringUtil.isEmpty(categoryVo.getEdu_notice())) {
    		categoryVo.setEdu_notice(categoryVo.getFile_uuid());
    		cnt = this.eduMapper.insertCommonFile(categoryVo);
    	}else {
    		cnt = this.eduMapper.updateCommonFile(categoryVo);
        }      
        categoryVo.setEdu_notice(categoryVo.getFile_uuid());
    }
    

    if (!"eduInfoOffline".equals(categoryVo.getGubun2()))
    {
      if (cnt > 0)
      {
        if ((categoryVo.getEdu_curr1_arr() != null) && (categoryVo.getEdu_curr1_arr().length > 0))
        {
          this.eduMapper.deleteEduCationDetail(categoryVo);

          for (int i = 0; i < categoryVo.getEdu_curr1_arr().length; i++) {
            categoryVo.setEdu_curr1(categoryVo.getEdu_curr1_arr() != null ? categoryVo.getEdu_curr1_arr()[i] : "");
            categoryVo.setEdu_curr2(categoryVo.getEdu_curr2_arr() != null ? categoryVo.getEdu_curr2_arr()[i] : "");
            categoryVo.setEdu_curr3(categoryVo.getEdu_curr3_arr() != null ? categoryVo.getEdu_curr3_arr()[i] : "");
            if (  !(StringUtil.isEmpty(categoryVo.getEdu_curr1_arr()[i]) 
               && StringUtil.isEmpty(categoryVo.getEdu_curr2_arr()[i]) 
               && StringUtil.isEmpty(categoryVo.getEdu_curr3_arr()[i]))
               ){
              cnt = this.eduMapper.insertEducationSub(categoryVo);
            }
          }
        }
      }
    }

    if (cnt > 0) {
      return this.eduMapper.updateEdcation(categoryVo);
    }
    return 0;
  }

  public List<CategoryVo> getEducationList(CategoryVo categoryVo) throws Exception
  {
    return this.eduMapper.getEducationList(categoryVo);
  }

  public int getEducationCount(CategoryVo categoryVo) {
    return this.eduMapper.getEducationCount(categoryVo);
  }

  public int insertEducationSub(CategoryVo categoryVo) {
    return this.eduMapper.insertEducationSub(categoryVo);
  }

  public int getEducationNo(CategoryVo categoryVo) {
    return this.eduMapper.getEducationNo(categoryVo);
  }

  public CategoryVo getEduCationFile(CategoryVo categoryVo) {
    return this.eduMapper.getEduCationFile(categoryVo);
  }

  public int deleteEduCation(CategoryVo categoryVo)
  {
    if (!"eduInfoOffline".equals(categoryVo.getGubun2())) {
      this.eduMapper.deleteEduCationFile(categoryVo);
      this.eduMapper.deleteEduCationDetail(categoryVo);
    }
    return this.eduMapper.deleteEduCation(categoryVo);
  }

  public CategoryVo getCategoryDetail(CategoryVo categoryVo) {
    return this.eduMapper.getCategoryDetail(categoryVo);
  }

  public CategoryVo getEduCationDetail(CategoryVo categoryVo) {
    return this.eduMapper.getEduCationDetail(categoryVo);
  }

  public List<CategoryVo> getEduCationDetailSub(CategoryVo categoryVo) {
    return this.eduMapper.getEduCationDetailSub(categoryVo);
  }

  public int deleteCategory(CategoryVo categoryVo)
  {
     if ("category1".equals(categoryVo.getGubun2())) {
    	 this.eduMapper.deleteCommonMutilFile(categoryVo);
    	 this.eduMapper.deleteCategory1Sub3(categoryVo);
    	 this.eduMapper.deleteCategory1Sub2(categoryVo);
    }
    if ("category2".equals(categoryVo.getGubun2())) {
    	this.eduMapper.deleteCommonMutilFile(categoryVo);
    	this.eduMapper.deleteCategory2Sub3(categoryVo);      
    }
    if ("category4".equals(categoryVo.getGubun2())) {
      this.eduMapper.deleteClassCategory1Sub2(categoryVo);
      this.eduMapper.deleteClassCategory1Sub3(categoryVo);
    }

    if ("category5".equals(categoryVo.getGubun2())) {
      this.eduMapper.deleteClassCategory2Sub3(categoryVo);
    }
    
    if ("category3".equals(categoryVo.getGubun2())) {
        this.eduMapper.deleteCommonMutilFile(categoryVo);
     }
    
    return this.eduMapper.deleteCategory(categoryVo);
  }

  public int updateCategory(CategoryVo categoryVo) {
    return this.eduMapper.updateCategory(categoryVo);
  }
  
  
 public int updateCategory3(CategoryVo categoryVo, List<Map<String, Object>> fileSavelist) {
	  
	  int cnt = 1;
	  
	  //선택된 파일 삭제
	  String[] ArraysStr = categoryVo.getCheckdstr().split(",");
	  if(ArraysStr.length > 0 ){
		  for (String s : ArraysStr) {
	        	if(!StringUtil.isEmpty(s)) {
	        		categoryVo.setFile_seq(Integer.parseInt(s));
	        		cnt = this.eduMapper.deleteEduCationFile(categoryVo);
	        	}        	
	      }   
	  }
	  if (fileSavelist !=null && fileSavelist.size() > 0) {
		  
	 	Map<String,Object> tempMap = null;
  	    for(int i = 0; i<fileSavelist.size();i++) {
  	        tempMap = fileSavelist.get(i);
  	        categoryVo.setEdu_notice((String)tempMap.get("file_uuid"));
            categoryVo.setFile_name((String)tempMap.get("file_name"));
            categoryVo.setFile_full_path((String)tempMap.get("file_full_path"));
            categoryVo.setFile_size((Long)tempMap.get("file_size"));
            cnt = this.eduMapper.insertCommonFile(categoryVo);
         }		 
	  }
	  
	  if (cnt > 0) {
		  return this.eduMapper.updateCategory(categoryVo);
	  }
	  
	  return cnt;
  }

  public int insertCatgegory3(CategoryVo categoryVo, List<Map<String, Object>> fileSavelist) {

	  //key 가져오기 
	  categoryVo.setCategory3_key(this.eduMapper.getEducationNo(categoryVo));

	  int cnt = 0;
	  if (fileSavelist.size() > 0) {
		  
	 	Map<String,Object> tempMap = null;
  	    for(int i = 0; i<fileSavelist.size();i++) {
  	        tempMap = fileSavelist.get(i);
  	        categoryVo.setEdu_notice((String)tempMap.get("file_uuid"));
            categoryVo.setFile_name((String)tempMap.get("file_name"));
            categoryVo.setFile_full_path((String)tempMap.get("file_full_path"));
            categoryVo.setFile_size((Long)tempMap.get("file_size"));
            cnt = this.eduMapper.insertCommonFile(categoryVo);
         }
		 
	  }
	  if (cnt > 0) {
	        return this.eduMapper.insertCatgegory3(categoryVo);
	  }
	    
    return cnt;
  }
  
  public List<CategoryVo> getCommonFileList(CategoryVo categoryVo) throws Exception
  {
    return this.eduMapper.getCommonFileList(categoryVo);
  }

  public List<CategoryVo> getCategoryCodeList(CategoryVo categoryVo) throws Exception {
    return this.eduMapper.getCategoryCodeList(categoryVo);
  }

  public int deleteSchedule(CategoryVo categoryVo)
  {
    return this.eduMapper.deleteSchedule(categoryVo);
  }

  public int updateSchedule(CategoryVo categoryVo) {
    return this.eduMapper.updateSchedule(categoryVo);
  }

  public int insertSchedule(CategoryVo categoryVo) {
    return this.eduMapper.insertSchedule(categoryVo);
  }
  
  public int insertLifeEdu(CategoryVo categoryVo)
  {
	  int cnt =  this.eduMapper.insertLifeEdu(categoryVo);
	  if ("course".equals(categoryVo.getGubun2())) {		  
		  //수강인원이 다 찼으면 신청마감으로 변경함.
		  if("F".equals(categoryVo.getCour_finish())) {
			  cnt =  this.eduMapper.updateCourseStatus(categoryVo);
		  }		  
	  }
	 
      return cnt;
  }
}