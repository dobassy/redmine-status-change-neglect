The plugin which the status change supported.

## The restrictions
This plug-in is invalid in the status added originally because I'm premising on the status ID for the redmine initialization.

## The Condition
### According to the assignee:
* When the person is assigned, status set to 'in progress'
* When the person isn't assigned, status set to 'new'

### According to the progress ratio:
* At time of more than 0 % and less than 100 %, status set to 'in progress'
* When the progress ratio is 100%, status set to 'feedback'
* When status is 'completion' and the progress ratio are less than 100 %, status sets the progress ratio to 100%.