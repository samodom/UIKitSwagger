`SpinnerStateManager`
=====================

This class provides a simple interface for maintaining the state of a `UIActivityIndicatorView` when multiple concurrent tasks may be involved.  For the sake of simplicity, the term *spinner* is used to refer to the indicator view.

An instance of `SpinnerStateManager` manages a spinner's animation state and a semaphore-like client count.  This means that multiple calls can be made to the manager by tasks to start animating the spinner with subsequent calls to stop animating.  Once the number of client tasks has reached zero, animation will end.

A `SpinnerStateManager` can be created with or without a spinner.  If it is created with a spinner, it assumes a `Stopped` state for a spinner that is not animating and a `Started(1)` state for a spinner that is animating.  When a spinner is added to a manager without one or the manager's spinner is replaced, the manager assumes the state of the new spinner in an identical fashion.  Without a spinner, the state of the manager is `Detached` and attempts to start or stop the spinner through the manager are ignored.

When in a started or stopped state, clients can call `start()` and `stop()` at the appropriate times to indicate their task status.  The sequence in the table below demonstrates the general use case for this class:

|Manager State|Event|Spinner State|
|-------------|-----|-------------|
|Stopped|start()|animating|
|Started(1)|start()|animating|
|Started(2)|start()|animating|
|Started(3)|stop()|animating|
|Started(2)|stop()|animating|
|Started(1)|stop()|not animating|
|Stopped||
