# Optimizing Distributed Joins: The Case of Google Cloud Spanner and DataStax Astra DB

This Proof of Concept (PoC) demonstrates how to optimize distributed joins. Instead of using a shuffle join or a broadcast join, we show how to solve the same problem more efficiently using:
- Interleaved Tables and Co-Located Joins in Google Cloud Spanner
- Tables with Multi-Row Partitions and Pre-Computed Joins in DataStax Astra DB
