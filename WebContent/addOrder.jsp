<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function changesubmit(){
		document.form.submit();
	}
	function check(){
		if(!document.form.orderDate.value || document.form.orderDate.value==""){
			alert("주문일자를 입력하세요.");
			document.form.orderDate.focus();
			return false;
		}
		if(!document.form.orderName.value || document.form.orderName.value==""){
			alert("주문자명을 입력하세요.");
			document.form.orderName.focus();
			return false;
		}
		if(!document.form.productId.value || document.form.productId.value==""){
			alert("상품코드를 입력하세요.");
			document.form.productId.focus();
			return false;
		}
		if(!document.form.orderQty.value || document.form.orderQty.value==""){
			alert("주문일자를 입력하세요.");
			document.form.orderQty.focus();
			return false;
		}
		if(!document.form.address.value || document.form.address.value==""){
			alert("주소를 입력하세요.");
			document.form.address.focus();
			return false;
		}
		form.action="orderProcess.jsp"
	}
</script>
</head>
<body>
 <%@include file="header.jsp" %>
 <%@include file="nav.jsp" %>
 <%@include file="dbconn.jsp" %>
 <%
 	request.setCharacterEncoding("utf-8");
 	ResultSet rs=null;
 	PreparedStatement pstmt=null;
 	String productId=request.getParameter("productId");
 	String unit=request.getParameter("unitprice");
 	String orderQty=request.getParameter("orderQty");
 	String orderDate=request.getParameter("orderDate");
 	String orderName=request.getParameter("orderName");
 	String address=request.getParameter("address");
 	
 	if(orderDate==null){
 		orderDate="";
 	}
 	if(orderName==null){
 		orderName="";
 	}
 	if(address==null){
 		address="";
 	}

 	String name="";
 	int unitprice=0;
 	int oQty=0;
 	int total=0;
 	int stock=0;
 	if(orderQty ==null){
 		orderQty="0";
 	}
 	oQty=Integer.parseInt(orderQty);
 	if(productId!=null){
 	try{
 		String sql="select name,unitprice from product1011 where productId=?";
 		pstmt=conn.prepareStatement(sql);
 		pstmt.setString(1,productId);
 		rs=pstmt.executeQuery();
 		if(rs.next()){
 			name=rs.getString("name");
 			unitprice=rs.getInt(2);
 			total=oQty*unitprice;
 			rs.getInt(3);
 			if(oQty>stock){
 				%>
 					<script>
 						alert("주문수량이 재고수량보다 많습니다.");
 						history.back(-1);
 					</script>
 				<%
 			}
 		}else{
 			%>
 			<script>
 			alert("등록되지 않은 상품입니다.");
 			history.back(-1);
 			</script>
 			<%
 		}
 	}catch(SQLException e){
 		System.out.println("읽기 오류 : "+e.getMessage());
 	}
 	}else{
 		productId="";
 	}
 	
 %>
 
 <section>
 	<h1>주문 정보 등록</h1>
 	<hr>
 	<form name="form" method="post" action="addOrder.jsp">
 		<table id="tab1" border=1>
 			<tr>
 				<th width="20%">주문일자</th>
 				<td>
 					<input type="text" name="orderDate" id="in4" value="<%=orderDate %>">
 				</td>
 				<th width="20%">주문자 이름</th>
 				<td>
 					<input type="text" name="orderName" id="in4" value="<%=orderName %>">
 				</td>
 			</tr>
 			<tr>
 				<th width="20%">상품코드</th>
 				<td>
 					<input type="text" name="productId" value="<%=productId %>" id="in4" onchange="changesubmit()">
 				</td>
 				<th width="20%">상품명</th>
 				<td>
 					<input type="text" name="productName" id="in4" value="<%=name%>">
 				</td>
 			</tr>
 			<tr>
 				<th width="20%">단가</th>
 				<td>
 					<input type="text" name="unitprice" id="in4" value="<%=unitprice%>">
 				</td>
 				<th width="20%">주문수량</th>
 				<td>
 					<input type="text" name="orderQty" id="in4" value="<%=orderQty %>" onchange="changesubmit();">
 				</td>
 			</tr>
 			<tr>
 				<th width="20%">주문금액</th>
 				<td>
 					<input type="text" name="orderPrice" id="in4" value="<%=total %>">
 				</td>
 				<th width="20%">주문 주소</th>
 				<td>
 					<input type="text" name="address" id="in4" value="<%=address %>">
 				</td>
 			</tr>
 			<tr>
				<td colspan=4 align=center>
					<input id="btn1" type="button" value="목록" onclick="history.back(); return false">
					<input id="btn1" type="submit" value="저장" onclick="check()">	
				</td>
			</tr>
 		</table>
 	</form>
 </section>
 <%@ include file="footer.jsp" %>
</body>
</html>