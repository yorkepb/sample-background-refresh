# sample-background-refresh
Sample app demonstrating background app refresh in a very basic form.

This sample app is meant to demonstrate using background app refresh in combination with background tasks and background url sessions. It also provides the option of using a default url session instead of a background url session to point out the differences.

The app should be run directly on a device (not in the simulator as it may produce unexpected results) and directly launches into a background app refresh not a foreground app launch.

The key workflow here is:
- Background App Refresh calls through to `application(_:performFetchWithCompletionHandler:)` in the AppDelegate
-- This kicks off a background task, and then begins the download of a single feed
--- Upon completing download the single feed a subsequent 20 additional feeds are queued. This mimics a scenario in which a single feed is downloaded to instruct the app what needs to be updated which then prompts many other feed downloads.
---- Upon completing all 20 additional feeds everything completes. In a background app refresh scenario because the background task gets an expiration call back, the completion gets run before all 20 have completed resulting in the remaining feeds being downloaded on a background url session. If the app is relaunched after some time the call backs for the remaining feeds will be called.

Question? Comments? Concerns?
contact iYrke <paul.yorke@nytimes.com>
