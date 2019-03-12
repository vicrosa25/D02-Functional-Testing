<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<form:form action="chapter/area/assign.do" modelAttribute="chapter">
	
	
	<!-- Select Area -->
	<acme:select items="${areas}" itemLabel="name" code="chapter.area" path="area"/>
	<br>
	
	<%-- Buttons --%>
	<input type="submit" name="save" value="<spring:message code="chapter.save"/>" />
	<acme:cancel code="chapter.cancel" url="/" />
</form:form>



