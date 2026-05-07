Database indexes significantly affect performance. While indexes speed up read operations (find, filter, sort, aggregate), they require storage and can slow down write operations because the index must be kept up to date.

[!INCLUDE[prod_short](prod_short.md)] provides tools to view index usage statistics and selectively disable low-use indexes to improve write performance and reduce storage costs. This capability is beneficial for:

- Optimizing tables with high transaction volumes where write performance is critical
- Reducing database storage costs by removing indexes that aren't being used
- Identifying which indexes are actually being used by queries

You can view detailed index usage statistics from the **Table Information** page, including index storage size and query usage metrics. Turn off nonessential indexes while protecting unique indexes, primary keys, SIFT indexes, and $systemid indexes from being disabled.

Learn more in [Manage database index usage](/dynamics365/business-central/manage-indexes).
