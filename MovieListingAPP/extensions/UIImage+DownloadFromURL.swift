//
//  UIImage+DownloadFromURL.swift
//  MovieListingAPP
//
//  Created by Mihlali Mazomba on 2021/06/29.
//

import UIKit

extension UIImageView {
    func load(fromStringURL: String) {
        guard let url = URL(string: fromStringURL) else {
            return
        }
        DispatchQueue.global().async {[weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension UIImage {

    public static func loadFrom(fromStringURL: String, completion: @escaping (_ image: UIImage?) -> ()) {
        
        guard let url = URL(string: fromStringURL) else {
            return
        }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

}
