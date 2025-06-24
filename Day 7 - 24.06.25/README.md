# Learningjournal_M164

# Day 7 - 24.06.25

## Activities

Today, we did a quick recap on Bulkimports. After that, we began exam preparation by 
Performing typical exercises to deepen our knowledge of normalization, Forward engineering, CSV-imports and backups.

## Key Learnings

* Importance of Database Backups
* Different Backup Strategies
* Backup Tools and Best Practices

## Theory

### Backup Types

Full Backup: Copies all data, easy recovery but requires large storage

Differential Backup: Saves changes since last full backup, reduces storage but grows over time

Incremental Backup: Saves changes since last backup (full or incremental), most storage efficient but requires multiple backups for recovery

### Backup Execution Methods and Tools

mysqldump: Fast command-line tool for full logical backups

phpMyAdmin: User-friendly export tool with size limitations

BigDump: Handles large SQL imports beyond phpMyAdmin limits

HeidiSQL: Windows-based tool with backup features, lacks automation

Mariabackup: Open-source tool for physical online backups, supporting multiple storage engines

### Backup Security and Maintenance

Backups should be stored securely and encrypted, ideally on separate physical media protected from theft and damage. Creating a dedicated backup user with minimal required permissions improves security during backup operations. This is especially important in business Environments.
