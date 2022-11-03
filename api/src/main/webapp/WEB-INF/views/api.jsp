<%@page import="com.cafe24.kjh.User_DTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<User_DTO> user = (List<User_DTO>)request.getAttribute("user")==null?null:(List<User_DTO>)request.getAttribute("user");
int size = user.size();
int w = 0;

String id = request.getParameter("id")==null?"":request.getParameter("id");
String name = request.getParameter("name")==null?"":request.getParameter("name");


%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 API</title>
</head>
<body>


<p>회원정보 API</p>
<form name="f" enctype="application/x-www-form-urlencoded">
<table style="border: 1px solid #444444;">
<thead>
<tr>
<th>id</th>
<th>이름</th>
<th><input type="button" value="전체 조회" onclick="selall()"></th>
</tr>
</thead>
<tbody>
	<tr>
	<td colspan="3">----------------------------------------------------------------</td>
	</tr>
	<tr>
      <td><input type="text" name="id1" value="<%=id%>" placeholder="ID를 입력하세요"></td>
      <td><input type="text" name="nm1" value="<%=name%>" placeholder="이름을 입력하세요"></td>
      <td><input type="button" value="조회" onclick="sel1();"></td>
    </tr>

	<tr>
      <td><input type="text" name="id" value="" placeholder="ID를 입력하세요"></td>
      <td><input type="text" name="name" value="" placeholder="이름을 입력하세요"></td>
      <td><input type="button" value="등록" onclick="registration()"></td>
    </tr>
    
    <% while(w<size){%>
    <!-- 반복분 시작 -->
    <tr>
      <td><%=user.get(w).getId()%></td>
      <td><%=user.get(w).getName()%></td>
      <td><input type="button" value="삭제" onclick="del1('<%=user.get(w).getId()%>');"></td>
    </tr>
    <!-- 반복문 끝 -->
    <% w++;}%>
    
    <%if(size==0){%>
    
    <!-- 등록된 사용자가 없을 때 출력 -->
    <tr>
      <td>등록된 사용자가 없습니다.</td>
    </tr>
    
    <%}; %>
    
    
      
 </tbody>
</table>
</form>
<script>

function del1(id){
	
	 var aj;
     function wck(){
        if(window.XMLHttpRequest){
    	       return new XMLHttpRequest();
     	  }
     }
     function acall(){
        if(aj.readyState == XMLHttpRequest.DONE && aj.status==200){   
           
        	alert("삭제완료");
        	location.reload();
     
        }
     }
    
     var gopage = "./api2?id="+id;
     aj = wck();
     aj.onreadystatechange = acall;
     aj.open("get",gopage,true);
     aj.send();
	
	
}

function registration(){
	
	var aj;
    function wck(){
       if(window.XMLHttpRequest){
   	       return new XMLHttpRequest();
    	  }
    }
    function acall(){
       if(aj.readyState == XMLHttpRequest.DONE && aj.status==200){   
          
       	alert("등록완료");
       	location.reload();
       }
    }
   
    var gopage = "./api3?id="+f.id.value+"&name="+f.name.value;
    aj = wck();
    aj.onreadystatechange = acall;
    aj.open("get",gopage,true);
    aj.send();
	
	
}


function selall(){
	location.href="./api1";
	
}

function sel1(){
	location.href="./api1?id="+f.id1.value+"&name="+f.nm1.value;
	
}

</script>

</body>
</html>