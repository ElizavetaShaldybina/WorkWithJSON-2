//
//  InformationViewController.swift
//  WorkWithJSON
//
//  Created by Елизавета Шалдыбина on 15.11.2023.
//

import UIKit
import Alamofire

final class InformationViewController: UIViewController {
    
    @IBOutlet weak var dogImage: UIImageView!
    
    private var dog: Dog!
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchDog()
    }
    
    private func fetchDog() {
        networkManager.fetchDog(from: Link.myURL.url) { result in
            switch result {
            case .success(let dog):
                self.dog = dog
                
                self.networkManager.fetchData(from: dog?.message ?? "") { result in
                    switch result {
                    case .success(let imageData):
                        self.dogImage.image = UIImage(data: imageData)
                    case .failure(let error):
                        print (error)
                    }
                }
            case .failure(let error):
                print (error)
            }
        }
    }
}


