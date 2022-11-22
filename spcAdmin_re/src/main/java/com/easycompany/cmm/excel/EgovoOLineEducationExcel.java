package com.easycompany.cmm.excel;

import com.easycompany.service.vo.CategoryVo;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

public class EgovoOLineEducationExcel extends AbstractExcelView
{
  protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook wb, HttpServletRequest request, HttpServletResponse response)
    throws Exception
  {
    CategoryVo categoryVo = (CategoryVo)model.get("categoryVo");

    response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(categoryVo.getExcelFileName(), "UTF-8").replaceAll("\\+", "\\ ") + ".xls\"");

    String sheetName    = "온라인교육";
    String[] cellNameArr = { "No.", "분류1", "분류2", "분류3", "강사명", "교육기간", "학습시간", "교육대상", "신청인원", "교육상태", "노출여부" };
    if ("eduInfoOffline".equals(categoryVo.getGubun2())) {
      sheetName = "오프라인 교육(기관)";
      cellNameArr = new String[] { "No.", "기관명", "교육명", "교육대상", "교육시간", "교육신청 인원", "교육상태", "노출여부" };
    }
    if ("eduInfoNoOrgline".equals(categoryVo.getGubun2())) {
        sheetName = "오프라인 교육(기관이외)";
        cellNameArr = new String[] { "No.", "기관명", "교육명", "교육내용", "교육방식", "교육기간/일시", "신청기간", "교육상태", "노출여부" };
    }
    
    if ("eduInfoOnlineMangList".equals(categoryVo.getGubun2())) {
        sheetName = "신청자 관리 온라인 교육";
        cellNameArr = new String[] { "No.", "분류1", "분류2", "분류3", "교육내용", "교육대상", "학습시간", "신청자" };
    }    

    if ("eduInfoOnlineMangView".equals(categoryVo.getGubun2())) {
        sheetName = "신청자 관리 온라인 교육 신청자 리스트";
        cellNameArr = new String[] { "No.", "이름", "성별", "직업", "생년월일", "이메일", "연락처", "주소","신청일" };
    }    

    if ("eduInfoMangNoOrglineMang".equals(categoryVo.getGubun2())) {
        sheetName = "신청자 관리 오프라인 교육";
        cellNameArr = new String[] { "No.", "분류1", "분류2", "분류3", "교육내용", "교육대상", "교육인원", "신청자" };
    }    

    if ("eduInfoMangNoOrglineMangView".equals(categoryVo.getGubun2())) {
        sheetName = "신청자 관리 오프라인 교육 신청자 리스트";
        cellNameArr = new String[] { "No.", "이름", "성별", "직업", "생년월일", "이메일", "연락처", "주소","신청일" };
    } 
    
    
    HSSFCell cell = null;

    HSSFSheet sheet = wb.createSheet(sheetName);
    sheet.setDefaultColumnWidth(12);

    cell = getCell(sheet, 0, 0);
    setText(cell, sheetName);

    for (int i = 0; i < cellNameArr.length; i++) {
      setText(getCell(sheet, 2, i), cellNameArr[i]);
    }

    List list = (List)model.get("list");

    for (int i = 0; i < list.size(); i++)
    {
      CategoryVo categVo = (CategoryVo)list.get(i);

      //기관
      if ("eduInfoOnline".equals(categoryVo.getGubun2()) || "eduInfoOnline2".equals(categoryVo.getGubun2()))
      {
        cell = getCell(sheet, 3 + i, 0);
        setText(cell, Integer.toString(i + 1));

        cell = getCell(sheet, 3 + i, 1);
        setText(cell, categVo.getCategory1_name());

        cell = getCell(sheet, 3 + i, 2);
        setText(cell, categVo.getCategory2_name());

        cell = getCell(sheet, 3 + i, 3);
        setText(cell, categVo.getCategory3_name());

        cell = getCell(sheet, 3 + i, 4);
        setText(cell, categVo.getInst_nm());

        cell = getCell(sheet, 3 + i, 5);
        setText(cell, categVo.getTrain_s_date() + "~" + categVo.getTrain_e_date());

        cell = getCell(sheet, 3 + i, 6);
        setText(cell, String.valueOf(categVo.getEdu_time()) + "분");

        cell = getCell(sheet, 3 + i, 7);
        setText(cell, categVo.getEdu_target());

        cell = getCell(sheet, 3 + i, 8);
        setText(cell, String.valueOf(categVo.getEdu_garden()));

        cell = getCell(sheet, 3 + i, 9);
        setText(cell, categVo.getEdu_status());

        cell = getCell(sheet, 3 + i, 10);
        setText(cell, categVo.getExp_use_yn());
      }

      //기관
      if ("eduInfoOffline".equals(categoryVo.getGubun2()))
      {
        cell = getCell(sheet, 3 + i, 0);
        setText(cell, Integer.toString(i + 1));

        cell = getCell(sheet, 3 + i, 1);
        setText(cell, categVo.getCoper_nm1());

        cell = getCell(sheet, 3 + i, 2);
        setText(cell, categVo.getCategory3_name());

        cell = getCell(sheet, 3 + i, 3);
        setText(cell, categVo.getEdu_target());

        cell = getCell(sheet, 3 + i, 4);
        setText(cell, String.valueOf(categVo.getEdu_time()) + "분");

        cell = getCell(sheet, 3 + i, 5);
        setText(cell, String.valueOf(categVo.getEdu_garden()));

        cell = getCell(sheet, 3 + i, 6);
        setText(cell, categVo.getEdu_status());

        cell = getCell(sheet, 3 + i, 7);
        setText(cell, categVo.getExp_use_yn());
      }
      
      //기관이외
      if ("eduInfoNoOrgline".equals(categoryVo.getGubun2()))
      {
        cell = getCell(sheet, 3 + i, 0);
        setText(cell, Integer.toString(i + 1));

        cell = getCell(sheet, 3 + i, 1);
        setText(cell, categVo.getCoper_nm());

        cell = getCell(sheet, 3 + i, 2);
        setText(cell, categVo.getCategory3_name());

        cell = getCell(sheet, 3 + i, 3);
        setText(cell, categVo.getEdu_cont());

        cell = getCell(sheet, 3 + i, 4);
        setText(cell, categVo.getEdu_method());
        
        cell = getCell(sheet, 3 + i, 5);
        setText(cell, categVo.getTrain_s_date() + "~" + categVo.getTrain_e_date());
        
        cell = getCell(sheet, 3 + i, 6);
        setText(cell, categVo.getApp_s_date() + "~" + categVo.getApp_e_date());

        cell = getCell(sheet, 3 + i, 7);
        setText(cell, categVo.getEdu_status());

        cell = getCell(sheet, 3 + i, 8);
        setText(cell, categVo.getExp_use_yn());
      }
      
       //신청자 관리 온라인 교육
      if ("eduInfoOnlineMangList".equals(categoryVo.getGubun2()))
      {
        cell = getCell(sheet, 3 + i, 0);
        setText(cell, Integer.toString(i + 1));

        cell = getCell(sheet, 3 + i, 1);
        setText(cell, categVo.getCategory1_name());

        cell = getCell(sheet, 3 + i, 2);
        setText(cell, categVo.getCategory2_name());

        cell = getCell(sheet, 3 + i, 3);
        setText(cell, categVo.getCategory3_name());

        cell = getCell(sheet, 3 + i, 4);
        setText(cell, categVo.getEdu_cont());
        
        cell = getCell(sheet, 3 + i, 5);
        setText(cell, categVo.getEdu_target());
        
        cell = getCell(sheet, 3 + i, 6);
        setText(cell, String.valueOf(categVo.getEdu_time()) + "분");
       
        cell = getCell(sheet, 3 + i, 7);
        setText(cell, String.valueOf(categVo.getCnt()));

      }
      
      if ("eduInfoOnlineMangView".equals(categoryVo.getGubun2())) {
    	  cell = getCell(sheet, 3 + i, 0);
          setText(cell, Integer.toString(i + 1));

          cell = getCell(sheet, 3 + i, 1);
          setText(cell, categVo.getUser_nm());

          cell = getCell(sheet, 3 + i, 2);
          setText(cell, categVo.getUser_sex());

          cell = getCell(sheet, 3 + i, 3);
          setText(cell, categVo.getJob_cd());

          cell = getCell(sheet, 3 + i, 4);
          setText(cell, categVo.getBirth_ymd());
          
          cell = getCell(sheet, 3 + i, 5);
          setText(cell, categVo.getEml_addr());
          
          cell = getCell(sheet, 3 + i, 6);
          setText(cell, String.valueOf(categVo.getMbl_telno()) );
         
          cell = getCell(sheet, 3 + i, 7);
          setText(cell, String.valueOf(categVo.getJuso()));
          
          cell = getCell(sheet, 3 + i, 8);
          setText(cell, String.valueOf(categVo.getReg_dt()));
      }
      
      //신청자 관리 오프라인 교육
      if ("eduInfoMangNoOrglineMang".equals(categoryVo.getGubun2()))
      {
        cell = getCell(sheet, 3 + i, 0);
        setText(cell, Integer.toString(i + 1));

        cell = getCell(sheet, 3 + i, 1);
        setText(cell, categVo.getCategory1_name());

        cell = getCell(sheet, 3 + i, 2);
        setText(cell, categVo.getCategory2_name());

        cell = getCell(sheet, 3 + i, 3);
        setText(cell, categVo.getCategory3_name());

        cell = getCell(sheet, 3 + i, 4);
        setText(cell, categVo.getEdu_cont());
        
        cell = getCell(sheet, 3 + i, 5);
        setText(cell, categVo.getEdu_target());
        
        cell = getCell(sheet, 3 + i, 6);
        setText(cell, String.valueOf(categVo.getEdu_garden() ));
       
        cell = getCell(sheet, 3 + i, 7);
        setText(cell, String.valueOf(categVo.getCnt()) );

      }
      
      if ("eduInfoMangNoOrglineMangView".equals(categoryVo.getGubun2())) {
    	  cell = getCell(sheet, 3 + i, 0);
          setText(cell, Integer.toString(i + 1));

          cell = getCell(sheet, 3 + i, 1);
          setText(cell, categVo.getUser_nm());

          cell = getCell(sheet, 3 + i, 2);
          setText(cell, categVo.getUser_sex());

          cell = getCell(sheet, 3 + i, 3);
          setText(cell, categVo.getJob_cd());

          cell = getCell(sheet, 3 + i, 4);
          setText(cell, categVo.getBirth_ymd());
          
          cell = getCell(sheet, 3 + i, 5);
          setText(cell, categVo.getEml_addr());
          
          cell = getCell(sheet, 3 + i, 6);
          setText(cell, String.valueOf(categVo.getMbl_telno()) );
         
          cell = getCell(sheet, 3 + i, 7);
          setText(cell, String.valueOf(categVo.getJuso()));
          
          cell = getCell(sheet, 3 + i, 8);
          setText(cell, String.valueOf(categVo.getReg_dt()));
      }
    }
  }
}