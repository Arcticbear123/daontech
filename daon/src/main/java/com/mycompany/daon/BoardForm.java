package com.mycompany.daon;

import java.util.Date;

public class BoardForm {

	int board_no;
    String board_title;
    String board_content;
    Date reg_date;
    String board_writer;
	String search_type;
    
    public int getBoard_no() {
        return board_no;
    }
 
    public void setBoard_no(int board_no) {
        this.board_no = board_no;
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
 //¿À·ù¤Ì°³¤µ
}
