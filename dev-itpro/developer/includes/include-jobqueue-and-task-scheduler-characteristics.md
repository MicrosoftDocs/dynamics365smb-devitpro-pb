Job queues and scheduled tasks come with different characteristics as described in the following table:

|Method to start a new asynchronous operation | Characteristics |
|---------------------------|------------|
| Task                      | Queued up <br> Runs once <br> Any server in a cluster can start it <br> Survives server restarts <br> No logging in Business Central <br> Has telemetry.<br> No user interface for administration. | 
| Job queue                 | Scheduled <br> Supports recurrence <br> Any server in a cluster can start it <br> Survives server restarts <br> Logging of results in Business Central <br> Has telemetry. <br> Has a user interface for administration. |

For more information, see [Async processing overview](../devenv-async-overview.md)