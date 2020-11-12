//
//  Base.swift
//  Raily
//
//  Created by Dimitar Marinov on 7.11.20.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import Foundation
import SwiftyXMLParser

protocol XMLParsingMapper {
    init(xml: XML.Accessor)
}

struct APIError: Decodable {
    let code: String
    let text: String
}
