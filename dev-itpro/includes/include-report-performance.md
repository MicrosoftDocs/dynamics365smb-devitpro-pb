Reports generally fall into two categories. They can be specific to a single instance of an entity, like an invoice. Or, they can be of a more analytical nature that joins data from multiple instances of multiple entities. Typically, performance issues in reports lie in the latter category. The following articles contain advice about implementing faster reports: 

- Use Read Scale-Out to read data from a read-only copy of the database, see [Using Read Scale-Out for Better Performance](../administration/database-read-scale-out-overview.md) for more information.
- Use Partial Records to reduce the data loaded from the database, see [Using Partial Records](../developer/devenv-partial-records.md) for more information.
- Use AL queries to optimize the way data is read from the database, see [Queries in Business Central](../developer/devenv-query-overview.md) for more information.
- Compared to Word layouts, RDL layouts can result in slower performance with document reports, especially for actions related to the user interface (like sending emails). For more information, see [Creating an RDL Layout Report](../developer/devenv-howto-rdl-report-layout.md).

[!INCLUDE [send-report-excel](../developer/includes/send-report-excel.md)]
