-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
    select Product.ProductName, Category.CategoryName
    from Product
    join Category
            on Category.id = Product.CategoryId;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
    select o.Id, Shipper.CompanyName
    from 'Order' o
    join Shipper
        on Shipper.Id = o.ShipVia
    where o.orderdate < '2012-08-09';
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
    select Product.ProductName, OrderDetail.Quantity
    from Product
    join OrderDetail
        on Product.Id = OrderDetail.ProductId
        where OrderDetail.OrderId = 10251
        Order By ProductName
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
    select o.Id, Customer.CompanyName, Employee.LastName
    from 'Order' o
    join Customer
        on Customer.Id = o.CustomerId
    join Employee
        on Employee.Id = o.EmployeeId