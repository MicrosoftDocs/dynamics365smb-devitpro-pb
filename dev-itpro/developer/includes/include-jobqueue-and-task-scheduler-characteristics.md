Job queues and scheduled tasks come with different characteristics as described in this table:

|Method to start a new asynchronous operation | Properties |
|---------------------------|------------|
| Task                      | Queued up <br> Any server in a cluster can start it <br> Survives server restarts <br> No logging in Business Central.  | 
| Job queue                 | Scheduled <br> Recurrence <br> Any server in a cluster can start it <br> Survives server restarts <br> Logging of results in Business Central.|

For more information, see [Async processing overview](../devenv-async-overview.md)