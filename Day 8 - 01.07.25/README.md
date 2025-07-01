# Learningjournal\_M164

# Day 8 - 01.07.25

## Activities

Today, I focused on preparing for LB 2 by correcting and expanding my import script. The main focus was on LOAD DATA LOCAL INFILE, since it initially did not work for me. I explored different import methods, including the Table Import Wizard, mysqlimport, Bulk Import, and the standard LOAD DATA LOCAL INFILE command. Finally, I adjusted MySQL Workbench server settings to enable local\_infile=1 for local import permissions.

## Key Learnings

⦁ Importance of enabling local\_infile in MySQL Workbench for local data imports

⦁ Various import methods: Table Import Wizard, mysqlimport, Bulk Import, and LOAD DATA LOCAL INFILE

⦁ Differences in flexibility, speed, and usability among import techniques

⦁ Practical experience troubleshooting permissions and syntax issuesTheory

## Theory

### Comparison between different Import-types
The Table Import Wizard offers a user-friendly, GUI-based way to import CSV files but may be slower and less flexible for large datasets. mysqlimport and Bulk Import provide command-line options with good performance but require proper server settings and syntax. LOAD DATA LOCAL INFILE is very fast and flexible for bulk data loading but needs explicit permission enabled (local_infile=1), which can pose security considerations. Choosing the right method depends on dataset size, environment, and user familiarity.

