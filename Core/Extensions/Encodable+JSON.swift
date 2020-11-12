//
//  Encodable+JSON.swift
//  Raily
//
//  Created by Dimitar Marinov on 07/11/2020.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import Foundation
extension Encodable {
	func toJSONData() throws -> Data? { try JSONEncoder().encode(self) }
}
