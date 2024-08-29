<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>

<style>
body {
  padding:0px;
  margin:0px;
  background: #f5f5f5
}

table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

th {
  text-align: left;
}
  
thead {
  font-weight: bold;
  color: #fff;
  background: #73685d;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

a {
  color: #73685d;
}
  
 @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  th {
    border-bottom: 1px solid #a39485;
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;
  }
  
  
  }



</style>

<body>
 
<sec:authorize access="isAuthenticated()" var="principal">
<sec:authentication property="principal" var="member" />
    
    <c:if test="${member.id == host.member.id}">
    <p>로그인한 사람 ${member.id}</p>
    <p>여기의 호스트 ${host.member.id}</p>
    <table>
    <thead>
    <tr>
       <th>아이디</th>
                    <th>이름</th>
                    <th>성별</th>
                    <th>나이</th>
                    <th>폰 번호</th>
                    <th>권한</th>    
                    <th>등급설정</th>

    </tr>
    </thead>
    <tbody>
     <!-- 데이터 행을 여기에 추가합니다 -->
                <c:forEach items="${allMember}" var="list" >
                <tr>
                    <td id="${list.member.id}" class="${list.membership.membershipCode}">${list.member.id}</td>
                    <td>${list.member.nickname}</td>
                    <td>${list.member.gender }</td>
                    <td>${list.member.age }</td>
                    <td>${list.member.phone }</td>
                    <td>${list.listGrade}</td>
                    
                    <c:if test="${list.listGrade != 'host'}"> 
                    <form id="id${list.member.id}" class="fom">            
                    <td>
                   
                    <input type="hidden" name="id" value="${list.member.id}">
                    <input type="hidden" name="membershipCode" value="${list.membership.membershipCode}">
                  
                     <button class="btn btn-primary btn-sm" name="listGrade" value="${list.member.id}" data-value="admin">관리자</button>
                    <button class="btn btn-dark btn-sm" name="listGrade" value="${list.member.id}" data-value="regular">일반회원</button>
                    <button class="btn btn-danger btn-sm" name="listGrade" value="${list.member.id}" data-value="delete">삭제</button>
                    </td>
                    </form>      
                    </c:if>
                    <c:if test="${list.listGrade == 'host'}">                   
                    <td>관리자</td>
                    </c:if>
                </tr>   
                </c:forEach>         
   
    </tbody>
</table>



 <script>
 
 $(document).ready(function() {
	 
     $('.fom').on('submit', function(e) {
         e.preventDefault();  // 폼의 기본 제출 동작을 방지합니다.
     });
 
$("button").click((e)=>{
	  var buttonText = $(e.target).attr("data-value");
	  var buttonValue = $(e.target).val();
     
 
      var formData = $("#id"+buttonValue).serialize(); 
      
      var resultData = formData + '&listGrade=' +buttonText;
      
     
      
      $.ajax({
    		url: "/gradeUpdate",
    		type: 'post',
    		data: resultData,
    		success: function(data) {
    			
    
    				location.href= "management?membershipCode=" +data;
    			
    			}
    						
    		
    	});	



});

 })
 

 </script>





</c:if>
</sec:authorize>
<sec:authorize access="!isAuthenticated()" var="principal">
<style>
#image{

    height: 100vh;
    width: 100%;
    background-image: url(http://192.168.10.51:8081/sungil/1901315….png);
    background-position: center;
    background-size: cover;
}

</style>
<div id="image" style="background-image: url('http://192.168.10.51:8081/sungil/1901315feaaf2919e248748e71f1a99d089cb7.png');">

</div>
</sec:authorize>

<sec:authorize access="isAuthenticated()" var="principal">
<sec:authentication property="principal" var="member" />

 <c:if test="${member.id != host.member.id}">

<style>
#image{

    height: 100vh;
    width: 100%;
    background-image: url(http://192.168.10.51:8081/sungil/1901315….png);
    background-position: center;
    background-size: cover;
}

</style>
<div id="image" style="background-image: url('http://192.168.10.51:8081/sungil/1901315feaaf2919e248748e71f1a99d089cb7.png');">



</c:if>



  </sec:authorize>
  
 
</body>
</html>