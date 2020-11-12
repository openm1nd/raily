//
//  Constants.swift
//  Raily
//
//  Created by Dimitar Marinov on 07/11/2020.
//  Copyright © 2020 Apps BG. All rights reserved.
//

import Foundation
import UIKit
 
struct Constants {
	static var currentEnvironment = Environment.prod
    static let willEnterForeground = "willEnterForeground"
    
    struct Colors {
        static let primaryColor = UIColor.systemGreen
    }
		
	static let environments: [Environment: EnvironmentConfig] = [
		.dev: EnvironmentConfig(baseUrl: "http://api.irishrail.ie/realtime/realtime.asmx/"),
		.prod: EnvironmentConfig(baseUrl: "http://api.irishrail.ie/realtime/realtime.asmx/")
	]
	
	struct EnvironmentConfig {
		let baseUrl: String
	}
	
	static var baseUrl: String {
		return Constants.environments[Constants.currentEnvironment]!.baseUrl
	}
	
	enum Environment {
		case dev
		case prod
	}
}
