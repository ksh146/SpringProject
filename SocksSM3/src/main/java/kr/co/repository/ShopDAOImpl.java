package kr.co.repository;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.CartListVO;
import kr.co.domain.CartVO;
import kr.co.domain.OrderDetailVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;
import kr.co.domain.ReplyListVO;
import kr.co.domain.ReplyVO;
import kr.co.domain.SocksViewVO;

@Repository
public class ShopDAOImpl implements ShopDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String NS = "kr.co.mappers.shopMapper";
	
	// 1차 상품 목록 분류
	@Override
	public List<SocksViewVO> list(int cateCode, int cateCodeRef) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cateCode", cateCode);
		map.put("cateCodeRef", cateCodeRef);
		
		return sql.selectList(NS + ".list_1", map);
	}
	
	// 2차 상품 목록 분류
	@Override
	public List<SocksViewVO> list(int cateCode) throws Exception {
		
		return sql.selectList(NS + ".list_2", cateCode);
	}
		
	// 상품 조회
	@Override
	public SocksViewVO socksView(int socksNum) throws Exception {
		
		return sql.selectOne("kr.co.mappers.adminMapper" + ".socksView", socksNum);
	}

	// 댓글 작성
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		sql.insert(NS + ".registReply", reply);
		
	}

	// 댓글 목록
	@Override
	public List<ReplyListVO> replyList(int socksNum) throws Exception {
		
		return sql.selectList(NS + ".replyList", socksNum);
	}

	// 댓글 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		sql.delete(NS + ".deleteReply", reply);
		
	}

	// ID 체크
	@Override
	public String idCheck(int replyNum) throws Exception {
		
		return sql.selectOne(NS + ".replyUserIdCheck", replyNum);
	}

	// 상품 수정
	@Override
	public void updateReply(ReplyVO reply) throws Exception {
		sql.update(NS + ".updateReply", reply);
		
	}

	// 장바구니
	@Override
	public void addCart(CartVO cart) throws Exception {
		sql.insert(NS + ".addCart", cart);
		
	}

	// 장바구니 목록
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		
		return sql.selectList(NS + ".cartList", userId);
	}

	// 장바구니 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		sql.delete(NS + ".deleteCart", cart);
		
	}

	// 주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		sql.insert(NS + ".orderInfo", order);
		
	}

	// 주문 상세정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		sql.insert(NS + ".orderInfo_Details", orderDetail);
		
	}

	// 장바구니 비우기
	@Override
	public void cartAllDelete(String userId) throws Exception {
		sql.delete(NS + ".cartAllDelete", userId);
		
	}

	// 주문 목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		
		return sql.selectList(NS + ".orderList", order);
	}

	// 주문 목록(상세)
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
	
		return sql.selectList(NS + ".orderView", order);
	}
	
}
