<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
	<meta charset="UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>

	<title>Blog AW</title>

	<link rel="stylesheet" type="text/css" href="<c:url value="/layout/stylesheets/vendors.min.css"/>"></link>
	<link rel="stylesheet" type="text/css" href="<c:url value="/layout/stylesheets/algaworks.min.css"/>"></link>
	<link rel="stylesheet" type="text/css" href="<c:url value="/layout/stylesheets/application.css"/>"></link>

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>

<div class="aw-layout-loading  js-loading-overlay">
	<div class="aw-layout-loading__container">
		<span class="aw-balls-spinner">Carregando...</span>
	</div>
</div>

<div class="aw-layout-page">

	<jsp:include page="../layout/template/navigation.jsp" flush="true">
		<jsp:param name="title" value="DashBoard"/>
	</jsp:include>
	
	<jsp:include page="../layout/template/menu.jsp" flush="true">
		<jsp:param name="title" value="Usuários"/>
	</jsp:include>

	<section class="aw-layout-content  js-content">


		<div class="page-header">
		  <div class="container-fluid">
		    <h1>
		      Usuarios 01
		    </h1>
		  </div>
		</div>
	
		<div class="container-fluid">
		<div class="table-responsive">
			<form id="form" action="<c:url value="/user"/>" method="post">
				<table id="tabela-produtos" class="table  table-striped  table-bordered  table-hover  table-condensed  js-sticky-table">
					<thead class="aw-table-header-solid">
						<tr>
							<th class="aw-table-checkbox">
								<input type="checkbox">
							</th>
							<th>#</th>
							<th>Nome Completo</th>
							<th>Username</th>
							<th>Password</th>
							<th class="table-pesq-produto-col-acoes">Data Cadastro</th>
							<th class="table-pesq-produto-col-acoes">Ações</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${users}">
						<tr>
							<td class="aw-table-checkbox"><input type="checkbox"></td>
							<td>${user.id}</td>
							<td>${user.fullName}</td>
							<td>${user.username}</td>
							<td>${user.password}</td>
							<td class="table-pesq-produto-col-acoes"><fmt:formatDate pattern="dd/MM/yyyy" value="${user.createdAt}"/></td>
							<td class="table-pesq-produto-col-acoes">
							
								<div class="btn-group">
									<button class="btn  btn-default btn-xs" onclick="$('#form').attr('action', '<c:url value="/user/edit"/>?id=${user.id}')">
										<i class="fa  fa-pencil"></i>
									</button>
									
									<button type="submit" class="btn  btn-default btn-xs" onclick="$('#form').attr('action', '<c:url value="/user/delete"/>?id=${user.id}')">
										<i class="fa  fa-trash"></i>
									</button>
									
								</div>
								
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>

	</section>
	
	<footer class="aw-layout-footer  js-content">
		<div class="container-fluid">
			<span class="aw-footer-disclaimer">Blog AW.</span>
		</div>
	</footer>

</div>

<div class="aw-search-modal  js-search-modal">
	<form action="#" class="aw-search-modal__form">
		<input class="aw-search-modal__input  js-search-modal-input" type="text" placeholder="O que você está procurando?"/>
		<div class="aw-search-modal__input-icon">
			<i class="glyphicon  glyphicon-search  js-search-modal-go"></i>
		</div>
	</form>
	
	<div class="aw-search-modal__controls">
		<i class="glyphicon glyphicon-remove  js-search-modal-close"></i>
	</div>
</div>

<script src="<c:url value="/layout/javascripts/vendors.min.js"/>"></script>
<script src="<c:url value="/layout/javascripts/algaworks.min.js"/>"></script>

</body>
</html>