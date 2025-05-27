# Day 1 - 13.05.25

## Activities
We began by normalizing an Excel spreadsheet, breaking the data into smaller, more manageable tables to reduce redundancy and improve efficiency.
After normalizing the data, we imported it into MySQL Workbench and set up the necessary relationships between the tables using foreign keys.
Additionally, we were introduced to key database concepts and terminology, including normalization and various types of relationships (one-to-many, many-to-many, etc.).

## Key Learnings
Today, I learned that normalization is a crucial step in database design, as it helps organize data effectively by reducing redundancy and ensuring data integrity. During the normalization process, I accidentally deleted some important information, which caused me to lose some time as I had to undo my changes. This was a good reminder to always double-check data before making changes.

In MySQL Workbench, I found it helpful that relationships between tables can be visually represented through Entity-Relationship Diagrams (ERDs). These diagrams make it easier to define how tables interact with each other, and this process worked smoothly for me since I’m already familiar with MySQL Workbench.

Key concepts like primary keys (unique identifiers for rows in a table) and foreign keys (fields in one table that reference primary keys in another) were essential in establishing the proper relationships between the tables. We also explored different types of relationships—one-to-one, one-to-many, and many-to-many—which deepened my understanding of how data is structured in relational databases.

In the coming weeks, we’ll continue to explore these concepts in more detail, and I’m particularly excited to learn more about conditional and non-conditional relationships and how they work in practice.

## Theory

### Modelling
ERM = Entity Relationship Model (without cardianalities and attributes) -> conceptional Modell
ERD = Entity Relationship Diagram (with cardinalities and attributes) -> logical model
RM = Relationales Datenmodell -> physical model (f.e in MySQL Workbench)

### Normalization
1. NF -> atomicy
2. NF -> remove redundancies by separating into different tables
