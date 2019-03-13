<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<display:table name="parades" id="row" requestURI="${uri}" pagesize="5" class="displaytag">

	<!-- title -->
	<spring:message code="procession.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" />

	<!-- ticker -->
	<spring:message code="procession.ticker" var="tickerHeader" />
	<display:column property="ticker" title="${tickerHeader}" />

	<!-- description -->
	<spring:message code="procession.description" var="descriptionHeader" />
	<display:column property="description" title="${ descriptionHeader }" />

	<!-- moment -->
	<spring:message code="procession.moment" var="momentHeader" />
	<display:column property="moment" title="${momentHeader}" format="{0,date,dd/MM/yyyy}" />

	<!-- brotherhood -->
	<spring:message code="procession.brotherhood" var="brotherhoodHeader" />
	<display:column property="brotherhood.title" title="${brotherhoodHeader}" />
	
	<!-- status -->
	<spring:message code="procession.status" var="statusHeader" />
	<display:column property="status" title="${statusHeader}" />
	
	
	<!-- manage status -->
	<jstl:if test="${ row.status == 'SUBMITTED' }">
		<display:column>
			<a href="chapter/parade/aprove.do?processionId=${row.id}"><spring:message code="chapter.parade.accept" /></a>
		</display:column>
		<display:column>
			<a href="chapter/parade/reject.do?processionId=${row.id}"><spring:message code="chapter.parade.reject" /></a>
		</display:column>
	</jstl:if>
	
</display:table>
