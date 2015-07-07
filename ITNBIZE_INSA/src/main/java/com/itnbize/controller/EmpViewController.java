package com.itnbize.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itnbize.dao.EmpAcadDao;
import com.itnbize.dao.EmpCarrierDao;
import com.itnbize.dao.EmpContDao;
import com.itnbize.dao.EmpDao;
import com.itnbize.dao.EmpEduDao;
import com.itnbize.dao.EmpEqmDao;
import com.itnbize.dao.EmpInputDao;
import com.itnbize.dao.EmpQualDao;
import com.itnbize.dao.EmpSkillDao;
import com.itnbize.dao.EmpStechDao;
import com.itnbize.dto.EmpAcadDto;
import com.itnbize.dto.EmpCarrierDto;
import com.itnbize.dto.EmpContDto;
import com.itnbize.dto.EmpDto;
import com.itnbize.dto.EmpEduDto;
import com.itnbize.dto.EmpEqmDto;
import com.itnbize.dto.EmpInputDto;
import com.itnbize.dto.EmpQualDto;
import com.itnbize.dto.EmpSkillDto;
import com.itnbize.dto.EmpStechDto;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/empinfo")
public class EmpViewController {
	/*private static Logger logger = LoggerFactory.getLogger(BoardController.class);*/
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model) {
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		
		return "/empinfo/list";
	}
	@RequestMapping(value = "listajax", method = RequestMethod.POST)
	public void listajax(HttpServletRequest request, Model model,HttpServletResponse response) {
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("listajax");
		ArrayList<EmpDto> dto = dao.Insa_List(
				request.getParameter("insano"),request.getParameter("insa_name"),
				request.getParameter("insa_join_gbn"),request.getParameter("insa_put"),
				request.getParameter("insa_pos_gbn"),request.getParameter("insa_start"),
				request.getParameter("insa_end")
				);
		try {
			//response.getWriter().print(dto);
			response.getWriter().print(dto);
		} catch (IOException e) {
			e.printStackTrace();
		}  
	}
	
	
	
	
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public String view(HttpServletRequest request, Model model) {
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		String empno = "";
		empno = request.getParameter("empno");
		
		if(empno=="" || empno == null){
			model.addAttribute("emp",null);
			model.addAttribute("emptype","insert");
		}else{
			model.addAttribute("emp",dao.INSA_LIST_SELECT(Integer.parseInt(empno)));
			model.addAttribute("emptype","update");			
		}
		
		return "/empinfo/view";
	}
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, 
			@RequestParam("insa_resum_file") MultipartFile insa_resum_file,
			@RequestParam("insa_img_file") MultipartFile insa_img_file,
			@ModelAttribute @Validated EmpDto edto, Model model) {
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		//F:\itnbiz\ITNBIZE_INSA\src\main\webapp\resources\images
		//F:\itnbiz\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\ITNBIZE_INSA
		String emptype = request.getParameter("emptype");
		
		if(emptype.equals("insert")){
			Calendar oCalendar = Calendar.getInstance();  // 현재 날짜/시간 등의 각종 정보 얻기
			int todayYear = oCalendar.get(Calendar.YEAR);
			String temp = "";
			int insa_join_gbn = Integer.parseInt(request.getParameter("insa_join_gbn"));
			String insano = dao.Insa_Id_Max(insa_join_gbn) + "";
			if(insano.equals("0")){
				temp = "";
				temp = todayYear+"";
				insano = temp.substring(2,4) + "0" + insa_join_gbn+ "00001";
				System.out.println("insano : " + insano);
			}else{
				insano = Integer.parseInt(insano)+1+"";	
			}
			
			edto.setInsano(insano);
			String age = edto.getInsa_regno();
			if(!age.equals("")){
				temp = "";
				temp = age.substring(0,2);
				if(Integer.parseInt(temp)>30){
					age = 19+temp;
				}else{
					age = 20+temp;
				}
				
				
			    edto.setInsa_age(todayYear-Integer.parseInt(age)+"");
			}
			
			dao.Insa_Insert(edto);
			return "redirect:view?empno="+insano;
			
		}else{
			
			String realPath = request.getServletContext().getRealPath("");
			String pathOfre = realPath.substring(0,realPath.indexOf(".metadata"));
			pathOfre += realPath.substring(realPath.indexOf("wtpwebapps")+11,realPath.length()) + "\\src\\main\\webapp\\resources\\images\\";
			
			FileOutputStream fos = null;
			try{
				if(insa_resum_file.getOriginalFilename() != ""){
					String filename=edto.getInsano() + "2";
					
					String modimg = null;
					filename += (insa_resum_file.getOriginalFilename().substring(insa_resum_file.getOriginalFilename().indexOf("."),insa_resum_file.getOriginalFilename().length()));
					
					byte fileData[] = insa_resum_file.getBytes();
					modimg = pathOfre +"\\"+ filename;
					fos = new FileOutputStream(modimg);
					 
					fos.write(fileData);
					edto.setInsa_resum(filename);
					//multiFile.transferTo(file); 
				}
				if(insa_img_file.getOriginalFilename() != ""){
					String filename=edto.getInsano() + "1";
					
					String modimg = null;
					filename += (insa_img_file.getOriginalFilename().substring(insa_img_file.getOriginalFilename().indexOf("."),insa_img_file.getOriginalFilename().length()));
					
					byte fileData[] = insa_img_file.getBytes();
					modimg = pathOfre +"\\"+ filename;
					fos = new FileOutputStream(modimg);
					 
					fos.write(fileData);
					edto.setInsa_img(filename);
					//multiFile.transferTo(file); 
				}
			}catch(Exception e){
				e.printStackTrace();	
			}finally{
				if(fos != null){
					try{
						fos.close();	
					}catch(Exception e2){
						
					}
				}
			}
			System.out.println(edto);
			dao.Insa_update(edto);
			return "redirect:view?empno="+edto.getInsano();
		}
	}
	
	
	@RequestMapping(value = "templeteFileDownload")
	public ModelAndView templeteFileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String realPath = request.getServletContext().getRealPath("");
		String pathOfre = realPath.substring(0,realPath.indexOf(".metadata"));
		pathOfre += realPath.substring(realPath.indexOf("wtpwebapps")+11,realPath.length()) + "\\src\\main\\webapp\\resources\\images\\";
		
		String propPath = pathOfre;
		String fileName = request.getParameter("fileName");
	   
		String fullFileName = propPath + fileName;
		File file = new File(fullFileName);
		return new ModelAndView("fileDownloadView", "downloadFile", file);
	}
	
	
	
	@RequestMapping(value = "select_acad", method = RequestMethod.POST)
	public void select_acad(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		
		String insano = request.getParameter("insano");
		EmpAcadDao dao = sqlSession.getMapper(EmpAcadDao.class);
		
		ArrayList<EmpAcadDto> dto = dao.Insa_SubAcad_Select(Integer.parseInt(insano));
		try {
	        response.getWriter().print(dto);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }  
	}
	
	@RequestMapping(value = "select_carrier", method = RequestMethod.POST)
	public void select_carrier(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		
		String insano = request.getParameter("insano");
		EmpCarrierDao dao = sqlSession.getMapper(EmpCarrierDao.class);
		
		ArrayList<EmpCarrierDto> dto = dao.Insa_SubCarrier_Select(Integer.parseInt(insano));
		try {
			response.getWriter().print(dto);
		} catch (IOException e) {
			e.printStackTrace();
		}  
	}
	@RequestMapping(value = "select_cont", method = RequestMethod.POST)
	public void select_cont(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		
		String insano = request.getParameter("insano");
		EmpContDao dao = sqlSession.getMapper(EmpContDao.class);
		
		ArrayList<EmpContDto> dto = dao.Insa_SubCont_Select(Integer.parseInt(insano));
		try {
			response.getWriter().print(dto);
		} catch (IOException e) {
			e.printStackTrace();
		}  
	}
	@RequestMapping(value = "select_edu", method = RequestMethod.POST)
	public void select_edu(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		
		String insano = request.getParameter("insano");
		EmpEduDao dao = sqlSession.getMapper(EmpEduDao.class);
		
		ArrayList<EmpEduDto> dto = dao.Insa_SubEdu_Select(Integer.parseInt(insano));
		try {
			response.getWriter().print(dto);
		} catch (IOException e) {
			e.printStackTrace();
		}  
	}
	@RequestMapping(value = "select_eqm", method = RequestMethod.POST)
	public void select_eqm(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		
		String insano = request.getParameter("insano");
		EmpEqmDao dao = sqlSession.getMapper(EmpEqmDao.class);
		
		ArrayList<EmpEqmDto> dto = dao.Insa_SubEqm_Select(Integer.parseInt(insano));
		try {
			response.getWriter().print(dto);
		} catch (IOException e) {
			e.printStackTrace();
		}  
	}
	
	@RequestMapping(value = "select_input", method = RequestMethod.POST)
	public void select_input(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		
		String insano = request.getParameter("insano");
		if(!insano.equals("")){
			EmpInputDao dao = sqlSession.getMapper(EmpInputDao.class);
			
			ArrayList<EmpInputDto> dto = dao.Insa_SubInput_Select(Integer.parseInt(insano));
			try {
				response.getWriter().print(dto);
			} catch (IOException e) {
				e.printStackTrace();
			}  	
		}else{
			try {
				response.getWriter().print("");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	@RequestMapping(value = "select_qual", method = RequestMethod.POST)
	public void select_qual(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		
		String insano = request.getParameter("insano");
		EmpQualDao dao = sqlSession.getMapper(EmpQualDao.class);
		
		ArrayList<EmpQualDto> dto = dao.Insa_SubQual_Select(Integer.parseInt(insano));
		try {
			response.getWriter().print(dto);
		} catch (IOException e) {
			e.printStackTrace();
		}  
	}
	@RequestMapping(value = "select_skill", method = RequestMethod.POST)
	public void select_skill(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		
		String insano = request.getParameter("insano");
		EmpSkillDao dao = sqlSession.getMapper(EmpSkillDao.class);
		
		ArrayList<EmpSkillDto> dto = dao.Insa_SubSkill_Select(Integer.parseInt(insano));
		try {
			response.getWriter().print(dto);
		} catch (IOException e) {
			e.printStackTrace();
		}  
	}
	@RequestMapping(value = "select_stech", method = RequestMethod.POST)
	public void select_stech(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		
		String insano = request.getParameter("insano");
		EmpStechDao dao = sqlSession.getMapper(EmpStechDao.class);
		
		ArrayList<EmpStechDto> dto = dao.Insa_SubStech_Select(Integer.parseInt(insano));
		try {
			response.getWriter().print(dto);
		} catch (IOException e) {
			e.printStackTrace();
		}  
	}
	
	
	
}
