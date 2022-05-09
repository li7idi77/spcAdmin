package com.easycompany.cmm.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.easycompany.service.vo.BoardVo;


public class FileUtil {


	public static BoardVo uploadFile (HttpServletRequest request,String filePath) {
	 
	 BoardVo boardVo = new BoardVo();
	 
	 try {
		 //파일이 저장될 path 설정 
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> files = multiRequest.getFileMap();
	
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile mfile;
			
		// 디레토리가 없다면 생성 
		File dir = new File(filePath); 
		if (!dir.isDirectory()) {
			dir.mkdirs(); 
		}

		String file_uuid         = "";
		String file_name     = ""; 
		String file_full_path = "";
		long file_size = 0L;
		
		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			// 내용을 가져와서 
			mfile = entry.getValue();
			
			file_size = mfile.getSize();
			
			//file_name = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 
			file_name = mfile.getOriginalFilename();
			// 파일명이 없다면 
			if ("".equals(file_name)) { continue; } 
			// 파일 명 변경(uuid로 암호화) 
			String ext = file_name.substring(file_name.lastIndexOf('.')); // 확장자
			
			file_uuid = StringUtil.getUuid();
				
			file_full_path = filePath + File.separator + file_uuid + ext;
		
			// 설정한 path에 파일저장 
			File serverFile = new File( file_full_path );			
			mfile.transferTo(serverFile);
		}
		boardVo.setFile_size(file_size);
		boardVo.setFile_uuid(file_uuid);
		boardVo.setFile_name(file_name);
		boardVo.setFile_full_path(file_full_path);
		
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 return boardVo;
 	}															
 
 	/**
 	 * FileDownLoad
 	 * **/
	 public static void fileDownload (HttpServletRequest request, HttpServletResponse response, BoardVo boardVo) throws IOException {
		 File file = new File( boardVo.getFile_full_path());
		
		if (file.exists() && file.isFile()) {
			response.setContentType("application/octet-stream; charset=utf-8");
			response.setContentLength((int) file.length());
			String browser = getBrowser(request);
			String disposition = getDisposition(boardVo.getFile_name(), browser);
			response.setHeader("Content-Disposition", disposition);
			response.setHeader("Content-Transfer-Encoding", "binary");
			OutputStream out = response.getOutputStream();
			FileInputStream fis = null;
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			
			if (fis != null) {
				fis.close();
			}
			out.flush();
			out.close();
		}
	 
	}
	 
	 /**
 	 * FileDelete
 	 * **/
	public static String deleteFile (HttpServletRequest request,String filePullPath) {

		try {
			File deleteFile = new File(filePullPath);
			// 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
			if (deleteFile.exists()) {
				// 파일을 삭제합니다.
				deleteFile.delete();
			} else {
				return "F";
			} 
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return "F";
		} catch (Exception e) {
			e.printStackTrace();
			return "F";
		}
		return "S";
	}
	
	/**
 	 * FileDelete
 	 * **/
	public static String deleteFile (String filePullPath) {

		try {
			File deleteFile = new File(filePullPath);
			// 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
			if (deleteFile.exists()) {
				// 파일을 삭제합니다.
				deleteFile.delete();
			} else {
				return "F";
			} 
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return "F";
		} catch (Exception e) {
			e.printStackTrace();
			return "F";
		}
		return "S";
	}
	 
	 
	private static String getBrowser(HttpServletRequest request) {
			String header = request.getHeader("User-Agent");
			if (header.indexOf("MSIE") > -1 || header.indexOf("Trident") > -1)
				return "MSIE";
			else if (header.indexOf("Chrome") > -1)
				return "Chrome";
			else if (header.indexOf("Opera") > -1)
				return "Opera";
			return "Firefox";
	}
	 
	 private static String getDisposition(String filename, String browser)throws UnsupportedEncodingException {
		 
			String dispositionPrefix = "attachment;filename=";
			String encodedFilename = null;
		
			if (browser.equals("MSIE")) {
				encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
			} else if (browser.equals("Firefox")) {
				encodedFilename = "\""+ new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
			} else if (browser.equals("Opera")) {
				encodedFilename = "\""	+ new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
			} else if (browser.equals("Chrome")) {
				StringBuffer sb = new StringBuffer();
				for (int i = 0; i < filename.length(); i++) {
					char c = filename.charAt(i);
					if (c > '~') {
						sb.append(URLEncoder.encode("" + c, "UTF-8"));
					} else {
						sb.append(c);
					}
				}
				encodedFilename = sb.toString();
			}
			return dispositionPrefix + encodedFilename;
	}
	 
	public static List<Map<String, Object>> uploadFileMulti (@RequestParam("article_file") List<MultipartFile> multipartFile,
			  HttpServletRequest request,String filePath) {
			 
		List<Map<String,Object>> fileList = new ArrayList<Map<String,Object>>();
		Map<String,Object> fileMap = null;
		 
		 try {
						
			// 디레토리가 없다면 생성 
			File dir = new File(filePath); 
			if (!dir.isDirectory()) {
				dir.mkdirs(); 
			}
	
			String file_uuid      = "";
			String file_name      = ""; 
			String file_full_path = "";
			long   file_size      = 0L;
	
			
		   for(MultipartFile mfile : multipartFile) {
			       
	        file_size = mfile.getSize();
			//file_name = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 
			file_name = mfile.getOriginalFilename();
			// 파일명이 없다면 
			if ("".equals(file_name)) { continue; } 
			// 파일 명 변경(uuid로 암호화) 
			String ext = file_name.substring(file_name.lastIndexOf('.')); // 확장자
			file_uuid = StringUtil.getUuid();
			file_full_path = filePath + File.separator + file_uuid + ext;
			
	        File serverFile = new File(file_full_path);
	        mfile.transferTo(serverFile);
	       
	        fileMap = new HashMap<String,Object>();
            fileMap.put("file_size", file_size);
            fileMap.put("file_uuid", file_uuid);
            fileMap.put("file_name", file_name);
            fileMap.put("file_full_path", file_full_path);
            fileList.add(fileMap);	            
		   }
			  	
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fileList;
    }
	
	public static Map<String, Object> uploadFile (MultipartFile file, String filePath, HttpServletRequest request) {
		 
		 Map<String, Object> map = new HashMap<String, Object>();
		 
		 try {
			 //파일이 저장될 path 설정 
		
			// 디레토리가 없다면 생성 
			System.out.println("++++++++++++시작+++++++++++++");
			File dir = new File(filePath); 
			if (!dir.isDirectory()) {
				dir.mkdirs(); 
			}

			String file_uuid         = "";
			String file_name     = ""; 
			String file_full_path = "";
			long file_size = 0L;
			
			// 내용을 가져와서 
			
			file_size = file.getSize();
			
			//file_name = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 
			file_name = file.getOriginalFilename();
			
			// 파일 명 변경(uuid로 암호화) 
			String ext = file_name.substring(file_name.lastIndexOf('.')); // 확장자
			
			file_uuid = StringUtil.getUuid();
				
			file_full_path = filePath + File.separator + file_uuid + ext;
		
			// 설정한 path에 파일저장 
			File serverFile = new File( file_full_path );			
			file.transferTo(serverFile);
			map.put("file_size", file_size);
			map.put("file_uuid", file_uuid);
			map.put("file_name", file_name);
			map.put("file_full_path", file_full_path);
			System.out.println("++++++++++++끝+++++++++++++");
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("++++++++++++++++++++++++"+e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("++++++++++++++++++++++++"+e);
			}
		 return map;
	 	}

}
