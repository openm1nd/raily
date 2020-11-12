//
//  UserAPI.swift
//  Raily
//
//  Created by Dimitar Marinov on 07/11/2020.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import Foundation

enum StationAPI: APIRequest {
	case getDataByName(String)
    case getAll
}

extension StationAPI {
	var url: URL {
        switch self {
        case .getDataByName:
            return URL(string: Constants.baseUrl+"getStationDataByNameXML")!
        case .getAll:
            return URL(string: Constants.baseUrl+"getAllStationsXML")!
        }
	}
	
	var method: HTTPVerb {
		switch self {
        case .getDataByName, .getAll:
			return .get
		}
	}
	
	var headers: [String : String] {
		let headers = [
			"Content-type" : "application/json",
			"Accept" : "application/json"
		]
		switch self {
        case .getDataByName, .getAll: {
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
        case .getDataByName(let name):
            params["StationDesc"] = name
        case .getAll:{}()
        }
		return params
	}
}
