<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head><title>Login Page</title></head><body onload='document.f.username.focus();'>
<h3>Login with Username and Password</h3>
<form name='f' action='/login' method='POST'>
	<table>
		<tr><td>User:</td><td><input type='text' name='username' value=''></td></tr>
		<tr><td>Password:</td><td><input type='password' name='password'/></td></tr>
		<tr><td colspan='2'><input name="submit" type="submit" value="Login"/></td></tr>
		<input name="_csrf" type="hidden" value="24f70b32-45d2-402d-856f-3da2c3085dd0" />
	</table>
</form></body></html>