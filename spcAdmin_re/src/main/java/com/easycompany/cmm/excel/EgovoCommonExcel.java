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
    String fileName = (String)model.get("p_title");

    response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "\\ ") + ".xls\"");

    String[] cellNameArr = model.get("p_col_name").toString().split(",");
    String[] dataNameArr = model.get("p_data_name").toString().split(",");
    
    HSSFCell cell = null;

    HSSFSheet sheet = wb.createSheet(fileName);
    sheet.setDefaultColumnWidth(12);

    cell = getCell(sheet, 0, 0);
    setText(cell, fileName);
    
    for (int i = 0; i < cellNameArr.length; i++) {
       setText(getCell(sheet, 2, i), cellNameArr[i]);
    }

    List<Map<String, Object>> list = (List<Map<String, Object>>) model.get("list");

    for (int i = 0; i < list.size(); i++) {
    	Map<String, Object> map = list.get(i);

      cell = getCell(sheet, 3 + i, i);
      setText(cell, Integer.toString(i + 1));
      
      for (int j = 0; i < dataNameArr.length; j++) {
    	  cell = getCell(sheet, 3 + i, j+1);
          setText(cell, map.get(dataNameArr[j]).toString());
      }
    }
  }
}