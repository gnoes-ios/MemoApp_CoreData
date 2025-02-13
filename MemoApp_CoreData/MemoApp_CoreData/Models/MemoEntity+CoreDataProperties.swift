//
//  MemoEntity+CoreDataProperties.swift
//  MemoApp_CoreData
//
//  Created by 박주성 on 2/13/25.
//
//

import Foundation
import CoreData


extension MemoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoEntity> {
        return NSFetchRequest<MemoEntity>(entityName: "MemoEntity")
    }

    @NSManaged public var content: String?
    @NSManaged public var date: Date?

}

extension MemoEntity : Identifiable {

}
