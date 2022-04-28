package com.easycompany.mapper;

import com.easycompany.cmm.util.StringUtil;
import com.easycompany.service.vo.CategoryVo;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("eduMapper")
public class EduMapper extends EgovAbstractMapper
{
  String nameSpace = "com.easycompany.mapper.EduMapper";

  public List<CategoryVo> getCategoryList(CategoryVo categoryVo)
    throws DataAccessException
  {
    String sqlName = "getCategoryList1";

    if ("category2".equals(categoryVo.getGubun2())) {
      sqlName = "getCategoryList2";
    }

    if ("category3".equals(categoryVo.getGubun2())) {
      sqlName = "getCategoryList3";
    }
    if ("category".equals(categoryVo.getGubun2())) {
      sqlName = "getCategoryList";
    }

    if ("eduInfoScheduleList".equals(categoryVo.getGubun2())) {
      sqlName = "eduInfoScheduleList";
    }

    if ("categoryClass".equals(categoryVo.getGubun2())) {
      sqlName = "getCategoryClassList";
    }

    if ("category4".equals(categoryVo.getGubun2())) {
      sqlName = "getCategoryClassList1";
    }

    if ("category5".equals(categoryVo.getGubun2())) {
      sqlName = "getCategoryClassList2";
    }

    if ("category6".equals(categoryVo.getGubun2())) {
      sqlName = "getCategoryClassList3";
    }

    if ("eduInfoOnline".equals(categoryVo.getGubun2())) {
      sqlName = "getEeuInfoOnlineLList";
    }

    return selectList(this.nameSpace + "." + sqlName, categoryVo);
  }

  public int getCategoryExist(CategoryVo categoryVo)
  {
    String sqlName = "getCategoryExist1";

    if ("category2".equals(categoryVo.getGubun2())) {
      sqlName = "getCategoryExist2";
    }

    if ("category3".equals(categoryVo.getGubun2())) {
      sqlName = "getCategoryExist3";
    }
    if ("category4".equals(categoryVo.getGubun2())) {
      sqlName = "getClassCategoryExist1";
    }

    if ("category5".equals(categoryVo.getGubun2())) {
      sqlName = "getClassCategoryExist2";
    }

    if ("category6".equals(categoryVo.getGubun2())) {
      sqlName = "getClassCategoryExist3";
    }
    if ("basket".equals(categoryVo.getGubun2())) {
        sqlName = "getBasketExist";
    }
    if ("course".equals(categoryVo.getGubun2())) {
        sqlName = "getCourseExist";
    }
    return ((Integer)selectOne(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }
  
  public int getCourseStatus(CategoryVo categoryVo)
  {
    String sqlName = "getCourseStatus";

    if ("course".equals(categoryVo.getGubun2())) {
      sqlName = "getCourseStatus";
    }

    return ((Integer)selectOne(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int insertCatgegory(CategoryVo categoryVo)
  {
    String sqlName = "insertCategory1";

    if ("category2".equals(categoryVo.getGubun2())) {
      sqlName = "insertCategory2";
    }

    if ("category3".equals(categoryVo.getGubun2())) {
      sqlName = "insertCategory3";
    }
    if ("category4".equals(categoryVo.getGubun2())) {
      sqlName = "insertClassCategory1";
    }

    if ("category5".equals(categoryVo.getGubun2())) {
      sqlName = "insertClassCategory2";
    }

    if ("category6".equals(categoryVo.getGubun2())) {
      sqlName = "insertClassCategory3";
    }

    if ("eduInfoOnline".equals(categoryVo.getGubun2())) {
      sqlName = "insertEduInfoOnline";
    }

    return Integer.valueOf(insert(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int insertEducation(CategoryVo categoryVo)
  {
    String sqlName = "insertEduInfoOnline";

    if ("eduInfoOnline".equals(categoryVo.getGubun2())) {
      sqlName = "insertEduInfoOnline";
    }

    return Integer.valueOf(insert(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int insertEducationSub(CategoryVo categoryVo)
  {
    String sqlName = "insertEduInfoOnlineSub";

    if ("eduInfoOnline".equals(categoryVo.getGubun2())) {
      sqlName = "insertEduInfoOnlineSub";
    }

    return Integer.valueOf(insert(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public List<CategoryVo> getEducationList(CategoryVo categoryVo)
    throws DataAccessException
  {
    String sqlName = "getEduInfoOnlineList";

    if ("eduInfoOnline".equals(categoryVo.getGubun2())) {
      sqlName = "getEduInfoOnlineList";
    }
    if ("orgPopSearch".equals(categoryVo.getGubun2())) {
        sqlName = "getOrgPopSearchList";
    }
    if ("lifeEduOnLineList".equals(categoryVo.getGubun2())) {
        sqlName = "getLifeEduOnLineList";
    }
    if ("lifeEduSch".equals(categoryVo.getGubun2())) {
        sqlName = "getlifeEduSchList";
    }
    if ("eduInfoOnlineMangView".equals(categoryVo.getGubun2())) {
        sqlName = "getEduInfoOnlineMangViewList";
    }    
    
    if ("lifeEduOrgList".equals(categoryVo.getGubun2())) {
        sqlName = "getLifeEduOrgList";
    }  
    if ("eduInfoMangNoOrglineMangView".equals(categoryVo.getGubun2())) {
        sqlName = "getEduInfoOnlineMangViewList";
    }   
    if ("lifeEduOffOrgList".equals(categoryVo.getGubun2())) {
        sqlName = "getLifeEduOffOrgList";
    }
    
    
    return selectList(this.nameSpace + "." + sqlName, categoryVo);
  }

  public int getEducationCount(CategoryVo categoryVo)
  {
    String sqlName = "getEduInfoOnlineCount";

    if ("eduInfoOnline".equals(categoryVo.getGubun2())) {
      sqlName = "getEduInfoOnlineCount";
    }
    if ("orgPopSearch".equals(categoryVo.getGubun2())) {
        sqlName = "getOrgPopSearchCount";
    }
    if ("lifeEduOnLineList".equals(categoryVo.getGubun2())) {
        sqlName = "getLifeEduOnLineCount";
    }

    if ("lifeEduSch".equals(categoryVo.getGubun2())) {
        sqlName = "getlifeEduSchCount";
    }
    
    if ("eduInfoOnlineMangView".equals(categoryVo.getGubun2())) {
        sqlName = "getEduInfoOnlineMangViewCount";
    } 
    
    if ("lifeEduOrgList".equals(categoryVo.getGubun2())) {
        sqlName = "getLifeEduOrgCount";
    } 
    if ("eduInfoMangNoOrglineMangView".equals(categoryVo.getGubun2())) {
        sqlName = "getEduInfoOnlineMangViewCount";
    } 
    if ("lifeEduOffOrgList".equals(categoryVo.getGubun2())) {
        sqlName = "getLifeEduOffOrgListCount";
    }
    return ((Integer)selectOne(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int getEducationNo(CategoryVo categoryVo)
  {
    String sqlName = "getEduInfoOnlineNo";

    if ("eduInfoOnline".equals(categoryVo.getGubun2())) {
      sqlName = "getEduInfoOnlineNo";
    }
    if ("category3".equals(categoryVo.getGubun2())) {
        sqlName = "getCategory3No";
     }
    return ((Integer)selectOne(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public CategoryVo getEduCationFile(CategoryVo categoryVo)
  {
    String sqlName = "getEduCationFile";

    if ("eduInfoOnline".equals(categoryVo.getGubun2())) {
      sqlName = "getEduCationFile";
    }

    return (CategoryVo)selectOne(this.nameSpace + "." + sqlName, categoryVo);
  }

  public int getCategoryCount(CategoryVo categoryVo)
  {
    String sqlName = "getCategoryCount1";

    if ("category2".equals(categoryVo.getGubun2())) {
      sqlName = "getCategoryCount2";
    }

    if ("category3".equals(categoryVo.getGubun2())) {
      sqlName = "getCategoryCount3";
    }

    if ("category".equals(categoryVo.getGubun2())) {
      sqlName = "getCategoryCount";
    }
    if ("eduInfoScheduleList".equals(categoryVo.getGubun2())) {
      sqlName = "eduInfoScheduleCount";
    }

    if ("categoryClass".equals(categoryVo.getGubun2())) {
      sqlName = "getCategoryClassCount";
    }

    if ("category4".equals(categoryVo.getGubun2())) {
      sqlName = "getCategoryClassCount1";
    }

    if ("category5".equals(categoryVo.getGubun2())) {
      sqlName = "getCategoryClassCount2";
    }

    if ("category6".equals(categoryVo.getGubun2())) {
      sqlName = "getCategoryClassCount3";
    }
    if ("eduInfoOnline".equals(categoryVo.getGubun2())) {
      sqlName = "getEeuInfoOnlineCount";
    }

    return ((Integer)selectOne(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public CategoryVo getCategoryDetail(CategoryVo categoryVo)
  {
    String sqlName = "getCategoryDetail";

    if ("eduInfoScheduleList".equals(categoryVo.getGubun2())) {
      sqlName = "getEduInfoDetail";
    }

    if ("eduInfoOnline".equals(categoryVo.getGubun2())) {
      sqlName = "getEeuInfoOnlineDetail";
    }
    return (CategoryVo)selectOne(this.nameSpace + "." + sqlName, categoryVo);
  }

  public CategoryVo getEduCationDetail(CategoryVo categoryVo)
  {
    String sqlName = "getEduCationDetail";

    if ("eduInfoOnline".equals(categoryVo.getGubun2())) {
      sqlName = "getEduCationDetail";
    }
    
    if ("lifeEduOnLineReg".equals(categoryVo.getGubun2())) {
        sqlName = "getLifeEduOnLineDetail";
    }

    if ("lifeEduOffOrgReg".equals(categoryVo.getGubun2())) {
        sqlName = "getLifeEduOffOrgDetail";
    }
    
    return (CategoryVo)selectOne(this.nameSpace + "." + sqlName, categoryVo);
  }

  public List<CategoryVo> getEduCationDetailSub(CategoryVo categoryVo)
  {
    String sqlName = "getEduCationDetailSub";

    if ("eduInfoOnline".equals(categoryVo.getGubun2())) {
      sqlName = "getEduCationDetailSub";
    }
    return selectList(this.nameSpace + "." + sqlName, categoryVo);
  }

  public int deleteCategory(CategoryVo categoryVo)
  {
    String sqlName = "deleteCategory1";

    if ("category2".equals(categoryVo.getGubun2())) {
      sqlName = "deleteCategory2";
    }

    if ("category3".equals(categoryVo.getGubun2())) {
      sqlName = "deleteCategory3";
    }
    if ("category4".equals(categoryVo.getGubun2())) {
      sqlName = "deleteClassCategory1";
    }
    if ("category5".equals(categoryVo.getGubun2())) {
      sqlName = "deleteClassCategory2";
    }
    if ("category6".equals(categoryVo.getGubun2())) {
      sqlName = "deleteClassCategory3";
    }
    return Integer.valueOf(delete(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int updateCategory(CategoryVo categoryVo)
  {
    String sqlName = "updateCategory1";

    if ("category2".equals(categoryVo.getGubun2())) {
      sqlName = "updateCategory2";
    }

    if ("category3".equals(categoryVo.getGubun2())) {
      sqlName = "updateCategory3";
    }

    if ("category4".equals(categoryVo.getGubun2())) {
      sqlName = "updateClassCategory1";
    }

    if ("category5".equals(categoryVo.getGubun2())) {
      sqlName = "updateClassCategory2";
    }

    if ("category6".equals(categoryVo.getGubun2())) {
      sqlName = "updateClassCategory3";
    }
    return Integer.valueOf(update(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int deleteCategory1Sub2(CategoryVo categoryVo)
  {
    String sqlName = "deleteCategory1Sub2";
    return Integer.valueOf(delete(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int deleteCategory1Sub3(CategoryVo categoryVo) {
    String sqlName = "deleteCategory1Sub3";
    return Integer.valueOf(delete(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int deleteCommonMutilFile(CategoryVo categoryVo) {
    String sqlName = "deleteCommonMutilFile";
    if ("category3".equals(categoryVo.getGubun2())) {
        sqlName = "deleteCommonMutilFile";
    }
    return Integer.valueOf(delete(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }
  
  public int deleteEduCationFile(CategoryVo categoryVo) {
	    String sqlName = "deleteEduCationFile";
	    return Integer.valueOf(delete(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int deleteEduCationDetail(CategoryVo categoryVo)
  {
    String sqlName = "deleteEduCationDetail";
    if ("eduInfoOnline".equals(categoryVo.getGubun2())) {
      sqlName = "deleteEduCationDetail";
    }
    return Integer.valueOf(delete(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int deleteEduCation(CategoryVo categoryVo)
  {
    String sqlName = "deleteEduCation";
    if ("eduInfoOnline".equals(categoryVo.getGubun2())) {
      sqlName = "deleteEduCation";
    }
    return Integer.valueOf(delete(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int updateEdcation(CategoryVo categoryVo)
  {
    String sqlName = "updateEduInfoOnline";

    if ("eduInfoOnline".equals(categoryVo.getGubun2())) {
      sqlName = "updateEduInfoOnline";
    }

    return Integer.valueOf(update(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int deleteCategory2Sub3(CategoryVo categoryVo) {
    String sqlName = "deleteCategory2Sub3";
    return Integer.valueOf(delete(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int deleteClassCategory1Sub2(CategoryVo categoryVo) {
    String sqlName = "deleteClassCategory1Sub2";
    return Integer.valueOf(delete(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int deleteClassCategory1Sub3(CategoryVo categoryVo) {
    String sqlName = "deleteClassCategory1Sub3";
    return Integer.valueOf(delete(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int deleteClassCategory2Sub3(CategoryVo categoryVo) {
    String sqlName = "deleteClassCategory2Sub3";
    return Integer.valueOf(delete(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int insertCatgegory3(CategoryVo categoryVo)
  {
    String sqlName = "insertCategory3";

    return Integer.valueOf(insert(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }
  
  
  public List<CategoryVo> getCommonFileList(CategoryVo categoryVo) throws DataAccessException {
	String sqlName = "getCommonFileList";
	
	if ("category1".equals(categoryVo.getGubun2())) {
	  sqlName = "getCommonFileList";
	}
	if ("category2".equals(categoryVo.getGubun2())) {
	  sqlName = "getCommonFileList";
	}
	if ("category3".equals(categoryVo.getGubun2())) {
	  sqlName = "getCommonFileList";
	}
	
	return selectList(this.nameSpace + "." + sqlName, categoryVo);
  }

  public List<CategoryVo> getCategoryCodeList(CategoryVo categoryVo) throws DataAccessException {
    String sqlName = "getOnlineCategoryCodeList";

    if ("eduInfoOnline".equals(categoryVo.getGubun2())) {
      sqlName = "getOnlineCategoryCodeList";
    }
    if ("eduInfoScheduleList".equals(categoryVo.getGubun2())) {
        sqlName = "getCategoryCodeList";
    }
    if ( (!StringUtil.isEmpty(categoryVo.getGubun3()))  && "commonCode".equals(categoryVo.getGubun3())) {
        sqlName = "getComnonCodeList";
    }
    
    if ("lifeEduOnLineList".equals(categoryVo.getGubun2())) {
        sqlName = "getEduAppCodeList";
    }
    
    
    return selectList(this.nameSpace + "." + sqlName, categoryVo);
  }

  public int deleteSchedule(CategoryVo categoryVo) {
    String sqlName = "deleteSchedule";
    return Integer.valueOf(delete(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int insertCommonFile(CategoryVo categoryVo) {
    String sqlName = "insertCommonFile";
    return Integer.valueOf(insert(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int updateCommonFile(CategoryVo categoryVo)
  {
    String sqlName = "updateCommonFile";
    return Integer.valueOf(update(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int insertSchedule(CategoryVo categoryVo) {
    String sqlName = "insertSchedule";
    return Integer.valueOf(insert(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int updateSchedule(CategoryVo categoryVo) {
    String sqlName = "updateSchedule";
    return Integer.valueOf(update(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }
  
  public int insertLifeEdu(CategoryVo categoryVo) {
    String sqlName = "insertBasket";
    if ("basket".equals(categoryVo.getGubun2())) {
        sqlName = "insertBasket";
    }
    if ("course".equals(categoryVo.getGubun2())) {
        sqlName = "insertCourse";
    }
    return Integer.valueOf(insert(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }

  public int updateCourseStatus(CategoryVo categoryVo) {
	    String sqlName = "updateCourseStatus";
	    return Integer.valueOf(update(this.nameSpace + "." + sqlName, categoryVo)).intValue();
  }
	  
  
}