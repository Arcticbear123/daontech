package com.mycompany.daon;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
 
import com.mycompany.daon.PromotionDto;
import com.mycompany.daon.PromotionForm;

@Repository
public class PromotionDao {

	@Resource(name = "sqlSession")
    private SqlSession sqlSession;
 
    private static final String NAMESPACE = "com.mycompany.daon.boardmapper";
 
    /** �Խ��� - ��� ��ȸ  */
    public List<PromotionDto> getPromotionList(PromotionForm promotionForm, int limit, int num) throws Exception {
    	
    	RowBounds row = new RowBounds(limit , num);

        return sqlSession.selectList(NAMESPACE + ".getPromotionList", null, row);
    }
    
    public int getPromotionCount() {
    	return sqlSession.selectOne(NAMESPACE + ".getPromotionCount");
    }
    
    /** �Խ��� - �� ��ȸ  */
    public PromotionDto getPromotionDetail(PromotionForm promotionForm) throws Exception {
        
        return sqlSession.selectOne(NAMESPACE + ".getPromotionDetail", promotionForm);
    }
    
    /** 게시판 - 첨부파일 조회 */
    public List<PromotionFileDto> getPromotionFileList(PromotionFileForm promotionFileForm) throws Exception {
 
        return sqlSession.selectList(NAMESPACE + ".getPromotionFileList", promotionFileForm);
    }
 
    
    /** �Խ��� - ���  */   
    public int insertPromotion(PromotionForm promotionForm) throws Exception {
        return sqlSession.insert(NAMESPACE + ".insertPromotion", promotionForm);
    }
    
    /** �Խ��� - ����  */
    public int deletePromotion(PromotionForm promotionForm) throws Exception {
        
        return sqlSession.delete(NAMESPACE + ".deletePromotion", promotionForm);
    }
    
    /** 게시판 - 그룹 번호 조회 */
    public int getPromotionReRef(PromotionForm promotionForm) throws Exception {
 
        return sqlSession.selectOne(NAMESPACE + ".getPromotionReRef", promotionForm);
    }
    
    /** 게시판 - 첨부파일 등록 */
	public int insertPromotionFile(PromotionFileForm promotionFileForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertPromotionFile", promotionFileForm);
	}
    
    /** �Խ��� - ����  */
    /*public int updateBoard(BoardForm boardForm) throws Exception {
        
        return sqlSession.update(NAMESPACE + ".updateBoard", boardForm);
    }*/
}
