<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Shopping Cart - Ecommerce</title>
<<<<<<< HEAD
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
=======
    <link rel="stylesheet" href="css/style.css">
>>>>>>> fed4cb1e63e057ff8a6476ebafaaed01ed6ead0e
</head>
<body>
<div class="container">
    <header>
        <h1>Your Shopping Cart</h1>
        <p class="header-subtitle">Review and manage your items</p>
    </header>
    <nav>
        <a href="/">Home</a>
        <a href="products">Continue Shopping</a>
    </nav>
    
    <c:if test="${empty cart}">
        <div class="empty-message">
            <p>Your cart is empty.</p>
            <p style="margin-top: 20px;"><a href="products" class="btn">Start Shopping</a></p>
        </div>
    </c:if>
    
    <c:if test="${not empty cart}">
        <table>
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${cart}">
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td class="price">$${product.price}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="cart-summary">
            <div class="cart-item-count">📦 Items in Cart: <strong>${cart.size()}</strong></div>
            <div class="cart-total">💰 Total: <strong>$<fmt:formatNumber value="${total}" type="number" maxFractionDigits="2" minFractionDigits="2"/></strong></div>
        </div>
        <div style="text-align: center; margin-top: 20px;">
            <a href="products" class="btn">Continue Shopping</a>
        </div>
    </c:if>
</div>
<footer>
    <p>&copy; 2026 Simple Ecommerce. Deployed with Jenkins & Tomcat.</p>
</footer>
</body>
</html>
