//
//  FirebaseRemoteConfigHelper.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 13/07/23.
//

import Foundation
import FirebaseRemoteConfig

class FirebaseRemoteConfigHelper{
    
    static let sharedInstance = FirebaseRemoteConfigHelper()
    
    var remoteConfig: RemoteConfig!
    
    private init(){
        initializeFirebaseRemoteConfig()
    }
    
    func initializeFirebaseRemoteConfig(){
        
        // [START get_remote_config_instance]
        remoteConfig = RemoteConfig.remoteConfig()
        // [END get_remote_config_instance]
        
        // Create a Remote Config Setting to enable developer mode, which you can use to increase
        // the number of fetches available per hour during development. See Best Practices in the
        // README for more information.
        // [START enable_dev_mode]
        //Throttles for development to see changes frequently
#if DEBUG
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
#endif
        // [END enable_dev_mode]
        
        // Set default Remote Config parameter values. An app uses the in-app default values, and
        // when you need to adjust those defaults, you set an updated value for only the values you
        // want to change in the Firebase console. See Best Practices in the README for more
        // information.
        // [START set_default_values]
        //Define a default setting
#if DEBUG
        remoteConfig.setDefaults(fromPlist: "remote_config_defaults_staging")
#else
        remoteConfig.setDefaults(fromPlist: "remote_config_defaults_prod")
#endif
        // [END set_default_values]
    }
    
    func fetchConfig(){
        
        // [START fetch_config_with_callback]
        remoteConfig.fetch { (status, error) -> Void in
            if status == .success {
                EventManager().log(log: "Config fetched!")
                self.remoteConfig.activate { changed, error in
                    // ...
                }
            } else {
                EventManager().log(log: "Config not fetched")
                EventManager().logError(error: error!)
            }
            
        }
        //         [END fetch_config_with_callback]
        
        
        remoteConfig.addOnConfigUpdateListener { configUpdate, error in
            guard let configUpdate, error == nil else {
                return self.printRemoteConfigError(error: error!)
            }
            
            EventManager().log(log: "Updated keys: \(configUpdate.updatedKeys)")
            
            self.remoteConfig.activate { changed, error in
                guard error == nil else { return self.printRemoteConfigError(error: error!)}
            }
        }
        
    }
    
    func printRemoteConfigError(error: Error){
        EventManager().logError(error: error)
    }
    
    
    
    func getConfigValuefor(key:String) -> RemoteConfigValue{
        //        return remoteConfig.configValue(forKey: key, source: .remote)
        return remoteConfig.configValue(forKey: key)
    }
}
