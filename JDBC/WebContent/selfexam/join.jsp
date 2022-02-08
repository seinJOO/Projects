<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.center {
		position: absolute;
		top: 50%;
		left : 50%;
		transform : translate(-50%, -50%);
	}
	body {background-color : #E6E6E6}
	input {background-color : #E6E6E6}

</style>
</head>
<body class="text-center" bgcolor='#E6E6E6'>
<div class = "container center" style="width:400px">
<main class="form-signin">
  <form action="join_ok" method="post">
    <img class="mb-4" src="/docs/5.1/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">Please sign up !</h1>

 	<div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" name="id" placeholder="ID">
      <label for="floatingInput">ID</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" name="pw" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" name="name" placeholder="ID">
      <label for="floatingInput">Full Name</label>
    </div>
    <div class="input-group">
    	<div class="input-group-addon">
      	<select class="form-select" id="floatingInput" name="phone1" aria-label="Default select example">
  		<option selected>Phone</option>
  		<option value="010">010</option>
  		<option value="011">011</option>
  		<option value="018">018</option>
		</select>
		</div>
		<div class="input-group-addon">
		<input type="text" class="form-control" id="floatingInput" name="phone2" placeholder="Phone number">
   		</div>
    </div>
    
    <div class="form-floating">
      <input type="email" class="form-control" id="floatingInput" name = "email" placeholder="name@example.com">
      <label for="floatingInput">Email address</label>
    </div>
	
	
    <div class="form-check form-check-inline">
 	<input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="m">
  	<label class="form-check-label" for="inlineRadio1">남성</label>
	</div>
	<div class="form-check form-check-inline">
  	<input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="f">
  	<label class="form-check-label" for="inlineRadio2">여성</label>
	</div>
    

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
  </form>
</main>
</div>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 