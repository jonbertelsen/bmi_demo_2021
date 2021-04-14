<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         List of sports
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <h1>Hello ${sessionScope.email} </h1>
        This is a list of all sports:

        <form action="${pageContext.request.contextPath}/fc/managesports" method="post">
            <table>
                <thead><th>Id</th><th>Name</th><th></th><th></th></thead>
                <c:forEach var="sportItem" items="${applicationScope.sportList}">
                    <tr>
                        <td>${sportItem.sport_id}</td>
                        <td>${sportItem.name}</td>
                        <td><button type="submit" name="delete" value="${sportItem.sport_id}" >Fjern</button></td>
                        <td><button type="submit" name="edit" value="${sportItem.sport_id}" >Rediger</button></td>
                    </tr>
                </c:forEach>
            </table>

            <c:if test="${not empty requestScope.error}">
                <br/>
                <p style="color:red;font-size: large">${requestScope.error}</p>
            </c:if>
        </form>


    </jsp:body>
</t:genericpage>
