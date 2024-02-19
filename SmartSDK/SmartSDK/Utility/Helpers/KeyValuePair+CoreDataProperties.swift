//
//  KeyValuePair+CoreDataProperties.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 10/08/23.
//
//

import Foundation
import CoreData


extension KeyValuePair {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<KeyValuePair> {
        return NSFetchRequest<KeyValuePair>(entityName: "KeyValuePair")
    }

    @NSManaged public var key: String?
    @NSManaged public var value: NSObject?

}

extension KeyValuePair : Identifiable {

}
