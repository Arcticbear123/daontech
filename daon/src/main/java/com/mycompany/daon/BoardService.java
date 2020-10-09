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

import com.mycompany.daon.BoardDao;
import com.mycompany.daon.BoardDto;
import com.mycompany.daon.BoardForm;
import com.mycompany.daon.BoardFileForm;

@Service
public class BoardService {
	
	protected final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	@Autowired
	private BoardDao boardDao;
	
	/** �Խ��� - ��� ��ȸ */
	public List<BoardDto> getBoardList(BoardForm boardForm, int limit, int num) throws Exception{
		
		return boardDao.getBoardList(boardForm, limit, num);
	}
	
	public int getBoardCount() {
    	return boardDao.getBoardCount();
    }
	
	/** �Խ��� - �� ��ȸ */
    public BoardDto getBoardDetail(BoardForm boardForm) throws Exception {
 
        BoardDto boardDto = new BoardDto();
 
        String searchType = boardForm.getSearch_type();
 
        
        /*if("S".equals(searchType)){
            
            int updateCnt = boardDao.updateBoardHits(boardForm);
        
            if (updateCnt > 0) {
                boardDto = boardDao.getBoardDetail(boardForm);
            }
            
        } else {
            
            boardDto = boardDao.getBoardDetail(boardForm);
        }*/
 
        boardDto = boardDao.getBoardDetail(boardForm);
        
        BoardFileForm boardFileForm = new BoardFileForm();
        boardFileForm.setBoard_no(boardForm.getBoard_no());
 
        boardDto.setFiles(boardDao.getBoardFileList(boardFileForm));
        
        return boardDto;
    }
 
    /** �Խ��� - ��� */
    public BoardDto insertBoard(BoardForm boardForm) throws Exception {
 
    	BoardDto boardDto = new BoardDto();
    	 
        int insertCnt = 0;
 
        int boardReRef = boardDao.getBoardReRef(boardForm);
        boardForm.setBoard_re_ref(boardReRef);

        insertCnt = boardDao.insertBoard(boardForm);
        
        List<BoardFileForm> boardFileList = getBoardFileInfo(boardForm);
        
        for (BoardFileForm boardFileForm : boardFileList) {
            boardDao.insertBoardFile(boardFileForm);
        }
 
        if (insertCnt > 0) {
            boardDto.setResult("SUCCESS");
        } else {
            boardDto.setResult("FAIL");
        }
 
        return boardDto;
    }
 
    /** �Խ��� - ���� */
    public BoardDto deleteBoard(BoardForm boardForm) throws Exception {
 
        BoardDto boardDto = new BoardDto();

        int deleteCnt = boardDao.deleteBoard(boardForm);
 
        if (deleteCnt > 0) {
            boardDto.setResult("SUCCESS");
        } else {
            boardDto.setResult("FAIL");
        }
 
        return boardDto;
    }
    
    /** 게시판 - 첨부파일 정보 조회 */
    public List<BoardFileForm> getBoardFileInfo(BoardForm boardForm) throws Exception {
 
        List<MultipartFile> files = boardForm.getFiles();
 
        List<BoardFileForm> boardFileList = new ArrayList<BoardFileForm>();
 
        BoardFileForm boardFileForm = new BoardFileForm();
 
        int board_no = boardForm.getBoard_no();
        String file_name = null;
        String file_Ext = null;
        String file_name_key = null;
        String file_size = null;
        // 파일이 저장될 Path 설정
        String file_path = "boardFiles";
        
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
 
                boardFileForm = new BoardFileForm();
                boardFileForm.setBoard_no(board_no);
                boardFileForm.setFile_name(file_name);
                boardFileForm.setFile_name_key(file_name_key);
                boardFileForm.setFile_path(file_path);
                boardFileForm.setFile_size(file_size);
                boardFileList.add(boardFileForm);
            }
        }
 
        return boardFileList;
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
