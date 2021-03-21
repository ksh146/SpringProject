package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.CategoryVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;
import kr.co.domain.ReplyListVO;
import kr.co.domain.SocksVO;
import kr.co.domain.SocksViewVO;
import kr.co.repository.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Inject
	private AdminDAO dao;

	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		
		return dao.category();
	}

	// 상품 등록
	@Override
	public void register(SocksVO vo) throws Exception {
		
		dao.register(vo);
	}

	// 상품 목록
	@Override
	public List<SocksViewVO> sockslist() throws Exception {
		
		return dao.sockslist();
	}

	// 상품 조회
	@Override
	public SocksViewVO socksView(int socksNum) throws Exception {
		
		return dao.socksView(socksNum);
	}
	
	// 상품 수정
	@Override
	public void socksUpdate(SocksVO vo) throws Exception {
		dao.socksUpdate(vo);
		
	}

	// 상품 삭제
	@Override
	public void socksDelete(int socksNum) throws Exception {
		dao.socksDelete(socksNum);
		
	}

	// 주문 목록
	@Override
	public List<OrderVO> orderList() throws Exception {
		
		return dao.orderList();
	}

	// 주문 목록(상세)
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		
		return dao.orderView(order);
	}

	// 배송 상황
	@Override
	public void delivery(OrderVO order) throws Exception {
		dao.delivery(order);
		
	}

	// 상품 수량 변경
	@Override
	public void changeStock(SocksVO socks) throws Exception {
		dao.changeStock(socks);
		
	}

	// 모든 댓글
	@Override
	public List<ReplyListVO> allReply() throws Exception {
		
		return dao.allReply();
	}

	// 댓글 삭제
	@Override
	public void deleteReply(int replyNum) throws Exception {
		dao.deleteReply(replyNum);
		
	}

}
