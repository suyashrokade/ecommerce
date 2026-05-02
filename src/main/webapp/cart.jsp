<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Shopping Cart</title>
</head>
<body>
<h1>Your Cart</h1>
<c:if test="${empty cart}">
    <p>Your cart is empty.</p>
</c:if>
<c:if test="${not empty cart}">
    <table border="1" cellpadding="8">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
        </tr>
        <c:forEach var="product" items="${cart}">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>$${product.price}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<p><a href="/">Home</a> | <a href="products">Continue Shopping</a></p>
</body>
</html>
