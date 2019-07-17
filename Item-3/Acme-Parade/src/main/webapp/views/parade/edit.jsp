<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="parade/brotherhood/edit.do" modelAttribute="parade">

	<%-- Hidden properties from handy worker--%>
	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="ticker" />
	<form:hidden path="status" />



	<%-- Title --%>
	<acme:textbox code="parade.title" path="title" />
	<br>

	<%-- description --%>
	<acme:textbox code="parade.description" path="description" />
	<br>

	<%-- moment --%>
	<form:label path="moment"><spring:message code="parade.moment" /></form:label>
	<form:input path="moment" placeholder="dd/mm/yyyy" format="{0,date,dd/MM/yyyy HH:mm}" />	
	<form:errors class="error" path="moment" />
	<br><br>

	<%-- draftMode --%>
	<form:label path="draftMode"><spring:message code="parade.draftMode" /></form:label>
	<form:select id="modeDropdown" path="draftMode">
		<form:option value="">--</form:option>
		<form:option value="0"><spring:message code="parade.true" /></form:option>
		<form:option value="1"><spring:message code="parade.false" /></form:option>
	</form:select>
	<form:errors class="error" path="draftMode" />
	<br>
	<br>


	<%-- Buttons --%>
	<input type="submit" name="save" value="<spring:message code="parade.save"/>" />
	<acme:cancel code="parade.cancel" url="parade/list.do" />
	
</form:form>