//
//  ToDoListData+CoreDataProperties.swift
//  MyToDoList-2
//
//  Created by t2023-m0045 on 2023/09/21.
//
//

import Foundation
import CoreData


extension ToDoListData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListData> {
        return NSFetchRequest<ToDoListData>(entityName: "ToDoListData")
    }

    @NSManaged public var date: Date?
    @NSManaged public var content: String?

}

extension ToDoListData : Identifiable {

}
