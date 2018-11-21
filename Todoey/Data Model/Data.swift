//
//  Data.swift
//  Todoey
//
//  Created by Houmem Zaghdoudi on 3/8/1440 AH.
//  Copyright © 1440 AH Houmem Zaghdoudi. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
