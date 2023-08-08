package com.marondal.welibrary.book;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marondal.welibrary.book.bo.BookBO;
import com.marondal.welibrary.book.dao.BookDAO;
import com.marondal.welibrary.book.model.Book;
import com.marondal.welibrary.book.model.WishBook;
import com.marondal.welibrary.book.model.WishBookCount;
import com.marondal.welibrary.book.model.WishBookDetail;
import com.marondal.welibrary.book.wishbook.bo.WishBookBO;
import com.marondal.welibrary.book.wishbook.bo.WishBookCountBO;
import com.marondal.welibrary.user.bo.UserBO;
import com.marondal.welibrary.user.dao.UserDAO;
import com.marondal.welibrary.user.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private UserBO userBO;
	
	
	@Autowired
	private WishBookBO wishBookBO;
	
	@Autowired
	private WishBookCountBO wishBookCountBO;
	
	
	
	@GetMapping("/borrowstatus/view")
	public String borrowStatus(Model model
			, @RequestParam("id") int id) {
			
		User user = userBO.getUserInfo(id); 
		
		model.addAttribute("user", user);
		
		return "book/borrowstatus";
		
	}
	
	@GetMapping("/wishbook/list/view")
	public String wishbookList(Model model
			, HttpSession session                                                                    
			) {
	
		                                                                                                                                                              
		int userId = (Integer) session.getAttribute("userId");
		

		List<WishBookDetail> wishbookList = wishBookBO.getWishBookList(userId);
		model.addAttribute("wishbookList", wishbookList);
		
		//여기서 관심도서개수 추가
		WishBookCount wishbookcount = wishBookCountBO.getWishBookNumberByuserId(userId);
		model.addAttribute("wishbookcount", wishbookcount);
		
		return "book/wishbooklist";
		
	}
	
	@GetMapping("/wishbook/add/view")
	public String wishbookAdd(Model model
			, int userId) {
		
		User user = userBO.getUserInfo(userId); //이상하게 DAO로 해도 잘불러와지더라.
		
		model.addAttribute("user", user);

		return "book/wishbookadd";
	}
	
	@GetMapping("/interestbooklist/view")
	public String interestBookList(Model model
			, int id) {
		
		User user = userBO.getUserInfo(id); //이상하게 DAO로 해도 잘불러와지더라.
		
		model.addAttribute("user", user);

		
		//여기서 관심도서개수 추가
		
		return "book/interestbooklist";
	}
	
	@GetMapping("/interibrarybooklist/view")
	public String interibraryBookList(Model model
			, int id) {
		
		User user = userBO.getUserInfo(id); //이상하게 DAO로 해도 잘불러와지더라.
		
		model.addAttribute("user", user);
		
		//여기서 상호대차도서개수 추가
		
		return "book/interibrarybooklist";
	}
	
	
	
	
	@GetMapping("/bookaddpopup/view")
	public String bookAddPopUp(Model model
							   //, @RequestParam("title") String title
							   ) {

		
		
		return "book/bookaddpopup";
		
	}
	
	
}
