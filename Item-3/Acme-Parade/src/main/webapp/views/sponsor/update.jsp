<%--
 * action-2.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<form:form action="sponsor/update.do" modelAttribute="sponsor">
	
	<%-- Hidden properties from actor--%>
	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="userAccount.Authorities" />
	<form:hidden path="userAccount" />
	<form:hidden path="username" />
	<form:hidden path="messageBoxes" />
	<form:hidden path="isSuspicious" />
	<form:hidden path="sponsorships" />
	<form:hidden path="socialIdentities" />
	

	<%-- Name --%>
	<form:label path="name">
		<spring:message code="handyWorker.name" />
	</form:label>
	<form:input path="name" />	
	<form:errors class="error" path="name" />
	<br><br>
	
	<%-- Middlename --%>
	<form:label path="middleName">
		<spring:message code="handyWorker.middleName" />
	</form:label>
	<form:input path="middleName" />	
	<form:errors class="error" path="middleName" />
	<br><br>
	
	<%-- Surname --%>
	<form:label path="surname">
		<spring:message code="handyWorker.surname" />
	</form:label>
	<form:input path="surname" />	
	<form:errors class="error" path="surname" />
	<br><br>
	
	
	<%-- Photo --%>
	<form:label path="photo">
		<spring:message code="handyWorker.photo" />
	</form:label>
	<form:input path="photo" />	
	<form:errors class="error" path="photo" />
	<br><br>
	
	<%-- Phone --%>
	<form:label path="phoneNumber">
		<spring:message code="handyWorker.phone" />
	</form:label>
	<form:input path="phoneNumber" />	
	<form:errors class="error" path="phoneNumber" />
	<br><br>
	
	<%-- email --%>
	<form:label path="email">
		<spring:message code="handyWorker.email" />
	</form:label>
	<form:input path="email" />	
	<form:errors class="error" path="email" />
	<br><br>
	
	<%-- Address --%>
	<form:label path="address">
		<spring:message code="handyWorker.address" />
	</form:label>
	<form:input path="address" />	
	<form:errors class="error" path="address" />
	<br><br>
	
	<script type="text/javascript">
		function phoneNumberValidator() {

			var phoneNumber = document.getElementById("phoneNumber").value;

			var patternCCACPN = /^(\+[1-9][0-9]{0,2}) (\([1-9][0-9]{0,2}\)) (\d{3}\d+)/
			$;
			var patternCCPN = /^(\+[1-9][0-9]{0,2}) (\d{3}\d+)/
			$;
			var patternPN = /^(\d{3}\d+)/
			$;

			if (patternCCACPN.test(phoneNumber))
				return true;
			else if (patternCCPN.test(phoneNumber))
				return true;
			else if (patternPN.test(phoneNumber))
				return true;
			else
				return confirm('<spring:message code="handyWorker.confirm"/>');
		}
	</script>
	
	<%-- Buttons --%>
	<security:authorize access="hasRole('SPONSOR')">
		<input type="submit" name="save" value="<spring:message code="handyWorker.save"/>"
		onClick="javascript: return phoneNumberValidator()" />
			
		<input type="button" name="cancel"
			value="<spring:message code="handyWorker.cancel" />"
			onClick="javascript: window.location.replace('/Acme-Handy-Worker/')" />
	</security:authorize>
	<br><br>
</form:form>