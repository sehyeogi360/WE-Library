<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 도서 리스트 화면</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
		
		<div class="librarylist-page">
			<div class="sub-profile bg-secondary">
				<c:import url="/WEB-INF/jsp/include/subprofile.jsp"/>
				
				<div class="sub-text bg-info">
					<h2 class="text-center text-white mt-3"><b>간략검색</b></h2>
				</div>
			</div>
		
		
		<div class="searchbox ">
			<form action="/library/list/view" method="get" class=""><!-- bootstrap input group 검색 -->
			<nav class="bg-primary booksearch-nav d-flex justify-content-center align-items-center col-10">
				<div class="text-white col-2">
					<h5>통합검색</h5>
				</div>
				
				
				<div class="search d-flex justify-content-center col-9">
		             <input type="text" value="" placeholder="검색어 입력" id="searchInput"class="form-control" name="title">
		             <div class="input-group-append">
		                <button type="submit" id="searchBtn" class="btn">검색</button>
		             </div>
		        </div>
		         
		    </nav> 
		    <hr style="border: solid 1px;">
		   		<div class="mt-3 library-selectbox bg-secondary col-10">
		   		<label class=""><input type="checkbox" id="allCheck" class="mr-2">전체 선택</label> <br>
		   		<hr>
			   		<div class="">
				        <label class=""><input type="checkbox" name="check" value="역삼푸른솔도서관" class="mr-2">역삼푸른솔도서관</label>
				        <label class="ml-4"><input type="checkbox" name="check" value="역삼도서관" class="mr-2">역삼도서관</label>
				        <label class="ml-4"><input type="checkbox" name="check" value="행복한도서관" class="mr-2">행복한도서관</label>
				        <label class="ml-4"><input type="checkbox" name="check" value="논현도서관" class="mr-2">논현도서관</label>
				        <label class="ml-4"><input type="checkbox" name="check" value="대치도서관" class="mr-2">대치도서관</label>
			    	</div>
		    	</div>
			</form>
		
		</div>
		
		<div class="bg-info bookcard-list">
		
		<c:forEach var="book" items="${bookList }">
			<hr>
			<div class="bg-warning bookcard d-flex ">
			
				<div class="bg-secondary bookimg-box">
					
					<a href="/library/bookinfo/view?id=${book.id }" class="book-profile">
						<img class="profile" src="${book.imagePath }">
					</a>
				</div>	
				
				<div class="book-card-body ml-2">		
					<div class="">
						<h5>${book.title }</h5>
					</div>
					<div class="text-secondary">
						저자 : ${book.author } | 출판사 : ${book.publisher } | 발행년도 : ${book.pubyear }
					</div>
					<div class="">
					ISBN : ${book.isbn }
					</div>
					<div class="text-secondary">
						도서관 : 역삼도서관 | 부록 : ${book.appendix }
					</div>
					<div class="bg-info book-status text-secondary d-flex justify-content-between">
						<div class="">
							대출가능 도서 대출 불가 
						</div>
						<div class="mr-2">	
							<button class="btn btn-danger btn-sm reserveBtn"><i class="bi bi-journal-arrow-down"></i>도서 예약신청</button>
							<button class="btn btn-success btn-sm interibraryAddBtn"><i class="bi bi-shuffle"></i>상호대차 신청</button> 
							<button class="btn btn-primary btn-sm interestAddBtn"><i class="bi bi-download"></i>관심도서 담기</button>
						</div>
					</div>
				</div>
				
			</div>
			<hr>
			</c:forEach>
			
			
		</div>
		
		
		</div>
		
	
		
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script>
	$(document).ready(function(){
		
		 $("#searchBtn").on("click", function(){
	 			
	 			
	 		let search = $("#searchInput").val();
	 			
	 		if(search == ""){
	 			alert("검색어를 입력하세요.");
	 			return ;
	 		}
	 			
	 			
	 	});
	            
		
		
		var chkList = $("input[name = check]");
		 $("#allCheck").on("change", function() {
            // 내 자신이 체크 되었는지 안되었는지
            if($(this).is(":checked")) {
                $("input[name='check']").prop("checked", true);
            } else {
                $("input[name='check']").prop("checked", false);
            }
            
		  }); 
		 
         $(".reserveBtn").on("click", function(){
        	 
         });
         
         
         
         $(".interibraryAddBtn").on("click", function(){
        	 
         });
         
         
         
         $(".interestAddBtn").on("click", function(){
        	 let id = $("#")
         });
         
        
       
         
      
		
		
	});
	
	
	
	
	</script>
	
	
</body>
</html>