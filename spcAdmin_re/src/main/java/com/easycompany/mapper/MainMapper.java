package com.easycompany.mapper;

import com.easycompany.service.vo.MainVo;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("mainMapper")
public class MainMapper extends EgovAbstractMapper
{
  String nameSpace = "com.easycompany.mapper.MainMapper";

  public int insertCommon(MainVo mainVo)
  {
    String sqlName = "insertLogo";

    if ("img".equals(mainVo.getGubun2())) {
      sqlName = "insertImg";
    }
    if ("banner".equals(mainVo.getGubun2())) {
      sqlName = "insertBanner";
    }
    if ("popup".equals(mainVo.getGubun2())) {
      sqlName = "insertPopUp";
    }
    return Integer.valueOf(insert(this.nameSpace + "." + sqlName, mainVo)).intValue();
  }

  public MainVo getCommonDetail(MainVo mainVo)
  {
    String sqlName = "getLogoDetail";

    if ("img".equals(mainVo.getGubun2())) {
      sqlName = "getImgDetail";
    }
    if ("banner".equals(mainVo.getGubun2())) {
      sqlName = "getBannerDetail";
    }
    if ("popup".equals(mainVo.getGubun2())) {
      sqlName = "getPopUpDetail";
    }
    return (MainVo)selectOne(this.nameSpace + "." + sqlName, mainVo);
  }

  public int insertCommonFile(MainVo mainVo) {
    String sqlName = "insertCommonFile";
    return Integer.valueOf(insert(this.nameSpace + "." + sqlName, mainVo)).intValue();
  }

  public int deleteCommonFile(MainVo mainVo) {
    String sqlName = "deleteCommonFile";
    return Integer.valueOf(delete(this.nameSpace + "." + sqlName, mainVo)).intValue();
  }

  public int updateCommon(MainVo mainVo)
  {
    String sqlName = "updateLogo";

    if ("img".equals(mainVo.getGubun2())) {
      sqlName = "updateImg";
    }
    if ("banner".equals(mainVo.getGubun2())) {
      sqlName = "updateBanner";
    }
    if ("popup".equals(mainVo.getGubun2())) {
      sqlName = "updatePopUp";
    }
    return Integer.valueOf(update(this.nameSpace + "." + sqlName, mainVo)).intValue();
  }

  public int updateCommonFile(MainVo mainVo)
  {
    String sqlName = "updateCommonFile";
    return Integer.valueOf(update(this.nameSpace + "." + sqlName, mainVo)).intValue();
  }

  public int deleteCommon(MainVo mainVo)
  {
    String sqlName = "deleteLogo";

    if ("img".equals(mainVo.getGubun2())) {
      sqlName = "deleteImg";
    }
    if ("banner".equals(mainVo.getGubun2())) {
      sqlName = "deleteBanner";
    }
    if ("popup".equals(mainVo.getGubun2())) {
      sqlName = "deletePopUp";
    }
    return Integer.valueOf(update(this.nameSpace + "." + sqlName, mainVo)).intValue();
  }

  public List<MainVo> getCommonList(MainVo mainVo) throws DataAccessException
  {
    String sqlName = "getImgist";

    if ("banner".equals(mainVo.getGubun2())) {
      sqlName = "getBannerList";
    }
    if ("popup".equals(mainVo.getGubun2())) {
      sqlName = "getPopUpList";
    }
    return selectList(this.nameSpace + "." + sqlName, mainVo);
  }

  public int getCommonCount(MainVo mainVo)
  {
    String sqlName = "getImgCount";

    if ("banner".equals(mainVo.getGubun2())) {
      sqlName = "getBannerCount";
    }
    if ("popup".equals(mainVo.getGubun2())) {
      sqlName = "getPopUpCount";
    }

    return ((Integer)selectOne(this.nameSpace + "." + sqlName, mainVo)).intValue();
  }
}