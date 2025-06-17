# Learningjournal_M164

# Day 6 - 17.06.25

## Activities
We started this day by quickly reviewing bulk imports and subqueries with an example. After that, we independently read through the course modules. Additionally, we completed tasks and exercises covering those topics.

## Key Learnings

* Subqueries are a cost-saving alternative to JOINs
* The difference between scaler and non-scalar Subqueries
* In professional systems, data is rarely deleted but instead marked as inactive
* Using a generator to generate data values
* The structure of a CSV-file

## Theory

### Subqueries
Subqueries are queries embedded within another SQL query. They are typically used to compute values that the outer query needs, such as filtering results based on a secondary condition or deriving aggregate data. Subqueries can appear in SELECT, FROM, or WHERE clauses. They help decompose complex problems into smaller, more manageable parts. However, excessive or poorly optimized subqueries can impact performance.

Scalar subqueries return exactly one value (one row, one column) and can be used like a constant in expressions, such as within WHERE, SELECT, or SET clauses.
Non-scalar subqueries return multiple rows or columns and are typically used with operators like IN, EXISTS, or in FROM clauses as derived tables.

example for a scalar subquery (Here, the minimum ticket price for flights from Paris to Bariloche gets checked, and then it gets filtered by selecting all Paris departures that are cheaper than that minimum price):
```sql
SELECT city_destination, ticket_price, travel_time, transportation FROM one_way_ticket
  WHERE ticket_price < (
      SELECT MIN(ticket_price) FROM one_way_ticket
      WHERE city_destination = 'Bariloche' AND city_origin = 'Paris'
      )
  AND city_origin = 'Paris';
```

example for a non-scalar subquery (Here, the names of all countries in the 'Europa' region get selected, and then the users are filtered by matching their country to one of those names):
```sql
use subselect;
SELECT name, age, country
FROM users
WHERE country IN 
(  -- hier beginnt Subquery: 
   SELECT name FROM country WHERE region = 'Europa'
)
```

### Bulk imports
Bulk imports involve inserting or updating large volumes of data efficiently, often using optimized commands like LOAD DATA INFILE (MySQL). While DELETE can remove data, it's often avoided to prevent permanent information loss and maintain data auditability. Instead, records are marked as inactive or archived, especially for legal, historical, or analytical purposes. Deleting data in critical systems (f.e. financial or medical) could obscure important actions, so corrections are logged explicitly via reversal entries or status flags. Referential integrity through foreign keys enforces consistency, ensuring dependent data remains valid.

example:

```sql
LOAD DATA LOCAL INFILE 'C:/path/import.csv'
INTO TABLE tbl_Example
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(column1, column2, column3);
```

### Commands

Loading (local) CSV-data:
LOAD DATA (LOCAL) INFILE "C:/path/import.csv";

Empty table:
Truncate tbl_Beispiel;

No Constraints:
SET FOREIGN_KEY_CHECKS=0;

Ignore Title/Attribute Names in first row (In CSV-File):
IGNORE 1 ROWS;