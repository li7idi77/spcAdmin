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

public class EgovoCommonExcel extends AbstractExcelView
{
  protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook wb, HttpServletRequest request, HttpServletResponse response)
    throws Exception
  {
    String fileName = (String)model.get("filename");

    response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "\\ ") + ".xls\"");

    HSSFCell cell = null;

    HSSFSheet sheet = wb.createSheet("교육일정");
    sheet.setDefaultColumnWidth(12);

    cell = getCell(sheet, 0, 0);
    setText(cell, "Schedule List");
    
    setText(getCell(sheet, 2, 0), "No.");
    setText(getCell(sheet, 2, 1), "교육일시");
    setText(getCell(sheet, 2, 2), "기관명");
    setText(getCell(sheet, 2, 3), "분류1");
    setText(getCell(sheet, 2, 4), "분류2");
    setText(getCell(sheet, 2, 5), "분류3");
    setText(getCell(sheet, 2, 6), "교육 대상");
    setText(getCell(sheet, 2, 7), "교육 인원");
    setText(getCell(sheet, 2, 8), "강사명");

    List list = (List)model.get("list");

    for (int i = 0; i < list.size(); i++) {
      CategoryVo categoryVo = (CategoryVo)list.get(i);

      cell = getCell(sheet, 3 + i, 0);
      setText(cell, Integer.toString(i + 1));

      cell = getCell(sheet, 3 + i, 1);
      setText(cell, categoryVo.getEdu_start_date());

      cell = getCell(sheet, 3 + i, 2);
      setText(cell, categoryVo.getEdu_org_name());

      cell = getCell(sheet, 3 + i, 3);
      setText(cell, categoryVo.getCategory1_name());

      cell = getCell(sheet, 3 + i, 4);
      setText(cell, categoryVo.getCategory2_name());

      cell = getCell(sheet, 3 + i, 5);
      setText(cell, categoryVo.getCategory3_name());

      cell = getCell(sheet, 3 + i, 6);
      setText(cell, categoryVo.getEdu_target());

      cell = getCell(sheet, 3 + i, 7);
      setText(cell, String.valueOf(categoryVo.getEdu_number()));

      cell = getCell(sheet, 3 + i, 8);
      setText(cell, categoryVo.getEdu_teac_name());
    }
  }
}