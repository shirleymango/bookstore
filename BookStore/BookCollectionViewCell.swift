//
//  BookCollectionViewCell.swift
//  BookStore
//
//  Created by ZhuMacPro on 10/28/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    static let identifier = "bookCell"
    
    private let bookCover: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bookCover)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bookCover.frame = CGRect(x: 5, y: 0, width: contentView.frame.width, height: contentView.frame.size.height)
    }
    
    public func configure(imageURLString: String) {
        let imageURL = URL(string: imageURLString)!
        if let data = try? Data(contentsOf:imageURL) {
            bookCover.image = UIImage(data: data)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // add
    }
}
