package com.mycompany.daon;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.daon.NewsDto;
import com.mycompany.daon.NewsForm;
import com.mycompany.daon.NewsService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NewsController {
	
	private static final Logger logger = LoggerFactory.getLogger(NewsController.class);
	
	@Autowired
	private NewsService newsService;	    
	
	@RequestMapping(value = "/getNewsList")
	@ResponseBody
	   public List<NewsDto> getNewsList(HttpServletRequest request, HttpServletResponse response, NewsForm newsForm) throws Exception {
		 String limitStr = request.getParameter("limit");
		 String numStr = request.getParameter("num");
		 int limit;
		 int num;
		 int count = newsService.getNewsCount();
		 
		 if(limitStr==null || numStr==null) {
			 limit = 0;
			 num = count;
		 }else {
			 limit = Integer.parseInt(limitStr);
			 num = Integer.parseInt(numStr);
		 }
		
        List<NewsDto> newsDtoList = newsService.getNewsList(newsForm, limit, num);
 
        return newsDtoList;
	}
	
	@RequestMapping(value = "/getNewsCount")
	@ResponseBody
	   public int getNewsCount(HttpServletRequest request, HttpServletResponse response, NewsForm newsForm) throws Exception {
		 		 
        int count = newsService.getNewsCount();
 
        return count;
	}	
    
    @RequestMapping(value = "/getNewsDetail")
    @ResponseBody
    public NewsDto getNewsDetail(HttpServletRequest request, HttpServletResponse response, NewsForm newsForm) throws Exception {
 
        NewsDto newsDto = newsService.getNewsDetail(newsForm);
 
        return newsDto;
    }
    
    @RequestMapping(value = "/insertNews")
    @ResponseBody
    public NewsDto insertNews(HttpServletRequest request, HttpServletResponse response, NewsForm newsForm) throws Exception{
        
    	NewsDto newsDto = newsService.insertNews(newsForm);
        
        return newsDto;
    }
    
    /** �Խ��� - ���� */
    @RequestMapping( value = "/deleteNews")
    @ResponseBody
    public NewsDto deleteNews(HttpServletRequest request, HttpServletResponse response, NewsForm newsForm) throws Exception{
        
    	NewsDto newsDto = newsService.deleteNews(newsForm);
        
        return newsDto;
    }
    /*
    @RequestMapping(value = "/recruitNoticeEdit", method = RequestMethod.GET)
	public String recruitNoticeEdit(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "recruit/recruitNoticeEdit";
	}*/
    /*
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String upload(Locale locale, Model model) {

		return "upload";
	}*/
    
    /** 게시판 - 첨부파일 다운로드 *//*
    @RequestMapping("/fileDownload")                      
    public ModelAndView fileDownload(@RequestParam("fileNameKey") String fileNameKey
                                    ,@RequestParam("fileName") String fileName
                                    ,@RequestParam("filePath") String filePath) throws Exception {
          
    
        Map<String, Object> fileInfo = new HashMap<String, Object>();
        fileInfo.put("fileNameKey", fileNameKey);
        fileInfo.put("fileName", fileName);
        fileInfo.put("filePath", filePath);
     
        return new ModelAndView("FileDownloadUtil", "fileInfo", fileInfo);
    }*/
    
    /** �Խ��� - ���� ������ �̵� */
    /*@RequestMapping( value = "/boardUpdate")
    public String boardUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        return "board/boardUpdate";
    }*/
    
    /** �Խ��� - ���� */
   /* @RequestMapping( value = "/updateBoard")
    @ResponseBody
    public BoardDto updateBoard(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception{
        
        BoardDto boardDto = boardService.updateBoard(boardForm);
        
        return boardDto;
    }*/        

}
