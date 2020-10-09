package com.mycompany.daon;

import java.util.Date;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PromotionForm {

	List<MultipartFile> files;
	int board_no;
	int board_re_ref;
    String board_title;
    String board_content;
    Date reg_date;
    String board_writer;
	String search_type;
	String board_file;
	
	
	public List<MultipartFile> getFiles() {
        return files;
    }
	
	public void setFiles(List<MultipartFile> files) {
	        this.files = files;
	}
    
    public int getBoard_no() {
        return board_no;
    }
 
    public void setBoard_no(int board_no) {
        this.board_no = board_no;
    }
    
    public int getBoard_re_ref() {
        return board_re_ref;
    }
 
    public void setBoard_re_ref(int board_re_ref) {
        this.board_re_ref = board_re_ref;
    }
 
    public String getBoard_title() {
        return board_title;
    }
 
    public void setBoard_title(String board_title) {
        this.board_title = board_title;
    }
 
    public String getBoard_content() {
        return board_content;
    }
 
    public void setBoard_content(String board_content) {
        this.board_content = board_content;
    }
 
 
    public Date getreg_date() {
        return reg_date;
    }
 
    public void setreg_date(Date reg_date) {
        this.reg_date = reg_date;
    }
    
    public String getSearch_type() {
        return search_type;
    }
 
    public void setSearch_type(String search_type) {
        this.search_type = search_type;
    }
    
    public String getBoard_writer() {
        return board_writer;
    }
 
    public void setBoard_writer(String board_writer) {
        this.board_writer = board_writer;
    }

    public String getBoard_file() {
        return board_file;
    }
 
    public void setBoard_file(String board_file) {
        this.board_file = board_file;
    }

}
