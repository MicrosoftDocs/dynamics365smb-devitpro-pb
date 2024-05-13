It's often desirable to offload AL execution from the UI thread to a background session. 

Here are some examples of this performance pattern:

- Don't let the user wait for batches 
- Split large tasks into smaller tasks and run them in parallel

There are many different ways to spin up a new session:

- [Page Background Task](../developer/devenv-page-background-tasks.md)  
- [StartSession](../developer/methods-auto/session/session-startsession-integer-integer-string-table-method.md)  
- [TaskScheduler.CreateTask](../developer/methods-auto/taskscheduler/taskscheduler-data-type.md)  
- [Job Queue](/dynamics365/business-central/admin-job-queues-schedule-tasks)  


They come with different characteristics as described in this table:

|Method to start a new asynchronous operation | Characteristics |
|---------------------------|------------|
| Page Background Task      | Can (will) be canceled <br> Read-only <br> Runs in a child session, which is bound to its parent session. <br> Bound to a page. <br> Lightweight |
| StartSession              | Created immediately <br> Runs on same server as the session that starts it. <br> Runs as a background session. <br> Not as controlled as a Page Background Task |
| Task                      | Queued up <br> Any server in a cluster can start it <br> Runs as a background session. <br> Survives server restarts <br> No logging in Business Central. | 
| Job queue                 | Scheduled <br> Recurrence <br> Any server in a cluster can start it <br> Runs as a scheduled task <br> Survives server restarts <br> Logging of results in Business Central. |
