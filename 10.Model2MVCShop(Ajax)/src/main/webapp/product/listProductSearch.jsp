	<%@ page language="java" contentType="text/html; charset=EUC-KR"
	    pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
	<html>
	<head>
	<title>��ǰ �����ȸ</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
		function fncGetProductList(currentPage){
	// 		document.getElementById("currentPage").value = currentPage;
			$("#currentPage").val(currentPage)
	// 		document.detailForm.submit();
			$("form").attr("method" ,"POST").attr("action" , "/product/listProduct?menu=search").submit();
		}
		
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			$( "td.ct_btn01:contains('�˻�')" ).on("click" ,function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('Ȯ��')" ).html() );
				 	fncGetProductList('1');
			});
			
			$( ".ct_list_pop td:nth-child(3)" ).on("click" ,function() {
					//Debug..
					alert($(this).find("input").val().trim());
	//					alert($("#prodNo").val().trim());
					self.location ="/product/getProduct?prodNo="+$(this).find("input").val().trim();
			});
			
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
		
		
	</script>
	</head>
	
	<body bgcolor="#ffffff" text="#000000">
	
	<div style="width:98%; margin-left:10px;">
	
	<form name="detailForm" >
	<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
		<tr>
			<td width="15" height="37">
				<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
			</td>
			<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="93%" class="ct_ttl01">
						
								��ǰ �����ȸ
						
						</td>
					</tr>
				</table>
			</td>
			<td width="12" height="37">
				<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
			</td>
		</tr>
	</table>
	
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td align="right">
				<select name="searchCondition" class="ct_input_g" style="width:80px">
				
					<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
					<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
					<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>	
				</select>
				<input type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ""}"   class="ct_input_g" style="width:200px; height:19px" />
			</td>
			
			<td align="right" width="70">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="17" height="23">
							<img src="/images/ct_btnbg01.gif" width="17" height="23">
						</td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
<!-- 							<a href="javascript:fncGetProductList('1');">�˻�</a> -->
							�˻�
						</td>
						<td width="14" height="23">
							<img src="/images/ct_btnbg03.gif" width="14" height="23">
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td colspan="11" >
			��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������
			</td>
		</tr>
		<tr>
			<td class="ct_list_b" width="100">No</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="150">
			��ǰ��<br>
			<h7 >(�Ǹ����� ��ǰ���� Ŭ���� �󼼺���)</h7>
			</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="150">����</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">�����</td>	
			<td class="ct_line02"></td>
			<td class="ct_list_b">�������</td>	
		</tr>
		<tr>
			<td colspan="11" bgcolor="808285" height="1"></td>
		</tr>
	
		<c:set var="i" value="0" />
		<c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			
			<tr class="ct_list_pop">
				<td align="center">${ i }</td>
				<td></td>
					<td align="left">
					
						<c:choose>
						
							<c:when test="${user.userId == 'admin'}">
								${product.prodName}
							</c:when>
							
							<c:otherwise>
								<c:if test="${product.proTranCode != '0' }">
									${product.prodName}
								</c:if>
								
								<c:if test="${product.proTranCode == '0'}">
<%-- 									<a href="/product/getProduct?prodNo=${product.prodNo}"> --%>
									${product.prodName}
									<input type="hidden" id="prodNo" value="${product.prodNo}"/>
								</c:if>
							</c:otherwise>
							
						</c:choose>
					
					
					</td>
				<td></td>
				<td align="left">${product.price}</td>
				<td></td>
				<td align="left">${product.regDate}</td>		
				<td></td>
				<td align="left">
				<c:if test="${product.proTranCode == '0'}">
					�Ǹ���
				</c:if>
				<c:if test="${product.proTranCode != '0'}">
					�ǸſϷ�
				</c:if>
				</td>	
			</tr>
			<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
			</tr>
			
		</c:forEach>
	</table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
	
	    			<c:import var="page" url="../common/pageNavigator.jsp">
	    				<c:param name="name" value="product"/>
	    			</c:import>
	    			${page}
	    	</td>
		</tr>
	</table>
	<!--  ������ Navigator �� -->
	
	</form>
	
	</div>
	</body>
	</html>
