//
//  Category.swift
//  Todoey
//
//  Created by Houmem Zaghdoudi on 3/13/1440 AH.
//  Copyright © 1440 AH Houmem Zaghdoudi. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
