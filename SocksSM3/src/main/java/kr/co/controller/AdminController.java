package kr.co.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.domain.CategoryVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;
import kr.co.domain.ReplyVO;
import kr.co.domain.ReplyListVO;
import kr.co.domain.SocksVO;
import kr.co.domain.SocksViewVO;
import kr.co.service.AdminService;
import kr.co.utils.UploadFileUtils;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	AdminService adminService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	// 관리자 화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		logger.info("get index");
	}

	// 상품 등록
	@RequestMapping(value = "/socks/register", method = RequestMethod.GET)
	public void getSocksRegister(Model model) throws Exception {
		logger.info("get socks register");
		
		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}

	// 상품 등록
	@RequestMapping(value = "/socks/register", method = RequestMethod.POST)
	public String postSocksRegister(SocksVO vo, MultipartFile file) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			vo.setSocksImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setSocksThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
			fileName = File.separator + "images" + File.separator + "none.png";
			
			vo.setSocksImg(fileName);
			vo.setSocksThumbImg(fileName);	
		}
		
		adminService.register(vo);
		
		return "redirect:/admin/index";
	}
	
	// 상품 목록
	@RequestMapping(value = "/socks/list", method = RequestMethod.GET) 
	public void getSocksList(Model model) throws Exception {
		logger.info("get socks list");
	
		List<SocksViewVO> list = adminService.sockslist(); 
		model.addAttribute("list", list); 
	}
	
	// 상품 조회
	@RequestMapping(value = "/socks/view", method = RequestMethod.GET)
	public void getSocksView(@RequestParam("n") int socksNum, Model model) throws Exception{
		logger.info("get socks view");
		
		SocksViewVO socks = adminService.socksView(socksNum);
		
		model.addAttribute("socks", socks);
	}
	
	// 상품 수정
	@RequestMapping(value = "/socks/update", method = RequestMethod.GET)
	public void getSocksUpdate(@RequestParam("n") int socksNum, Model model) throws Exception{
		logger.info("get socks update");
		
		SocksViewVO socks = adminService.socksView(socksNum);
		model.addAttribute("socks", socks);
		
		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	// 상품 수정
	@RequestMapping(value = "/socks/update", method = RequestMethod.POST)
	public String postSocksUpdate(SocksVO vo, MultipartFile file, HttpServletRequest req) throws Exception{
		logger.info("post socks update");
		
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			
			new File(uploadPath + req.getParameter("socksImg")).delete();
			new File(uploadPath + req.getParameter("socksThumbImg")).delete();
			
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
			vo.setSocksImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setSocksThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
		} else {
			vo.setSocksImg(req.getParameter("socksImg"));
			vo.setSocksThumbImg(req.getParameter("socksThumbImg"));

		}
		
		adminService.socksUpdate(vo);
		
		return "redirect:/admin/index";
	}
	
	// 상품 삭제
	@RequestMapping(value = "/socks/delete", method = RequestMethod.POST)
	public String postSocksDelete(@RequestParam("n") int socksNum) throws Exception{
		logger.info("post socks delete");
		
		adminService.socksDelete(socksNum);
		
		return "redirect:/admin/index";
	}
	
	// 주문 목록
	@RequestMapping(value = "/shop/orderList", method = RequestMethod.GET)
	public void getOrderList(Model model) throws Exception{
		logger.info("get order list");
		
		List<OrderVO> orderList = adminService.orderList();
		
		model.addAttribute("orderList", orderList);
	}
	
	// 주문 목록(상세)
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.GET)
	public void getOrderList(@RequestParam("n") String orderId, OrderVO order, Model model) throws Exception{
		logger.info("get order view");
		
		order.setOrderId(orderId);
		List<OrderListVO> orderView = adminService.orderView(order);
		
		model.addAttribute("orderView", orderView);
	}
	
	// 주문 목록(상세) 배송상황 변경
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.POST)
	public String delivery(OrderVO order) throws Exception{
		logger.info("post order view");
		
		adminService.delivery(order);
		
		List<OrderListVO> orderView = adminService.orderView(order);
		SocksVO socks = new SocksVO();
		
		for(OrderListVO i : orderView) {
			socks.setSocksNum(i.getSocksNum());
			socks.setSocksStock(i.getCartStock());
			adminService.changeStock(socks);
		}
		
		return "redirect:/admin/shop/orderView?n=" + order.getOrderId();
	}
	
	// 모든 댓글
	@RequestMapping(value = "/shop/allReply", method = RequestMethod.GET)
	public void getAllReply(Model model) throws Exception{
		logger.info("get all reply");
		
		List<ReplyListVO> reply = adminService.allReply();
		
		model.addAttribute("reply", reply);
	}
	
	// 모든 댓글
	@RequestMapping(value = "/shop/allReply", method = RequestMethod.POST)
	public String postAllReply(ReplyVO reply) throws Exception {
		logger.info("post all reply");
					
		adminService.deleteReply(reply.getReplyNum());
			
		return "redirect:/admin/shop/allReply";
	}	
	
}