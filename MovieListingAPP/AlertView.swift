//
//  AlertView.swift
//  MovieListingAPP
//
//  Created by Mihlali Mazomba on 2021/07/05.
//

import Foundation
import UIKit

class AlertView: NSObject {

    class func showAlert(view: UIViewController , message: String, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        DispatchQueue.main.async {
            view.present(alert, animated: true, completion: nil)
        }
    }
}
