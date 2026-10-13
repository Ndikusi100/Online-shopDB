- ProductName, Category, Price, StockQuantity

### 3. Orders
- OrderID (Primary Key)
- CustomerID (Foreign Key), OrderDate, TotalAmount

### 4. OrderDetails
- OrderDetailID (Primary Key)
- OrderID (Foreign Key), ProductID (Foreign Key), Quantity, PriceEach

## 🔗 Relationships
- Customers 1---* Orders
- Orders 1---* OrderDetails
- Products 1---* OrderDetails
