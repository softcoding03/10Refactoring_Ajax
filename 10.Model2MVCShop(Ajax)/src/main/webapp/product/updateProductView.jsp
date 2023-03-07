	<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
	<html>
	<head>
	<title>��ǰ ����</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
 	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	
		function fncUpdateProduct(){
			//Form ��ȿ�� ����
// 		 	var name = document.detailForm.prodName.value;
			var name = $("input[name='prodName']").val();
// 			var detail = document.detailForm.prodDetail.value;
			var detail = $("input[name='prodDetail']").val();
// 			var manuDate = document.detailForm.manuDate.value;
			var manuDate = $("input[name='manuDate']").val();
// 			var price = document.detailForm.price.value;
			var price = $("input[name='price']").val();
			
			if(name == null || name.length<1){
				alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(detail == null || detail.length<1){
				alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(manuDate == null || manuDate.length<1){
				alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(price == null || price.length<1){
				alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
		
			//document.detailForm.action='/updateProduct.do?prodNo=${product.prodNo}';
// 			document.detailForm.action='/product/updateProduct?prodNo=${product.prodNo}';
//			document.detailForm.submit(); 
			$("form").attr("method" ,"POST").attr("action" , "/product/updateProduct?prodNo=${product.prodNo}").attr("enctype", "multipart/form-data").submit();

			
		}
		
		function resetData(){
// 			document.detailForm.reset();
			$("form").reset();
		}
		
		$(function() {
			$( "td.ct_btn01:contains('����')" ).on("click" , function() {
				//Debug..
				alert( $( "td.ct_btn01:contains('����')" ).html() );
				fncUpdateProduct();
			});
			
			$( "td.ct_btn01:contains('���')" ).on("click" , function() {
				//Debug..
				alert(  $( "td.ct_btn01:contains('���')" ).html() );
				resetData();
			});
			
			$("#datepicker").datepicker({
				altField: "#datepicker" , altFormat: "yy-mm-dd",
				
				showButtonPanel: true,
				currentText: '���ó�¥',
				closeText: '�ݱ�',
				dateFormat:"yymmdd"
			
			});

		});
	
	</script>
	</head>
	
	<body bgcolor="#ffffff" text="#000000">
	
	<form name="detailForm">
	
	<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
		<tr>
			<td width="15" height="37">
				<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
			</td>
			<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="93%" class="ct_ttl01">��ǰ ����</td>
						<td width="20%" align="right">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td width="12" height="37">
				<img src="/images/ct_ttl_img03.gif"	width="12" height="37"/>
			</td>
		</tr>
	</table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">
				��ǰ�� <imgsrc="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="105">
							<input type="text" name="prodName" value="${product.prodName}" class="ct_input_g" 
										style="width: 100px; height: 19px" maxLength="20">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">
				��ǰ������ <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<input type="text" name="prodDetail" value="${product.prodDetail}" class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="10" minLength="6"/>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">
				�������� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<input type="text" name="manuDate" value="${product.manuDate}" id="datepicker" class="ct_input_g"  
							style="width: 100px; height: 19px"	maxLength="10" minLength="6"/>
<!-- 					&nbsp;<img src="../images/ct_icon_date.gif" width="15" height="15"  -->
<!-- 											onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"/> -->
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">
				���� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<input type="text" name="price" value="${product.price}" 	class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="10">&nbsp;��
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">��ǰ�̹���</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<input		type="file" name="file" class="ct_input_g" 
								style="width: 200px; height: 19px" maxLength="13"/>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
	</table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
		<tr>
			<td width="53%"></td>
			<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
<!-- 						<a href="javascript:fncUpdateProduct();">����</a> -->
							����
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;">
<!-- 						<a href="javascript:resetData();">���</a> -->
							���
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	
	</form>
	</body>
	</html>