////  HeaderView.swift
// Created: 2019-07-09
//


import UIKit

class HeaderView: UIView {
    
    let imageView:UIImageView
    
    override init(frame: CGRect) {
        imageView = UIImageView(frame:frame)
        imageView.image = UIImage.init(named:"bg-header")
        imageView.contentMode = .scaleAspectFill
        super.init(frame:frame)
        addSubview(imageView)
        backgroundColor = .green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
