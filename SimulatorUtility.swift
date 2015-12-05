//
//  SimultorUtility.swift

//
//  Created by QUINTON WALL on 11/14/15.
//  Copyright © 2015 Quinton Wall. All rights reserved.
//

import Foundation
import CoreData

class SimulatorUtility
{
    class var isRunningSimulator: Bool
        {
        get
    {
        return TARGET_OS_SIMULATOR != 0 // Use this line in Xcode 7 or newer
        return TARGET_IPHONE_SIMULATOR != 0 // Use this line in Xcode 6
        }
    }
    
   
    
    static func performLogin() {
        let p:FIPerson = FIPerson(jsonData: getJSONDataFromFile("User"))
        LinkedInService.sharedInstance.login(p)
        
    }
    
   
    class func getJSONDataFromFile(thefile : String) -> NSData {
        
        var data : NSData?
        if let path = NSBundle.mainBundle().pathForResource(thefile, ofType: "json") {
            do {
                 data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
            }
            catch let error as NSError {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }
     
        return data!
    }
}
