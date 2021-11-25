//
//  ManageItemModel.swift
//  iosFinalAssignment
//
//  Created by TENZIN TSELHA on 11/4/21.
//

//ServiceController

import Foundation
import UIKit
class ManageItemModel {
    //create an object of this service that can be shared just by calling the class name in other classes
    static var shared = ManageItemModel()
    private init() {}
    let apikey = "8d4efacc"
    let apiId = "81f5d916c7463970a0e4ee06d031587c"
    var task : URLSessionDataTask?
    func fetchData(term: String, completion: @escaping (Result<ResultSet,Error>) -> Void) {
        print("7. entered fetchdata")
        let urlString = "https://api.nutritionix.com/v1_1/search/\(term)?&zip=20005&appId=\(apikey)&appKey=\(apiId)"
        print("8. printing url \(urlString)")
        //convert URLString to URL datatype
        if let url = URL.init(string: urlString){
            task?.cancel()
            task = URLSession.shared.dataTask(with:url) { (data,response,error) in
                print("9. URLSession turned on ")
                if let error = error {
                    completion(.failure(error))
                }
                else if let data = data{
                    DispatchQueue.main.async{
                    if let decodedResult = try? JSONDecoder().decode(ResultSet.self, from: data){
                        completion(.success(decodedResult))
                        print("10. parsed result:  \(decodedResult)")
                        print("11. hits  \(decodedResult.hits)")
                        print("11.5 \(decodedResult.hits.count)")
                        print("12. checking itemName \(decodedResult.hits[0].item.itemName!)")
                    }
                    }
                }
            }
            task?.resume()
    }
}
}
