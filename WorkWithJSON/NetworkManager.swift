//
//  NetworkManager.swift
//  WorkWithJSON
//
//  Created by Елизавета Шалдыбина on 15.11.2023.
//

import Foundation
import Alamofire

enum Link {
    case myURL
    
    var url: URL {
        switch self {
        case .myURL:
            return URL(string: "https://dog.ceo/api/breeds/image/random")!
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchDog(from url: URL, completion: @escaping(Result<Dog?, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let dogs = Dog.getDogs(from: value)
                    completion(.success(dogs))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    
    func fetchData(from url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let imageData):
                    completion(.success(imageData))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
