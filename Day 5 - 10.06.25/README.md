# Learningjournal_M164

# Day 5 - 10.06.25

## Activities
Today, our key topic was Data Integrity. We explored practices to delete databases, foreign key constraints, and aggregate functions. Additionally, we briefly covered aliases in SQL. We also completed some Tasks regarding GROUP BY and ORDER BY. Most of today's content was a repetition for me, which helped with reinforcing previous knowledge.

## Key Learnings

* Understanding the role of data integrity in maintaining accurate and consistent data
* How foreign key constraints help enforce referential integrity
* The sequence of "WGHOL"
* Safe practices for deleting databases
* The difference between GROUP BY and ORDER BY
* The use of aliases for better readability and usability

## Theory

### Data Integrity
Data integrity refers to the accuracy, consistency, and reliability of data stored in a database. It ensures that the data remains correct and usable throughout its lifecycle. This is achieved through constraints, keys, and rules that prevent invalid or duplicate data.

Theres different types/criteria:
Uniqueness: Each record is unique to avoid duplicates
Referential integrity: Relationships between tables stay consistent
Correct data types and valid values
Data validation before insertion

### Deleting a Database
In professional databases, deleting data with DELETE is usually avoided to prevent information loss. For example, employee records are marked as inactive instead of deleted to keep historical data and relationships intact. Time-based events are tracked using additional tables to preserve history, not by overwriting data.

In systems like cash registers, deleting records could enable fraud, so corrections are made by cancellations or special entries. Referential integrity (foreign key constraints) ensures related data can’t be deleted without handling dependencies. For example, Wikipedia never deletes usernames but only blocks them to keep edit histories.

### FK-Constraints
Foreign key constraints are rules that maintain the relationship between tables in a database. A foreign key in one table refers to the primary key in another table, ensuring data consistency and referential integrity. For example, if a foreign key points to a record in another table, that record must exist; otherwise, the database will reject changes that violate this constraint.

When deleting, there are different options:
NO ACTION (RESTRICT): Prevents deleting if related records exist.
CASCADE: Deletes related records automatically
SET NULL: Sets foreign keys to NULL if allowed

### Aggregate Functions

You can use aggregate functions to summarize or calculate values from a column. The main functions are:

COUNT: Counts rows or non-NULL values
```sql
SELECT COUNT(*) FROM customers;
```

SUM: Adds up all values
```SQL
SELECT SUM(salary) FROM employees;
```

AVG: Calculates the average
```SQL
SELECT AVG(salary) FROM employees;
```

MIN/MAX: Returns the smallest/largest value.
```SQL
SELECT MIN(salary) FROM employees;
SELECT MAX(salary) FROM employees;
```

These can be combined and used with GROUP BY to analyze grouped data

### GROUP BY and HAVING

GROUP BY groups rows by one or more columns, Aggregate functions are applied to the groups
```SQL 
SELECT customer_id, SUM(order_total)
FROM orders
GROUP BY customer_id;
``` 
Returns the total orders per customer

HAVING filters grouped results based on aggregate conditions
```SQL
SELECT customer_id, SUM(order_total)
FROM orders
GROUP BY customer_id
HAVING SUM(order_total) > 500;
``` 
Shows only customers with total orders over 500


