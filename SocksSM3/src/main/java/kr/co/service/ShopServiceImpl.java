package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.CartListVO;
import kr.co.domain.CartVO;
import kr.co.domain.OrderDetailVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;
import kr.co.domain.ReplyListVO;
import kr.co.domain.ReplyVO;
import kr.co.domain.SocksViewVO;
import kr.co.repository.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService{
	
	@Inject
	private ShopDAO dao;
	
	// 카테고리별 상품 목록
	@Override
	public List<SocksViewVO> list(int cateCode, int level) throws Exception {
		
		int cateCodeRef = 0;
		
		//1차 분류
		if (level == 1) {
			
			cateCodeRef = cateCode;
			return dao.list(cateCode, cateCodeRef);
			
		// 2차 분류	
		} else {
			
			return dao.list(cateCode);
		}
		
	}
	
	// 상품 조회
	@Override
	public SocksViewVO socksView(int socksNum) throws Exception {
		
		return dao.socksView(socksNum);
	}
	
	// 댓글 작성
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		dao.registReply(reply);
		
	}

	// 댓글 목록
	@Override
	public List<ReplyListVO> replyList(int socksNum) throws Exception {
		
		return dao.replyList(socksNum);
	}

	// 댓글 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		dao.deleteReply(reply);
		
	}

	// ID 체크
	@Override
	public String idCheck(int replyNum) throws Exception {
		
		return dao.idCheck(replyNum);
	}

	// 댓글 수정
	@Override
	public void updateReply(ReplyVO reply) throws Exception {
		dao.updateReply(reply);
		
	}

	// 장바구니
	@Override
	public void addCart(CartVO cart) throws Exception {
		dao.addCart(cart);
		
	}

	// 장바구니 목록
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		
		return dao.cartList(userId);
	}

	// 장바구니 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
		
	}

	// 주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);
		
	}

	// 주문 상세정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfo_Details(orderDetail);
		
	}

	// 장바구니 비우기
	@Override
	public void cartAllDelete(String userId) throws Exception {
		dao.cartAllDelete(userId);
		
	}

	// 주문 목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		
		return dao.orderList(order);
	}

	// 주문 목록(상세)
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		
		return dao.orderView(order);
	}
	
}
