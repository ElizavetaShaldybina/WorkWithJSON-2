//
//  ViewController.swift
//  WorkWithJSON
//
//  Created by Елизавета Шалдыбина on 12.11.2023.
//

import UIKit

enum Alert {
    case success
    case failed
    
    var title: String {
        switch self {
        case .success:
            return "Success"
        case .failed:
            return "Failed"
        }
    }
    
    var message: String {
        switch self {
        case .success:
            return "You can see the results in the Debug area"
        case .failed:
            return "You can see error in the Debug area"
        }
    }
}

final class MainViewController: UIViewController {
    // MARK: - PrivateMethods
   // private func showAlert(withStatus status: Alert) {
        //let alert = UIAlertController(title: status.title, message: status.message, preferredStyle: .alert)
       // let okAction = UIAlertAction(title: "OK", style: .default)
       // alert.addAction(okAction)
       // DispatchQueue.main.async { [unowned self] in
        //    present(alert, animated: true)
        //}
    //}
    
    @IBAction func goButtonPushed() {
        //URLSession.shared.dataTask(with: Link.myURL.url) { data, _ , error in
            //guard let data = data else {
               // print(error?.localizedDescription ?? "No error description")
               // return
            //}
            //let jsonDecoder = JSONDecoder()
           // do {
              //  let course = try jsonDecoder.decode(Dog.self, from: data)
              //  print(course)
               // self.showAlert(withStatus: .success)
            //} catch let error {
              //  print(error.localizedDescription)
              //  self.showAlert(withStatus: .failed)
            //}
        //}.resume()
    }
}
