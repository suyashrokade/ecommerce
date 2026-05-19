<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Products - Ecommerce</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <header>
        <h1>Product Catalog</h1>
        <p class="header-subtitle">Browse our selection of premium tech products</p>
    </header>
    <nav>
        <a href="/">Home</a>
        <a href="products">Products</a>
        <a href="cart">View Cart</a>
    </nav>
    
    <div style="display: flex; flex-wrap: wrap; margin-top: 30px;">
        <c:forEach var="product" items="${products}">
            <div class="product-card">
                <h3>${product.name}</h3>
                <span class="price">$${product.price}</span>
                <p style="color: #999; font-size: 0.9em;">ID: ${product.id}</p>
                <form action="cart" method="post" style="margin-top: 15px;">
                    <input type="hidden" name="productId" value="${product.id}" />
                    <button type="submit" class="btn">Add to Cart</button>
                </form>
            </div>
        </c:forEach>
    </div>
</div>
<footer>
    <p>&copy; 2026 Simple Ecommerce. Deployed with Jenkins & Tomcat.</p>
</footer>
</body>
</html>
