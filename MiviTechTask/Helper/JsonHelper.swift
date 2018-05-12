//
//  JsonHelper.swift
//  MiviTechTask
//
//  Created by Sohailurrahman S on 11/05/18.
//  Copyright © 2018 SohailUrRahman. All rights reserved.
//

import Foundation

class JsonHelper: NSObject {
    
    func getJsonData()->(status : String , returnData : NSDictionary) {
        
    if let path = Bundle.main.path(forResource: "collection", ofType: "json") {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult : NSDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! NSDictionary
            return (kPass,jsonResult)

        } catch let error as NSError {
            print(error)
        }
    }
        let emptyDict: NSDictionary = [:]
        return (kfail,emptyDict)
}
}
