package com.mycompany.daon;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.Console;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.daon.PromotionDao;
import com.mycompany.daon.PromotionDto;
import com.mycompany.daon.PromotionForm;
import com.mycompany.daon.PromotionFileForm;

@Service
public class PromotionService {
	
	protected final Logger logger = LoggerFactory.getLogger(PromotionService.class);
	
	@Autowired
	private PromotionDao promotionDao;
	
	/** �Խ��� - ��� ��ȸ */
	public List<PromotionDto> getPromotionList(PromotionForm promotionForm, int limit, int num) throws Exception{
		
		return promotionDao.getPromotionList(promotionForm, limit, num);
	}
	
	public int getPromotionCount() {
    	return promotionDao.getPromotionCount();
    }
	
	/** �Խ��� - �� ��ȸ */
    public PromotionDto getPromotionDetail(PromotionForm promotionForm) throws Exception {
 
    	PromotionDto promotionDto = new PromotionDto();
 
        String searchType = promotionForm.getSearch_type();
 
        
        /*if("S".equals(searchType)){
            
            int updateCnt = boardDao.updateBoardHits(boardForm);
        
            if (updateCnt > 0) {
                boardDto = boardDao.getBoardDetail(boardForm);
            }
            
        } else {
            
            boardDto = boardDao.getBoardDetail(boardForm);
        }*/
 
        promotionDto = promotionDao.getPromotionDetail(promotionForm);
        
        PromotionFileForm promotionFileForm = new PromotionFileForm();
        promotionFileForm.setBoard_no(promotionForm.getBoard_no());
 
        promotionDto.setFiles(promotionDao.getPromotionFileList(promotionFileForm));
        
        return promotionDto;
    }
 
    /** �Խ��� - ��� */
    public PromotionDto insertPromotion(PromotionForm promotionForm) throws Exception {
 
    	PromotionDto promotionDto = new PromotionDto();
    	 
        int insertCnt = 0;
 
        int promotionReRef = promotionDao.getPromotionReRef(promotionForm);
        promotionForm.setBoard_re_ref(promotionReRef);

        insertCnt = promotionDao.insertPromotion(promotionForm);
        
        List<PromotionFileForm> promotionFileList = getPromotionFileInfo(promotionForm);
        
        for (PromotionFileForm promotionFileForm : promotionFileList) {
            promotionDao.insertPromotionFile(promotionFileForm);
        }
 
        if (insertCnt > 0) {
        	promotionDto.setResult("SUCCESS");
        } else {
        	promotionDto.setResult("FAIL");
        }
 
        return promotionDto;
    }
 
    /** �Խ��� - ���� */
    public PromotionDto deletePromotion(PromotionForm promotionForm) throws Exception {
 
    	PromotionDto promotionDto = new PromotionDto();

        int deleteCnt = promotionDao.deletePromotion(promotionForm);
 
        if (deleteCnt > 0) {
        	promotionDto.setResult("SUCCESS");
        } else {
        	promotionDto.setResult("FAIL");
        }
 
        return promotionDto;
    }
    
    /** 게시판 - 첨부파일 정보 조회 */
    public List<PromotionFileForm> getPromotionFileInfo(PromotionForm promotionForm) throws Exception {
 
        List<MultipartFile> files = promotionForm.getFiles();
 
        List<PromotionFileForm> promotionFileList = new ArrayList<PromotionFileForm>();
 
        PromotionFileForm promotionFileForm = new PromotionFileForm();
 
        int board_no = promotionForm.getBoard_no();
        String file_name = null;
        String file_Ext = null;
        String file_name_key = null;
        String file_size = null;
        // 파일이 저장될 Path 설정
        String file_path = "promotionFiles";
        
        if (files != null && files.size() > 0) {
 
            File file = new File(file_path);
            
            // 디렉토리가 없으면 생성
            if (file.exists() == false) {
                file.mkdirs();
            }
 
            for (MultipartFile multipartFile : files) {
 
            	file_name = multipartFile.getOriginalFilename();
                file_Ext = file_name.substring(file_name.lastIndexOf("."));
                // 파일명 변경(uuid로 암호화) + 확장자
                file_name_key = getRandomString() + file_Ext;
                file_size = String.valueOf(multipartFile.getSize());
 
                // 설정한 Path에 파일 저장
                file = new File(file_path + "/" + file_name_key);
 
                multipartFile.transferTo(file);
 
                promotionFileForm = new PromotionFileForm();
                promotionFileForm.setBoard_no(board_no);
                promotionFileForm.setFile_name(file_name);
                promotionFileForm.setFile_name_key(file_name_key);
                promotionFileForm.setFile_path(file_path);
                promotionFileForm.setFile_size(file_size);
                promotionFileList.add(promotionFileForm);
            }
        }
 
        return promotionFileList;
    }
    
    /** 32글자의 랜덤한 문자열(숫자포함) 생성 */
    public static String getRandomString() {
 
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
    
    /*public void fileUpload(String originalfileName, String saveFileName, long fileSize) {
        HashMap<String, Object> hm = new HashMap<>();
        hm.put("originalfileName", originalfileName);
        hm.put("saveFileName", saveFileName);
        hm.put("fileSize", fileSize);
         
        boardDao.uploadFile(hm);
    }*/
 
    /** �Խ��� - ���� */
    /*public BoardDto updateBoard(BoardForm boardForm) throws Exception {
 
        BoardDto boardDto = new BoardDto();
 
        int deleteCnt = boardDao.updateBoard(boardForm);
 
        if (deleteCnt > 0) {
            boardDto.setResult("SUCCESS");
        } else {
            boardDto.setResult("FAIL");
        }
 
        return boardDto;
    }*/
}
