//
//  MyPageCollectionViewCell.swift
//  MyToDoList-2
//
//  Created by t2023-m0045 on 2023/09/21.
//

import UIKit

class MyPageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyPageCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    func setImageView(){
        backgroundColor = .systemBlue
        
        addSubview(imageView)
        
    
    }
}
