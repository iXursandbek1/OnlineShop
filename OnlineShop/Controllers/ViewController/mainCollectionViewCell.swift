//
//  mainCollectionViewCell.swift
//  OnlineShop
//
//  Created by Mac on 27/12/22.
//

import UIKit
import SnapKit

class mainCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlest -
    let itemImage = UIImageView()
    let title = UILabel()
    let price = UILabel()
    let discount = UILabel()
    let rating = UILabel()
    let brand = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        
        self.addSubview(itemImage)
        itemImage.contentMode = .scaleAspectFit
        itemImage.snp.makeConstraints{make in
            make.centerY.equalToSuperview()
            make.height.equalTo(self.snp.height).multipliedBy(0.9)
            make.width.equalTo(self.snp.width).multipliedBy(0.35)
            make.left.equalTo(self.snp.left).offset(10)
        }
        
        self.addSubview(title)
        title.contentMode = .left
        title.textColor = .black
        title.text = "Title"
        title.font = .boldSystemFont(ofSize: 15)
        title.snp.makeConstraints{ make in
            make.top.equalTo(itemImage.snp.top).offset(20)
            make.left.equalTo(itemImage.snp.right).offset(30)
            make.right.equalTo(self.snp.right).offset(-20)
        }
        
        self.addSubview(price)
        price.contentMode = .left
        price.textColor = .systemGreen
        price.text = "Price"
        price.font = .systemFont(ofSize: 18)
        price.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.left.equalTo(itemImage.snp.right).offset(30)
            make.width.equalTo(title.snp.width).multipliedBy(0.45)
        }
        
        self.addSubview(discount)
        discount.contentMode = .left
        discount.textColor = .systemGreen
        discount.text = "discount"
        discount.font = .systemFont(ofSize: 18)
        discount.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.right.equalTo(title.snp.right)
            make.width.equalTo(title.snp.width).multipliedBy(0.45)
        }
        
        self.addSubview(brand)
        brand.contentMode = .left
        brand.textColor = .black
        brand.text = "brand"
        brand.font = .systemFont(ofSize: 14)
        brand.snp.makeConstraints{ make in
            make.bottom.equalTo(itemImage.snp.bottom)
            make.left.equalTo(itemImage.snp.right).offset(30)
            make.width.equalTo(title.snp.width).multipliedBy(0.45)
        }
        
        self.addSubview(rating)
        rating.contentMode = .left
        rating.textColor = .systemGray
        rating.text = "rating"
        rating.font = .systemFont(ofSize: 18)
        rating.snp.makeConstraints{ make in
            make.bottom.equalTo(itemImage.snp.bottom)
            make.right.equalTo(title.snp.right)
            make.width.equalTo(title.snp.width).multipliedBy(0.45)
        }
    }
}
