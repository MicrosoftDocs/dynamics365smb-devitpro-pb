Installing a large number of apps (extensions) in your [!INCLUDE[prod_short](prod_short.md)] environment can negatively impact performance in several ways:

- **Slower environment startup** - Each installed extension adds to the initialization time when the environment starts or restarts. The system must load and initialize all installed extensions, even if they're not actively used.
- **Longer upgrade times** - Environment upgrades must process all installed extensions, which increases the overall upgrade duration. This impact grows with the number of extensions installed.
- **Increased risk exposure** - Extensions from untrusted sources can introduce security vulnerabilities or unexpected performance issues.

### General guidelines

- Install only the extensions that are required for your business processes.
- Ensure that extensions come from sources you trust.
- Regularly review installed extensions and remove those no longer needed.

### Data retention after uninstallation

When an extension is uninstalled, its data remains in your database by design. This allows you to reinstall the extension later without data loss. However, this preserved data can have negative consequences:

- **Increased database size** - Orphaned extension data consumes database space that could be used for active business data.
- **Slower runtime performance** - The database must manage companion tables for uninstalled extensions, which can slow down data operations.
- **Longer upgrade times** - Environment upgrades process all tables in the database, including those from uninstalled extensions.

### Clean up orphaned extension data

Use the **Delete Orphaned Extension Data** page to identify and remove data from uninstalled extensions. This maintenance task:

- Frees up database capacity
- Reduces the row size in companion tables used to store extension data
- Speeds up data operations on affected tables
- Reduces upgrade complexity and duration
