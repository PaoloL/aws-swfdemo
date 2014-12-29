aws-swfdemo
===========

A simple Amazon SWF demo with more example

swf-demo-singleactivity-sequence
--------------------------------
A sequence pattern refers to a workflow in which one task follows another in sequential order. It is implemented by calling activities synchronously:

activity1 --> activity2 --> activity3

Since each activity blocks execution of the main thread when it runs, activity2 will run only after activity1 has completed. Likewise, activity3 won't run until after activity2 is complete.




