package com.mycompany.daon;

import java.util.Date;

public class NewsFileForm{
     int file_no;
     int board_no;
     String file_name;
     String file_name_key;
     String file_size;
     String reg_date;
     String file_path;
 
    public int getFile_no() {
        return file_no;
    }
 
    public void setFile_no(int file_no) {
        this.file_no = file_no;
    }
 
    public int getBoard_no() {
        return board_no;
    }
 
    public void setBoard_no(int board_no) {
        this.board_no = board_no;
    }
 
    public String getFile_name() {
        return file_name;
    }
 
    public void setFile_name(String file_name) {
        this.file_name = file_name;
    }
    
    public String getFile_name_key() {
    	return file_name_key;
    }
    
    public void setFile_name_key(String file_name_key) {
        this.file_name_key = file_name_key;
    }
 
    public String getFile_size() {
    	return file_size;
    }
    
    public void setFile_size(String file_size) {
        this.file_size = file_size;
    }
 
    public String getreg_date() {
        return reg_date;
    }
 
    public void setreg_date(String reg_date) {
        this.reg_date = reg_date;
    }
    
    public String getFile_path(String file_path) {
    	return file_path;
    }
    
    public void setFile_path(String file_path) {
        this.file_path = file_path;
    }
}
