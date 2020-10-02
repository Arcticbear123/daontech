package com.mycompany.daon;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
 
import com.mycompany.daon.BoardDto;
import com.mycompany.daon.BoardForm;

@Repository
public class BoardDao {

	@Resource(name = "sqlSession")
    private SqlSession sqlSession;
 
    private static final String NAMESPACE = "com.mycompany.daon.boardmapper";
 
    /** �Խ��� - ��� ��ȸ  */
    public List<BoardDto> getBoardList(BoardForm boardForm, int limit, int num) throws Exception {
    	
    	RowBounds row = new RowBounds(limit , num);

        return sqlSession.selectList(NAMESPACE + ".getBoardList", null, row);
    }
    
    public int getBoardCount() {
    	return sqlSession.selectOne(NAMESPACE + ".getBoardCount");
    }
    
    /** �Խ��� - �� ��ȸ  */
    public BoardDto getBoardDetail(BoardForm boardForm) throws Exception {
        
        return sqlSession.selectOne(NAMESPACE + ".getBoardDetail", boardForm);
    }
    
    /** 게시판 - 첨부파일 조회 */
    public List<BoardFileDto> getBoardFileList(BoardFileForm boardFileForm) throws Exception {
 
        return sqlSession.selectList(NAMESPACE + ".getBoardFileList", boardFileForm);
    }
 
    
    /** �Խ��� - ���  */   
    public int insertBoard(BoardForm boardForm) throws Exception {
        return sqlSession.insert(NAMESPACE + ".insertBoard", boardForm);
    }
    
    /** �Խ��� - ����  */
    public int deleteBoard(BoardForm boardForm) throws Exception {
        
        return sqlSession.delete(NAMESPACE + ".deleteBoard", boardForm);
    }
    
    /** 게시판 - 그룹 번호 조회 */
    public int getBoardReRef(BoardForm boardForm) throws Exception {
 
        return sqlSession.selectOne(NAMESPACE + ".getBoardReRef", boardForm);
    }
    
    /** 게시판 - 첨부파일 등록 */
	public int insertBoardFile(BoardFileForm boardFileForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoardFile", boardFileForm);
	}
    
    /** �Խ��� - ����  */
    /*public int updateBoard(BoardForm boardForm) throws Exception {
        
        return sqlSession.update(NAMESPACE + ".updateBoard", boardForm);
    }*/
}
