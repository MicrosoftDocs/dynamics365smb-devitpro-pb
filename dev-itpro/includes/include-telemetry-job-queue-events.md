The following table describes the event IDs that are currently emitted by the job queue system.

| Event | Event id | Job queue status | Description | 
| ----- | -------- | ---------------- | ----------- |
| Job queue entry enqueued | AL0000E24 | Enqueued | Occurs when a job queue entry successfully enqueues and will after the specified alJobQueueEarliestStartDateTime. |
| Job queue entry failed to be enqueued | AL0000FNY | Enqueued | Occurs when a job queue entry fails to enqueue and this happens if no task scheduler is created behind it. |
| Job queue entry started | AL0000E25 |Started | Occurs right before the `Job Queue Start codeunit` is triggered and that codeunit will run the specified `Object ID to run`. |
| Job queue entry finished | AL0000E26 | Finished successfully | Occurs at the very end of the job queue run.|
| Job queue entry failed (might be retried) | AL0000HE7 | Error | Occurs when a job queue errors, and this is the first thing that is triggered before the updating of records.|
| Job queue entry rescheduled on login | AL0000I49 | N/A | Emitted if a job queue entry is rescheduled every time a user logs in. | 
| Job queue entry run once by a user | AL0000FMG | N/A | Emitted when the "Run once (Foreground)" action is clicked in Job Queue Entries/Card pages  |
| Job queue entry failed for the last time and is set to stopped | AL0000JRG | Error | Emitted when the job queue entry fails for the very last time before being set in `Error` state. | 
