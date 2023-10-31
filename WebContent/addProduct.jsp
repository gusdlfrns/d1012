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
		<h1 id=h1>상품 등록 화면</h1>
		<hr>
		<form name="form" method="post" action="productProccess.jsp">
			<table id="tab1" border=1>
				<tr>
					<th>상품코드</th>
					<td><input type="text" name="productId" id="in1"></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="name" id="in1"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="unitprice" id="in1"></td>
				</tr>
				<tr>
					<th>상세정보</th>
					<td><input type="text" name="description" id="in1"></td>
				</tr>
				<tr>
					<th>제조사</th>
					<td><input type="text" name="manufacturer" id="in1"></td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
						<select name="category" id="in2">
							<option value="10" selected>it제품</option>
							<option value="20">주방제품</option>
							<option value="30">전자제품</option>
							<option value="40">일반잡화</option>
						</select>
					</td>
				</tr>				
				<tr>
					<th>재고수량</th>
					<td>
						<input type="text" name="unitsInstock" id="in1">
					</td>
				</tr>
				<tr>
					<th>상태</th>
					<td>
						<input type="radio" name="condition" value="신규">신규 제품
						<input type="radio" name="condition" value="중고">중고 제품
						<input type="radio" name="condition" value="재생">재생 제품
					</td>
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input id="btn1" type="button" value="등록" onclick="check()">
						<input id="btn1" type="reset" value="취소">	
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>