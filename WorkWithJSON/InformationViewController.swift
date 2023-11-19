//
//  InformationViewController.swift
//  WorkWithJSON
//
//  Created by Елизавета Шалдыбина on 15.11.2023.
//

import UIKit

final class InformationViewController: UIViewController {
    
    @IBOutlet weak var dogImage: UIImageView!
    
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }
    
    private func fetchImage() {
        networkManager.fetchDog(url: Link.myURL.url) { url in
            guard let url = URL(string: url ?? "") else { return }
                self.networkManager.fetchImage(from: url) { result in
                    switch result {
                    case .success(let data):
                        self.dogImage.image = UIImage(data: data)
                    case .failure(let error):
                        print(error)
                }
            }
        }
    }
}

