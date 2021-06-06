<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>
	<c:out value="${param.sex }" default="参数sex不存在" />
	<c:set var="i" value="100" />
	<c:set var="i" value="${i+1 }" />
	<br> i=${i } <br>
	<c:if test="${i>0 }">
		页面属性i的值大于0
	</c:if>
	<c:if test="${not(i>0) }">
		页面属性i的值大于0
	</c:if>

	<c:if test="${i<=100 }">
		<c:choose>
			<c:when test="${i>=90 && i<=100 }">
				i大于90
			</c:when>
			<c:when test="${i>=80 }">
				i大于80
			</c:when>
			<c:when test="${i>=70 }">
				i大于70
			</c:when>
			<c:when test="${i>60 }">
				i大于60
			</c:when>
			<c:when test="${i>=0 }">
				不及格
			</c:when>
			<c:otherwise>
				你瞅瞅你输入的鬼数字，能不能输入0~100
			</c:otherwise>
		</c:choose>
	</c:if>
	<br>

	<c:forEach var="i" begin="0" end="100" varStatus="vs">
		<c:if test="${i%2 == 0 && i%3 !=0}">
			i=${i },${vs.index },${vs.first },${vs.last },${vs.count }<br>
		</c:if>
	</c:forEach>

</h1>