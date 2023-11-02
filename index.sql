-- Task 1:
SELECT
    c.customerID,
    c.name AS customerName,
    c.email AS customerEmail,
    c.location AS customerLocation,
    COUNT(o.orderID) AS totalOrders
FROM `customers` c
LEFT JOIN `orders` o ON c.customerID = o.customerID
GROUP BY c.customerID, c.name, c.email, c.location
ORDER BY totalOrders DESC;

-- Task 2:
SELECT
    p.name AS productName,
    oi.quantity AS orderQuantity,
    (oi.quantity * oi.unitPrice) AS totalAmount
FROM `order_items` oi
JOIN `products` p ON oi.productID = p.productID
ORDER BY orderID;

-- Task 3:
SELECT
    c.name AS categoryName,
    SUM(oi.quantity * oi.unitPrice) AS totalRevenue
FROM `order_items` oi
JOIN `products` p ON oi.productID = p.productID
JOIN `categories` c ON p.categoryID = c.categoryID
GROUP BY c.name
ORDER BY totalRevenue DESC;


-- Task 4:
SELECT
    c.name AS customerName,
    SUM(oi.quantity * oi.unitPrice) AS totalPurchaseAmount
FROM `customers` c
LEFT JOIN `orders` o ON c.customerID = o.customerID
LEFT JOIN `order_items` oi ON o.orderID = oi.orderID
GROUP BY c.customerID, c.name
ORDER BY totalPurchaseAmount DESC
LIMIT 5;