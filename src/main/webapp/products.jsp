<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Products</title>
</head>
<body>
<h1>Product Catalog</h1>
<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Action</th>
    </tr>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>$${product.price}</td>
            <td>
                <form action="cart" method="post">
                    <input type="hidden" name="productId" value="${product.id}" />
                    <button type="submit">Add to Cart</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<p><a href="/">Home</a> | <a href="cart">View Cart</a></p>
</body>
</html>
