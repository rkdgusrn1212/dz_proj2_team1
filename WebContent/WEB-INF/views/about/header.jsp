<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/bootstrap-icons.css">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/prism-okaidia.css">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/custom.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-lg">
			<a class="navbar-brand" href="#">TW</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor01"
				aria-controls="navbarColor01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarColor01">
				
                <form class="d-flex">
                    <input class="form-control me-sm-2" type="text"
                        placeholder="Search">
                    <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                </form>
                
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link active" href="#">Home
							<span class="visually-hidden">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">Features</a>
					</li>
					<li class="nav-item"><a class="nav-link active" href="#">Pricing</a>
					</li>
					<li class="nav-item"><a class="nav-link active" href="#">About</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
						href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a> <a
								class="dropdown-item" href="#">Something else here</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Separated link</a>
						</div></li>
				</ul>
               <ul class="navbar-nav">
                    <li class="nav-item"><a  class="nav-link" href="#">로그인</a></li>    
                </ul>
			</div>
		</div>
	</nav>

</body>
</html>