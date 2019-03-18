<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<form:form action="sponsorship/sponsor/edit.do" modelAttribute="sponsorship">
	
	<%-- Hidden properties from sponsorship--%>
	<form:hidden path="id" />
	<form:hidden path="version" />

	<%-- banner--%>
	<acme:textbox code="sponsorship.banner" path="banner" />
	<br>
	
	<%-- targetPage--%>
	<acme:textbox code="sponsorship.targetPage" path="targetPage" />
	<br>

							<%-- CREDIT CARD --%>

	<%-- holderName--%>
	<acme:textbox code="sponsorship.holderName" path="creditCard.holderName" />
	<br>

	<%-- brandName--%>
	<acme:textbox code="sponsorship.brandName" path="creditCard.brandName" />
	<br>

	<%-- number--%>
	<acme:textbox code="sponsorship.number" path="creditCard.number" />
	<br>

	<%-- expiration--%>
	<form:label path="expiration"><spring:message code="sponsorship.expiration" /></form:label>
	<form:input path="expiration" placeholder="mm/yy" format="{0,date,MM/yy}" />	
	<form:errors class="error" path="expiration" />
	<br><br>

	<%-- cvvCode--%>
	<acme:numberbox code="sponsorship.cvvCode" path="creditCard.cvvCode" />
	<br>
	
	<input type="submit" name="save" value="<spring:message code="sponsorship.save"/>" />	
	<acme:cancel code="sponsorship.cancel" url="/sponsorship/sponsor/list.do" />
</form:form>