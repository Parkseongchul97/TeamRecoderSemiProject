 // 중복되는지 클럽명 체크 
 // 만약 중복된다면 취소
 
	 
	 let currentPage = 1;
	 const totalPages = 3;

	 function showPage(page) {
	     for (let i = 1; i <= totalPages; i++) {
	         document.getElementById(`page${i}`).style.display = (i === page) ? 'block' : 'none';
	     }
	 }

	 function nextPage(page) {
	     if (page < totalPages) {
	         currentPage++;
	         showPage(currentPage);
	     }
	 }

	 function prevPage(page) {
	     if (page > 1) {
	         currentPage--;
	         showPage(currentPage);
	     }
	 }

	 // 초기 페이지 설정
	 showPage(currentPage);