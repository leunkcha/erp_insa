package com.itnbize.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class FileDownloadView extends AbstractView {

	public FileDownloadView() {
		setContentType("application/download; charset=utf-8");
	}

	@Override
	protected void renderMergedOutputModel(Map model,
			HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		File file = (File)model.get("downloadFile");
		
        // 파일 다운로드를 위한 컨텐트 타입 설정.
         response.setContentType(file.getName().substring(file.getName().indexOf("."),file.getName().length()));
         //response.setContentType(getContentType());
         // 다운로드 되는 파일의 크기 설정.
         response.setContentLength((int)file.length());
         // Content-Disposition 헤더를 이용해서 전송되는 파일의 이름 명시.
         response.setHeader("Content-Disposition", "attachment;filename=\""+file.getName()+"\";");
         // 전송되는 데이터의 인코딩이 바이너리 타입이라는 것을 명시.
         response.setHeader("Content-Transfer-Encoding", "binary");

        //  헤더 설정 후 response의 OutputStream에 파일을 전송.
         OutputStream out = response.getOutputStream();
         FileInputStream fis = null;

        try {
             fis = new FileInputStream(file);
             
             FileCopyUtils.copy(fis, out);
         } finally {
             if(fis != null) {
                 try {
                     fis.close();
                 } catch(IOException ex) {
                 }
             }
         }
         // response의 OutputStream의 버퍼에 저장된 데이터를 전송.
         out.flush();

	}
}