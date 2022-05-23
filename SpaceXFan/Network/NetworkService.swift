//
//  NetworkService.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 23.05.2022.
//

import Foundation
import Alamofire

class Servicee {
    
    //MARK: - for get in app all rockets from api
    final class func showAllRockets(_ completion: @escaping([Rocket]) -> Void){
        
        AF.request(kGETALLROCKETS, method: .get).response { response in
            if let data = response.data{
                do {
                    let answer = try JSONDecoder().decode([Rocket].self, from: data)
                    DispatchQueue.main.async {
                        completion(answer)
                    }
                } catch {
                    print(error.localizedDescription)
                    
                }
            }
        }.resume()
    }
}

