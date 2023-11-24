> [!NOTE]
> Setting the DataAccessIntent property to **ReadOnly** does not guarantee that your data access will be running on the secondary replica, it is merely stating that the code only requires read ability and hence a read-only connection can be used.
> 
> For example, the property does not apply to queries running at arbitrary times during normal AL execution (i.e. the server does not change into **ReadOnly** mode in the middle of a transaction). Hence for queries, the property only applies fully when they are exposed as an API / OData feed directly. 