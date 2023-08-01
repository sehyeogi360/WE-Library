package com.marondal.welibrary.wishbook.bo;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.welibrary.book.dao.BookDAO;
import com.marondal.welibrary.user.bo.UserBO;
import com.marondal.welibrary.wishbook.dao.WishBookDAO;
import com.marondal.welibrary.wishbook.model.WishBook;
import com.marondal.welibrary.wishbook.model.WishBookDetail;

@Service
public class WishBookBO {
	
	@Autowired
	private WishBookDAO wishBookDAO;

	@Autowired
	private UserBO userBO;
	
	
	//희망도서 신청
	
		public int addWishbook( int userId
							   , String library
							   , String title   
							   , MultipartFile file 
							   , String author   
							   , String publisher   
							   , int price   
							   , String isbn   
							   , int pubyear
							   ) {
			//파일매니저 서비스 추가하기
			//String imagePath = FileManagerService.saveFile(userId, file);
			
			
			return wishBookDAO.insertWishBook(userId, library, title, title, author, publisher, price, isbn, pubyear);		

		}
		//희망도서 리스트
		//희망도서 리스트(사용자가 신청한 리스트)
		
		public List<WishBookDetail> getWishBookList(int userId, int id){
				
			List<WishBook> wishbookList = wishBookDAO.selectWishBookList(userId, id);
			
			List<WishBookDetail> wishbookDetailList = new ArrayList<>();
			
			for(WishBook wishbook:wishbookList) {
				
				//갯수, 소장여부 변수
				// 이거 관련 비오를 하나 더 파는게 나을듯 신청 갯수랑 소장여부 변수는..
				WishBookDetail wishbookDetail = new WishBookDetail();
				
				wishbookDetail.setId(id);
				wishbookDetail.setUserId(userId);
				wishbookDetail.setLibrary(wishbook.getLibrary());
				wishbookDetail.setTitle(wishbook.getTitle());
				wishbookDetail.setAuthor(wishbook.getAuthor());
				wishbookDetail.setCreatedAt(wishbook.getCreatedAt());
				
				wishbookDetailList.add(wishbookDetail);
			}
			
			
			return wishbookDetailList;
			
		}
			
		
		
}
