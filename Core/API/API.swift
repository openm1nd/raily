//
//  API.swift
//  Raily
//
//  Created by Dimitar Marinov on 07/11/2020.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import Foundation
import SwiftyXMLParser

enum HTTPVerb: String {
	case get = "GET"
	case post = "POST"
	case put = "PUT"
	case delete = "DELETE"
}


protocol APIRequest {
	var url: URL { get }
	var body: Encodable? { get }
	var method: HTTPVerb { get }
	var headers: [String:String] { get }
	var parameters: [String:String] { get }
}

struct API {
	
	
    static func exec<T: APIRequest, U: XMLParsingMapper>(endpoint: T, xmlPath: String, type: U.Type, completion: @escaping (_ response: [U]?, _ error: APIError?)->Void) {
		
		var url = endpoint.url
		if endpoint.parameters.count > 0 {
			var urlComponents = URLComponents()
			urlComponents.scheme = url.scheme
			urlComponents.host = url.host
			urlComponents.path = url.path
			urlComponents.queryItems = endpoint.parameters.map({URLQueryItem(name: $0.0, value: $0.1)})
			url = urlComponents.url!
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = endpoint.method.rawValue
		
		if let body = endpoint.body {
			do {
				let data = try body.toJSONData()
				request.httpBody = data
			} catch {
				assertionFailure("Cannot build request body")
			}
		}
		
		for (header, value) in endpoint.headers {
			request.addValue(value, forHTTPHeaderField: header)
		}
		
		URLSession.shared.dataTask(with: request) { (data, response, error) in
			if let e = error {
				completion(nil, APIError(code: "-1", text: e.localizedDescription))
				return
			}
			if 200 ... 299 ~= (response as! HTTPURLResponse).statusCode && data != nil {
				//do {
                    let xml = XML.parse(data!)
                    let items = xml[xmlPath.components(separatedBy: ".")].map {U(xml: $0)}
                    
					//let r = try decoder.decode(U.self, from: data!)
                    completion(items, nil)
				//} catch {
				//	print(error)
				//	completion(nil, APIError(code: "-1", text: "Unknown error"))
				//}
			} else {
				completion(nil, APIError(code: "-1", text: "Unknown error"))
			}
		}.resume()
		
	}
}
