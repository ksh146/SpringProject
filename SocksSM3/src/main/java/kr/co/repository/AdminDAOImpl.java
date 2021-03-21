package kr.co.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.CategoryVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;
import kr.co.domain.ReplyListVO;
import kr.co.domain.SocksVO;
import kr.co.domain.SocksViewVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String NS = "kr.co.mappers.adminMapper";

	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		
		return sql.selectList(NS + ".category");
	}

	// 상품 등록
	@Override
	public void register(SocksVO vo) throws Exception {
		
		sql.insert(NS + ".register", vo);
	}

	// 상품 목록
	@Override
	public List<SocksViewVO> sockslist() throws Exception {
		
		return sql.selectList(NS + ".sockslist");
	}

	// 상품 조회
	@Override
	public SocksViewVO socksView(int socksNum) throws Exception {
		
		return sql.selectOne(NS + ".socksView", socksNum);
	}

	// 상품 수정
	@Override
	public void socksUpdate(SocksVO vo) throws Exception {
		sql.update(NS + ".socksUpdate", vo);
	}
	
	// 상품 삭제
	@Override
	public void socksDelete(int socksNum) throws Exception {
		sql.delete(NS + ".socksDelete", socksNum);
		
	}

	// 주문 목록
	@Override
	public List<OrderVO> orderList() throws Exception {
		
		return sql.selectList(NS + ".orderList");
	}

	// 주문 목록(상세)
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		
		return sql.selectList(NS + ".orderView", order);
	}

	// 배송 상황
	@Override
	public void delivery(OrderVO order) throws Exception {
		sql.update(NS + ".delivery", order);
		
	}

	// 상품 수량 변경
	@Override
	public void changeStock(SocksVO socks) throws Exception {
		sql.update(NS + ".changeStock", socks);
		
	}

	// 모든 댓글
	@Override
	public List<ReplyListVO> allReply() throws Exception {
		
		return sql.selectList(NS + ".allReply");
	}

	// 댓글 삭제
	@Override
	public void deleteReply(int replyNum) throws Exception {
		sql.delete(NS + ".deleteReply", replyNum);
		
	}

}
