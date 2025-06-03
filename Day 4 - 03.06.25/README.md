# Learningjournal_M164

# Day 3 - 27.05.25

## Activities
Today, we took our LB1-exam, which covered all the topics from the days before in a theoretical and practical part. After that, I worked on reviewing SQL-JOINs.

## Key Learnings
Working on understanding JOINs made me realize the differences. I managed to practically apply this Knowledge by accomplishing Tasks.

## Theory

### JOINs
In SQL, JOINs are used to combine data from multiple tables based on a related column between them.
This allows you to retrieve connected data that is stored across separate tables. For example, a Customers table may be connected to an Orders table through a common CustomerID.

There are different Kinds of JOINs:

1. INNER JOIN
Returns only the matching rows from both tables.
If there is no match, the row is excluded from the result.

Example (Tables customer and orders): Show only customers who have placed at least one order

```sql
SELECT *
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
```

2. LEFT (OUTER) JOIN
Returns all rows from the left table, and the matching rows from the right table.
If there’s no match, the result contains NULL for the right table.

Example (Tables customer and orders): Show all Customers. Those with no order will have NULL as order

```sql
SELECT *
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
```

3. RIGHT (OUTER) JOIN
Opposite of LEFT JOIN, returns all rows from the right table, and the matching rows from the left. Unmatched rows from the left table will have NULL.

Example (Tables customer and orders): Show all Orders with customer, if there's no customer, result is NULL

```sql
SELECT *
FROM Orders
RIGHT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;
```

4. FULL (OUTER) JOIN
Returns all rows from both tables and matches where possible.
If no match is found on either side, the result will include NULL in place of missing data.

Example (Tables customer and orders): Show all Customers and Orders (and try to combine them). Rows with just one value are paired to NULL

```sql
SELECT *
FROM Customers
FULL OUTER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
```







