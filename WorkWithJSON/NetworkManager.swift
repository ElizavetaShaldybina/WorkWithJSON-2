//
//  NetworkManager.swift
//  WorkWithJSON
//
//  Created by Елизавета Шалдыбина on 15.11.2023.
//

import Foundation

enum Link {
    case myURL
    
    var url: URL {
        switch self {
        case .myURL:
            return URL(string: "https://dog.ceo/api/breeds/image/random")!
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchImage(from url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    func fetchDog(url: URL, completion: @escaping(String?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let dogImageData = try jsonDecoder.decode(Dog.self, from: data)
                DispatchQueue.main.async {
                    completion(dogImageData.message)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
