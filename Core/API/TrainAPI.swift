//
//  TrainAPI.swift
//  Raily
//
//  Created by Dimitar Marinov on 12.11.20.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import Foundation

enum TrainAPI: APIRequest {
    case getTrainMovements(String, String)
}

extension TrainAPI {
    var url: URL {
        switch self {
        case .getTrainMovements:
            return URL(string: Constants.baseUrl+"getTrainMovementsXML")!
        }
    }
    
    var method: HTTPVerb {
        switch self {
        case .getTrainMovements:
            return .get
        }
    }
    
    var headers: [String : String] {
        let headers = [
            "Content-type" : "application/json",
            "Accept" : "application/json"
        ]
        switch self {
        case .getTrainMovements: {
                // add any headers here
            }()
        }
        return headers
    }
        
    var body: Encodable? {
        switch self {
        default:{}()
        }
        return nil
    }
    
    var parameters: [String : String] {
        var params: [String : String] = [:]
        switch self {
        case .getTrainMovements(let trainId, let date):
            params["TrainId"] = trainId
            params["TrainDate"] = date
        }
        return params
    }
}
