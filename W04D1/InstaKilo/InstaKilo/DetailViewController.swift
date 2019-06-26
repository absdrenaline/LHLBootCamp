////  DetailViewController.swift
// Created: 2019-06-26
//


import UIKit

class DetailViewController : UIViewController {
    
    var image:UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        imageView.image = image
    }
    
}

