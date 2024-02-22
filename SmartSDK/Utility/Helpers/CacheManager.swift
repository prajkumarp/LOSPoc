//
//  RuntimeCache.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 08/08/23.
//

import Foundation
import CoreData
import UIKit



class CacheManager{
    
    static let sharedInstance = CacheManager()
    
    private var stringCache : Dictionary<String,String> = Dictionary()
    
    
    private init(){
        readKeyValuePairsfromDB()
    }
    
    func getStringfor(key : String) -> String{
        
        if (stringCache[key] != nil){
            return stringCache[key] ?? ""
        }else if (KeychainHelper().getKeychainValue(for: key) != "Not found"){
            return KeychainHelper().getKeychainValue(for: key) ?? ""
        }else{
            return ""
        }
    }
    
    func putStringfor(key : String,value : String,type : cacheType? = .runtime){
        
        switch type{
        case .runtime:
            stringCache[key] = value
        case .local:
            stringCache[key] = value
            self.saveKeyValuePairinDB(key: key, value: value)
        case .secure:
            stringCache[key] = value
            _ = KeychainHelper().setKeychainValue(value: value, for: key)
        case .none:
            stringCache[key] = value
        }
    }
    
    private func saveKeyValuePairinDB(key: String, value: String) {
        if (getStringfor(key: key) == "Could not fetch"){
            addNewValueForKey(key: key, value: value)
        }else{
            updateValueForKey(key: key, newValue: value)
        }
    }
    
    private func readKeyValuePairsfromDB() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "KeyValuePair")
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            for data in results {
                if let key = data.value(forKey: "key") as? String,
                    let value = data.value(forKey: "value") {
                    // Handle the retrieved key-value pair here
                    print("Key: \(key), Value: \(value)")
                    stringCache[key] = value as? String
                }
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}

func fetchValueForKey(key: String) -> String {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return "Could not fetch"
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "KeyValuePair")
    fetchRequest.predicate = NSPredicate(format: "key = %@", key)
    
    do {
        let results = try managedContext.fetch(fetchRequest)
        if let keyValue = results.first, let value = keyValue.value(forKeyPath: "value") {
            return value as! String
        }
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
    }
    
    return "Could not fetch"
}

func addNewValueForKey(key:String,value: String){
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let entity = NSEntityDescription.entity(forEntityName: "KeyValuePair", in: managedContext)!
    let keyValue = NSManagedObject(entity: entity, insertInto: managedContext)
    
    keyValue.setValue(key, forKeyPath: "key")
    keyValue.setValue(value, forKeyPath: "value")
    
    do {
        try managedContext.save()
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }
}

func updateValueForKey(key: String, newValue: String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "KeyValuePair")
    fetchRequest.predicate = NSPredicate(format: "key = %@", key)
    
    do {
        let results = try managedContext.fetch(fetchRequest)
        if let keyValue = results.first {
            keyValue.setValue(newValue, forKeyPath: "value")
            
            do {
                try managedContext.save()
                print("Updated value for key: \(key)")
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
    }
}

