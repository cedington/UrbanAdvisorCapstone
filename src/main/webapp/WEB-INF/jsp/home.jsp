<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h2>UrbanAdvisor</h2>
<div class="landmark-list">
	<c:forEach items="${landmarks}" var="landmark">
		<li class="landmark">
			<c:url var="landmarkHref" value="${landmark.landmarkLink}"></c:url>
			<c:url var="landmarkImage" value="/img/${landmark.landmarkLocation}.jpg"></c:url>
			<span class="landmarkThumb"><a href="${landmarkHref}"><img src="${landmarkImage}"/></a></span>
			<span class="landmarkTitle">${landmark.landmarkName}</span>
			<span class="landmarkDescription">${landmark.landmarkDescription}</span>
		</li>
	</c:forEach>
</div>
		
<c:import url="/WEB-INF/jsp/footer.jsp" />
		