<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 관리자 희망도서/도서 추가 </title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
		
		<div class="mybookinfo-page">
		
		<div class="sub-profile bg-secondary">
			<c:import url="/WEB-INF/jsp/include/subprofile.jsp"/>
			
			<div class="sub-text bg-info">
				<h2 class="text-center text-white mt-3"><b>관리자 희망도서/도서 추가</b></h2>
			</div>
		</div>
		
		<div class="d-flex">
		<c:import url="/WEB-INF/jsp/include/sidenav.jsp"/>
		
		<div class="col-9 bg-info">
		
			<div class="">
				<div class="mt-3 d-flex bg-danger">
						희망도서 신청현황 :&nbsp<div class="text-primary"> 1 </div>건
				</div>
							
						<hr>
						<div class="bg-primary">
							
						
							<div class="">
								<h5>신입사원 제대로 미쳐라.</h5>
							</div>
							<div class="">
								저자 : xx | 출판사 : xx | ISBN : xxxxxxxxxxxx 
							</div>
							<div class="">
								도서관 : 역삼푸른솔도서관
							</div>
							<div class="">
								상태 : 소장중 or 신청중
							</div>
						</div>
						<hr>
			
			</div>
			
			
			<div class="text-center">
				<a href="/book/wishbook/add/view?id=${userId }" class="btn btn-primary	">희망도서/도서 추가하기</a>
			</div>
		
		
		</div>
		
		
		</div>
		
		
		
		</div>
		
		
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script>
	
	
	</script>
</body>
</html>