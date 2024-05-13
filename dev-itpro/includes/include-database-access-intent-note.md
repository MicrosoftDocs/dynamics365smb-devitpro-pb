> [!NOTE]
> Setting the DataAccessIntent property to **ReadOnly** doesn't guarantee that your data access will be running on the secondary replica. It's merely stating that the code only requires read ability, so a read-only connection can be used.
> 
> For example, the property doesn't apply to queries running at arbitrary times during normal AL execution (that is, the server doesn't change to **ReadOnly** mode in the middle of a transaction). So for queries, the property only fully applies when they're exposed as an API/OData feed directly. 
