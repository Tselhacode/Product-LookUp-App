//
//  ChosenRestaurantData.swift
//  iosFinalAssignment
//
//  Created by TENZIN TSELHA on 10/25/21.
//

import Foundation


struct ResultSet : Codable {
    let hits : [StoreItem]
}

struct StoreItem : Codable {
    let score : Double
    let item : Item
    
    enum CodingKeys : String, CodingKey {
        case score = "_score"
        case item = "fields"
    }

    struct Item : Codable {
        let itemName : String?
        let brandName : String?

    enum CodingKeys : String, CodingKey {
        case itemName = "item_name"
        case brandName = "brand_name"
        
    }
}
}


//
//{
//    "total_hits": 3,
//    "max_score": 4.396593,
//    "hits": [
//        {
//            "_index": "4",
//            "_type": "item",
//            "_id": "5",
//            "_score": 4.396593,
//            "fields": {
//                "item_id": "6",
//                "item_name": "Tibetan Dal",
//                "brand_name": "Cooksimple",
//                "nf_serving_size_qty": 1,
//                "nf_serving_size_unit": "serving"
//            }
//        },
//        {
//            "_index": "8",
//            "_type": "item",





























