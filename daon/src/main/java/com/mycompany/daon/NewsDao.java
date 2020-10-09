package com.mycompany.daon;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
 
import com.mycompany.daon.NewsDto;
import com.mycompany.daon.NewsForm;

@Repository
public class NewsDao {

	@Resource(name = "sqlSession")
    private SqlSession sqlSession;
 
    private static final String NAMESPACE = "com.mycompany.daon.boardmapper";
 
    /** �Խ��� - ��� ��ȸ  */
    public List<NewsDto> getNewsList(NewsForm newsForm, int limit, int num) throws Exception {
    	
    	RowBounds row = new RowBounds(limit , num);

        return sqlSession.selectList(NAMESPACE + ".getNewsList", null, row);
    }
    
    public int getNewsCount() {
    	return sqlSession.selectOne(NAMESPACE + ".getNewsCount");
    }
    
    /** �Խ��� - �� ��ȸ  */
    public NewsDto getNewsDetail(NewsForm newsForm) throws Exception {
        
        return sqlSession.selectOne(NAMESPACE + ".getNewsDetail", newsForm);
    }
    
    /** 게시판 - 첨부파일 조회 */
    public List<NewsFileDto> getNewsFileList(NewsFileForm newsFileForm) throws Exception {
 
        return sqlSession.selectList(NAMESPACE + ".getNewsFileList", newsFileForm);
    }
 
    
    /** �Խ��� - ���  */   
    public int insertNews(NewsForm newsForm) throws Exception {
        return sqlSession.insert(NAMESPACE + ".insertNews", newsForm);
    }
    
    /** �Խ��� - ����  */
    public int deleteNews(NewsForm newsForm) throws Exception {
        
        return sqlSession.delete(NAMESPACE + ".deleteNews", newsForm);
    }
    
    /** 게시판 - 그룹 번호 조회 */
    public int getNewsReRef(NewsForm newsForm) throws Exception {
 
        return sqlSession.selectOne(NAMESPACE + ".getNewsReRef", newsForm);
    }
    
    /** 게시판 - 첨부파일 등록 */
	public int insertNewsFile(NewsFileForm newsFileForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertNewsFile", newsFileForm);
	}
    
    /** �Խ��� - ����  */
    /*public int updateBoard(BoardForm boardForm) throws Exception {
        
        return sqlSession.update(NAMESPACE + ".updateBoard", boardForm);
    }*/
}
