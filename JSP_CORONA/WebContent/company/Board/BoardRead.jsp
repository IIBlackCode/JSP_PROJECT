<%@page import="com.company.board.DTO.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% Board board = (Board)request.getAttribute("board"); %>
<!DOCTYPE HTML>
<html>
<head>
<title>Generic Page - Industrious by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">

	<!-- HEADER -->
	<%@include file="/company/include/header.jsp"%>

	<!-- Nav -->
	<%@include file="/company/include/nav.jsp"%>

	<!-- Heading -->
	<div id="heading">
		<h1>CORONA COMUNITY</h1>
	</div>
	
	<!-- Main -->
	<section id="main" class="wrapper">
		<div class="inner">
			<div class="content">
				<header>
					<h1>CORONA COMUNITY</h1>
				</header>
				
				<!-- CONTENT -->
				<div class="container">
					<div class="">
						<table class="" style="text-align:center; border:1px solid #dddddd">
							<thead>
								<tr>
									<th>JSP PROJECT OF KMS COMPANY</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>[<%=board.getBoard_id()%>] <%=board.getBoard_title()%></td>
								</tr>
								<tr>
									<td><p><%=board.getBoard_content()%><p></td>
								</tr>
							</tbody>
						</table>
						
						<!-- COMMENT -->
						<div class="table-wrapper">
							<table  class="alt">
								<thead>
									<tr>
										<th>Name</th>
										<th> - Content - </th>
										<th>Date</th>
									</tr>
								</thead>								
								<%for (int i = 0; i < 5; i++) {%>
								<tr>
									<td style="width: 150px;">
										아이디<br>
										<sub>2021-03-17</sub>
										
									</td>
									<td>
										<p style="margin: 0 0 0 0;">댓글 내용 TEST MessageTEST MessageTEST MessageTEST MessageTEST MessageTEST MessageTEST MessageTEST MessageTEST Message</p>
										<!-- <h5 style="margin: 0 0 0 0;">댓글 시간</h5> -->
									</td>
									<td style="width: 100px;">
										<a href="BoardUpdate?Board_id=<%=board.getBoard_id()%>" class="button fit small">수정</a>
										<a href="BoardDelete?Board_id=<%=board.getBoard_id()%>" class="button fit small">삭제</a>
									</td>
								</tr>
								<%}%>
							</table>
						</div>
							<form action="BoardWrite" method="post">
								<thead>
									<tr>작성자 : <%= board.getMember_id() %></tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<textarea placeholder="댓글 내용" name="board_content" maxlength="2048" style="height: 100px;"></textarea>
										</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td>
										<input type="submit" class="button fit small" value="댓글 남기기">
										</td>
									</tr>
								</tfoot>
							</form>
							
						<%if(member != null){ %>
						<%if(member.getMember_id().equals(board.getMember_id())){%>
							<a href="BoardUpdate?Board_id=<%=board.getBoard_id()%>" class="button primary">수정</a>
							<a href="BoardDelete?Board_id=<%=board.getBoard_id()%>" class="button primary">삭제</a>
						<%}else if(member.getMember_rank().equals("관리자")){ %>
							<a href="BoardUpdate?Board_id=<%=board.getBoard_id()%>" class="button">관리자 권한 수정</a>
							<a href="BoardDelete?Board_id=<%=board.getBoard_id()%>" class="button">관리자 권한 삭제</a>
						<%	}%>
						<%}	%>
					</div>
				</div>
				<!-- The end of Content -->
				
			</div>
		</div>
	</section>
	<!-- The end of Main -->
	
	<!-- FOOTER -->
	<%@include file="/company/include/footer.jsp"%>
	<!-- SCRIPT -->
	<%@include file="/company/include/script.jsp"%>



</body>
</html>