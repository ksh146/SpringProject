package kr.co.repository;

import java.util.List;

import kr.co.domain.CartListVO;
import kr.co.domain.CartVO;
import kr.co.domain.OrderDetailVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;
import kr.co.domain.ReplyListVO;
import kr.co.domain.ReplyVO;
import kr.co.domain.SocksViewVO;

public interface ShopDAO {
	
	public List<SocksViewVO> list(int cateCode, int cateCodeRef) throws Exception;
	
	public List<SocksViewVO> list(int cateCode) throws Exception;

	public SocksViewVO socksView(int socksNum) throws Exception;

	public void registReply(ReplyVO reply) throws Exception;

	public List<ReplyListVO> replyList(int socksNum) throws Exception;

	public void deleteReply(ReplyVO reply) throws Exception;

	public String idCheck(int replyNum) throws Exception;

	public void updateReply(ReplyVO reply) throws Exception;

	public void addCart(CartVO cart) throws Exception;

	public List<CartListVO> cartList(String userId) throws Exception;

	public void deleteCart(CartVO cart) throws Exception;

	public void orderInfo(OrderVO order) throws Exception;

	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;

	public void cartAllDelete(String userId) throws Exception;

	public List<OrderVO> orderList(OrderVO order) throws Exception;

	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
}
