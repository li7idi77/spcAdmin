package com.easycompany.cmm.vo;

import java.io.Serializable;
import org.apache.commons.lang3.builder.ToStringBuilder;

public class DefaultVO
  implements Serializable
{
  private static final long serialVersionUID = -858838578081269359L;
  private String searchCondition = "";

  private String searchKeyword = "";

  private String searchUseYn = "";

  private int pageIndex = 1;

  private int pageUnit = 10;

  private int pageSize = 10;

  private int firstIndex = 1;

  private int lastIndex = 1;

  private int recordCountPerPage = 10;

  private int offset = 0;
  private String excelFileName;
  private String mode;
  String result;
  String webPath;

  public String getWebPath()
  {
    return this.webPath;
  }

  public void setWebPath(String webPath) {
    this.webPath = webPath;
  }

  public int getFirstIndex() {
    return this.firstIndex;
  }

  public void setFirstIndex(int firstIndex) {
    this.firstIndex = firstIndex;
  }

  public int getLastIndex() {
    return this.lastIndex;
  }

  public void setLastIndex(int lastIndex) {
    this.lastIndex = lastIndex;
  }

  public int getRecordCountPerPage() {
    return this.recordCountPerPage;
  }

  public void setRecordCountPerPage(int recordCountPerPage) {
    this.recordCountPerPage = recordCountPerPage;
  }

  public String getSearchCondition() {
    return this.searchCondition;
  }

  public void setSearchCondition(String searchCondition) {
    this.searchCondition = searchCondition;
  }

  public String getSearchKeyword() {
    return this.searchKeyword;
  }

  public void setSearchKeyword(String searchKeyword) {
    this.searchKeyword = searchKeyword;
  }

  public String getSearchUseYn() {
    return this.searchUseYn;
  }

  public void setSearchUseYn(String searchUseYn) {
    this.searchUseYn = searchUseYn;
  }

  public int getPageIndex() {
    return this.pageIndex;
  }

  public void setPageIndex(int pageIndex) {
    this.pageIndex = pageIndex;
  }

  public int getPageUnit() {
    return this.pageUnit;
  }

  public void setPageUnit(int pageUnit) {
    this.pageUnit = pageUnit;
  }

  public int getPageSize() {
    return this.pageSize;
  }

  public void setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }

  public String toString()
  {
    return ToStringBuilder.reflectionToString(this);
  }

  public int getOffset() {
    return this.offset;
  }

  public void setOffset(int offset) {
    this.offset = offset;
  }

  public String getExcelFileName() {
    return this.excelFileName;
  }

  public void setExcelFileName(String excelFileName) {
    this.excelFileName = excelFileName;
  }

  public String getResult() {
    return this.result;
  }

  public void setResult(String result) {
    this.result = result;
  }

  public String getMode() {
    return this.mode;
  }

  public void setMode(String mode) {
    this.mode = mode;
  }
}