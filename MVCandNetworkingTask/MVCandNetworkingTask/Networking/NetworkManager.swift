//
//  NetworkManager.swift
//  MVCandNetworkingTask
//
//  Created by Mubarak Aloraifan on 04/03/2024.
//

import Foundation
import Alamofire

class NetworkManager{
    
    //MARK: API
    private let baseURL = "https://coded-pets-api-crud.eapi.joincoded.com/pets"
    
    //MARK: Singleton
    static let shared = NetworkManager()
    
    
    //MARK: Fetching
    func fetchPets(completion: @escaping ([Pet]?) -> Void){
        
        AF.request(baseURL).responseDecodable(of: [Pet].self) { response in
            switch response.result {
            case .success(let pets):
                completion(pets)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
    
}
