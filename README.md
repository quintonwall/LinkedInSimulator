# LinkedInSimulator

To access LinkedIn APIs you are required to be authenticated. The LinkedIn SDK for iOS provides a super easy way to implement this authentication, however, it requires the existance of the LinkedIn app on the device. We cant install this app on the simulator.

To make it easier for myself, I have been writing a series of utilities to allow me to continue to develop on the simulator by using sample JSON payloads of LinkedIn API responses. 

## Basic Usage
### create a sample JSON
Create a sample JSON file based on the linkedin response and include it in your project directory. For example, here is a sample of a Person profile request:

```swift
 {
     "firstName": "Frodo",
     "headline": "Middle Earth Badass",
     "id": "1R2RtA",
     "lastName": "Baggins",
     "siteStandardProfileRequest": {
         "url": "https://www.linkedin.com/profile/view?id=1R2RtA"
     }
  }
```

##Check for simulator mode
In your code, check for simulator mode, and fetch the JSON if applicable.

```swift
  @IBAction func loginToLinkedInTapped(sender: AnyObject) {
        if SimulatorUtility.isRunningSimulator {
            //LinkedIn SDK requires the LinkedIn app to be available for auth.
            //let's run in simulated mode.
            print("++++++++ RUNNING IN SIMULATOR MODE  ++++++++")
 
            SimulatorUtility.performLogin()
            self.performSegueWithIdentifier("loggedin", sender: nil)
            
        } else {
            doLISDKLogin()
        }
    }
 ```
 
##More to come
That's about it for now, but I'm actively adding more test endpoints as I need them for my own app usuage. Feel free to submit pull requests of any you have created!
