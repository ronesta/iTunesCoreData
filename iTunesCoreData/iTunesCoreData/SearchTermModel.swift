//
//  SearchTermModel+CoreDataClass.swift
//  iTunesCoreData
//
//  Created by Ибрагим Габибли on 19.11.2024.
//
//

import Foundation
import CoreData

@objc(SearchTermModel)
public class SearchTermModel: NSManagedObject {
    @NSManaged public var term: String?
}
