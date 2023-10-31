<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.productId.value==""){
		alert("상품코드를 입력하세요");
		document.form.productId.focus();
		return false;
	}
	if(document.form.name.value==""){
		alert("상품명을 입력하세요");
		document.form.name.focus();
		return false;
	}
	if(document.form.name.value.length<4||document.form.name.value.length>50){
		alert("[상품명]\n4~50자 사이를 입력하세요");
		document.form.name.focus();
		return false;
	}
	if(document.form.unitprice.value==""){
		alert("가격을 입력하세요");
		document.form.unitprice.focus();
		return false;
	}
	if(document.form.unitprice.value.length==0||isNaN(document.form.unitprice.value)){
		alert("[가격]\n숫자만 입력하세요");
		document.form.unitprice.focus();
		return false;
	}
	if(document.form.unitprice.value<0){
		alert("[가격]\n음수를 입력할 수 없습니다.");
		document.form.unitprice.focus();
		return false;
	}
	if(document.form.description.value==""){
		alert("상품 상세정보를 입력하세요");
		document.form.description.focus();
		return false;
	}
	if(document.form.manufacturer.value==""){
		alert("제조사를 입력하세요.");
		document.form.manufacturer.focus();
		return false;
	}
	if(document.form.unitsInstock.value==""){
		alert("재고수량을 입력하세요.");
		document.form.unitsInstock.focus();
		return false;
	}
	if(document.form.unitsInstock.value.length==0||isNaN(document.form.unitsInstock.value)){
		alert("[재고]\n숫자만 입력하세요");
		document.form.unitprice.focus();
		return false;
	}
	if(document.form.unitsInstock.value<0){
		alert("[재고]\n음수를 입력할 수 없습니다.");
		document.form.unitsInstock.focus();
		return false;
	}
	document.form.submit();
}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
		<h1 id=h1>상품 수정 화면</h1>
		<%@include file="dbconn.jsp" %>
		<%
			ResultSet rs=null;
			PreparedStatement pstmt=null;
			String productId=request.getParameter("productId");
			try{
				String sql="select * from product1011 where productId=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,productId);
				rs=pstmt.executeQuery();
				if (rs.next()){
					
					String name=rs.getString("name");
					String unitprice=rs.getString("unitprice");
					String description=rs.getString("description");
					String category=rs.getString("category");
					String manufacturer=rs.getString("manufacturer");
					String unitInstock=rs.getString("unitInstock");
					String condition=rs.getString("condition");
					
		%>
		<hr>
		<form name="form" method="post" action="productUpdateProccess.jsp">
			<table id="tab1" border=1>
				<tr>
					<th>상품코드</th>
					<td><input type="text" name="productId" id="in1" value=<%=productId%>></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="name" id="in1" value=<%=name%>></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="unitprice" id="in1" value=<%=unitprice%>></td>
				</tr>
				<tr>
					<th>상세정보</th>
					<td><input type="text" name="description" id="in1" value=<%=description%>></td>
				</tr>
				<tr>
					<th>제조사</th>
					<td><input type="text" name="manufacturer" id="in1" value=<%=manufacturer%>></td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
						<select name="category" id="in2">
							<option value="10" <%if(category.equals("10")){ %>selected<%} %>>it제품</option>
							<option value="20" <%if(category.equals("20")){ %>selected<%} %>>주방제품</option>
							<option value="30" <%if(category.equals("30")){ %>selected<%} %>>전자제품</option>
							<option value="40" <%if(category.equals("40")){ %>selected<%} %>>일반잡화</option>
						</select>
					</td>
				</tr>				
				<tr>
					<th>재고수량</th>
					<td>
						<input type="text" name="unitInstock" id="in1" value=<%=unitInstock%>>
					</td>
				</tr>
				<tr>
					<th>상태</th>
					<td>
						<input type="radio" name="condition" value="신규" <%=condition.equals("신규")? "checked":"" %>>신규 제품
						<input type="radio" name="condition" value="중고" <%=condition.equals("중고")? "checked":"" %>>중고 제품
						<input type="radio" name="condition" value="재생" <%=condition.equals("재생")? "checked":"" %>>재생 제품
					</td>
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input id="btn1" type="button" value="수정" onclick="check()">
						<input id="btn1" type="reset" value="취소">	
					</td>
				</tr>
				<%
					}
				}catch(SQLException e){
					e.printStackTrace();
					System.out.println("읽기 에러 : "+e.getMessage());
			}
			%>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>