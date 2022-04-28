package com.easycompany.service.impl;

import com.easycompany.mapper.MainMapper;
import com.easycompany.service.MainService;
import com.easycompany.service.vo.MainVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("mainService")
@Transactional
public class MainServiceImpl extends EgovAbstractServiceImpl
  implements MainService
{

  @Autowired
  private MainMapper mainMapper;

  public MainVo getCommonDetail(MainVo mainVo)
  {
    return this.mainMapper.getCommonDetail(mainVo);
  }

  public int insertCommon(MainVo mainVo)
  {
    if (!"N".equals(mainVo.getGubun3())) {
      int cnt = this.mainMapper.insertCommonFile(mainVo);
      if (cnt > 0)
        return this.mainMapper.insertCommon(mainVo);
    }
    else {
      return this.mainMapper.insertCommon(mainVo);
    }

    return 0;
  }

  public int updateCommon(MainVo mainVo)
  {
    if (!"N".equals(mainVo.getGubun3())) {
      int cnt = this.mainMapper.updateCommonFile(mainVo);
      if (cnt > 0)
        return this.mainMapper.updateCommon(mainVo);
    }
    else {
      return this.mainMapper.updateCommon(mainVo);
    }

    return 0;
  }

  public int deleteCommon(MainVo mainVo)
  {
    if (!"N".equals(mainVo.getGubun3())) {
      int cnt = this.mainMapper.deleteCommonFile(mainVo);
      if (cnt > 0)
        return this.mainMapper.deleteCommon(mainVo);
    }
    else {
      return this.mainMapper.deleteCommon(mainVo);
    }

    return 0;
  }

  public List<MainVo> getCommonList(MainVo mainVo) throws Exception {
    return this.mainMapper.getCommonList(mainVo);
  }

  public int getCommonCount(MainVo mainVo) {
    return this.mainMapper.getCommonCount(mainVo);
  }
}