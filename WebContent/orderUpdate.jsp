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
		form.action="orderUpdateProcess.jsp"
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
 	String orderDate=request.getParameter("orderDate");
 	String orderName=request.getParameter("orderName");
 	int Qty=0;
 	if(request.getParameter("orderQty")==null){
 		Qty=0;
 	}else{
 		Qty=Integer.parseInt(request.getParameter("orderQty"));
 	} 	
 	
 	try{
 		String sql="select to_char(orderDate,'yyyy-mm-dd'), orderName, a.productId, a.unitprice, orderQty ,orderAddress, b.name from order1011 a,product1011 b where orderDate=? and orderName=? and a.productId=b.productId";
 		pstmt=conn.prepareStatement(sql);
 		pstmt.setString(1, orderDate);
 		pstmt.setString(2, orderName);
 		rs=pstmt.executeQuery();
 		int total=0;
 		if(rs.next()){
 			String oDate=rs.getString(1);
 			String productId=rs.getString(3);
 			int unitprice=rs.getInt(4);
 			int orderQty=rs.getInt("orderQty");
 			int bQty=0;
 			System.out.println("Qty: "+Qty+" orderQty : "+orderQty+" bQty :"+bQty);
 			if(Qty==orderQty){
 				orderQty=bQty;
 			}else{
 				if(Qty==orderQty){
 					bQty=orderQty;
 				}else{
 					bQty=Qty;
 				}
 			}
 			String orderAddress=rs.getString("orderAddress");
 			String name=rs.getString(7);
 			total=unitprice*bQty;
 %>
 
 <section>
 	<h1>주문 정보 수정</h1>
 	<hr>
 	<form name="form" method="post" action="orderUpdate.jsp">
 		<table id="tab1" border=1>
 			<tr>
 				<th width="20%">주문일자</th>
 				<td>
 					<input type="text" name="orderDate" id="in4" value="<%=oDate %>">
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
 					<input type="text" name="orderQty" id="in4" value="<%=bQty %>" onchange="changesubmit();">
 				</td>
 			</tr>
 			<tr>
 				<th width="20%">주문금액</th>
 				<td>
 					<input type="text" name="orderPrice" id="in4" value="<%=total %>">
 				</td>
 				<th width="20%">주문 주소</th>
 				<td>
 					<input type="text" name="address" id="in4" value="<%=orderAddress %>">
 				</td>
 			</tr>
 			<tr>
				<td colspan=4 align=center>
					<input id="btn1" type="button" value="목록" onclick="history.back(); return false">
					<input id="btn1" type="submit" value="저장" onclick="check()">	
				</td>
			</tr>
 		</table>
 		<%
 			}
 		}catch(SQLException e){
 			System.out.println("읽기 실패: "+e.getMessage());
 		}
 	
 		%>
 	</form>
 </section>
 <%@ include file="footer.jsp" %>
</body>
</html>