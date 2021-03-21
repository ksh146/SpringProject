package kr.co.service;

import java.util.List;

import kr.co.domain.CategoryVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;
import kr.co.domain.ReplyListVO;
import kr.co.domain.SocksVO;
import kr.co.domain.SocksViewVO;

public interface AdminService {

	public List<CategoryVO> category() throws Exception;

	public void register(SocksVO vo) throws Exception;

	public List<SocksViewVO> sockslist() throws Exception;

	public SocksViewVO socksView(int socksNum) throws Exception;

	public void socksUpdate(SocksVO vo) throws Exception;
	
	public void socksDelete(int socksNum) throws Exception;

	public List<OrderVO> orderList() throws Exception;

	public List<OrderListVO> orderView(OrderVO order) throws Exception;

	public void delivery(OrderVO order) throws Exception;
	
	public void changeStock(SocksVO socks) throws Exception;

	public List<ReplyListVO> allReply() throws Exception;
	
	public void deleteReply(int replyNum) throws Exception;

}
