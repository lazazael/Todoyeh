//
//  Item.swift
//  Todoyeh
//
//  Created by laza on 2018. 09. 26..
//  Copyright © 2018. laza. All rights reserved.
//

import Foundation

//class Item: Encodable, Decodable
class Item: Codable
{
    var title: String = ""
    var done: Bool = false
}
