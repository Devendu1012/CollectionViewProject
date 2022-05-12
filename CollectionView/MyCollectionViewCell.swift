//
//  MyCollectionViewCell.swift
//  CollectionView
//
//  Created by DevenduTiwari on 10/05/22.
//

import UIKit

import Foundation

struct DogImage : Codable {
    let status: String
    let message: String
}

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = "MyCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    public func configure(with image: UIImage){
//        imageView.image = image
//    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    func fetchImage(){
        let imageAPI = URL(string: "https://dog.ceo/api/breeds/image/random")
        let task = URLSession.shared.dataTask(with: imageAPI!) { (data, response, error) in
            guard let data = data else{
                return
            }
            let decoder = JSONDecoder()
            let imageData = try! decoder.decode(DogImage.self, from: data)
            guard let imageURL = URL(string: imageData.message) else {
                return
            }
            let task = URLSession.shared.dataTask(with: imageURL, completionHandler: {(data, response, error) in
                guard let data = data else {
                    return
                }
                let downloadedImage = UIImage(data: data)
                DispatchQueue.main.async {
                    self.imageView.image = downloadedImage
                }
            })
            task.resume()
        }
        task.resume()
    }
}
