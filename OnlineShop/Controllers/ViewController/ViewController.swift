//
//  ViewController.swift
//  OnlineShop
//
//  Created by Mac on 27/12/22.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {
    
    var itemList: ItemModel?
   
    
    weak var mainCollectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        fetchData()
    }

    //MARK: - init Function -
    func initView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        
        let mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(mainCollectionView)
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.backgroundColor = .white
        mainCollectionView.register(mainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        mainCollectionView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        self.mainCollectionView = mainCollectionView
    }
    
    //MARK: - fetchData function -
    func fetchData() {

            // url

            let url = URL(string: "https://dummyjson.com/products")

            // dataTask

            let dataTask = URLSession.shared.dataTask(with: url!) { (data , res , error) in

                guard let data = data , error == nil else {

                    print("Error is \(String(describing: error))")
                    return
                }
                var cList: ItemModel?

                do {
                    cList = try JSONDecoder().decode(ItemModel.self, from: data)
                    print(data)
                }
                catch let error{
                    fatalError("\(error)")
                }
                
                guard let result = cList else {
                    print("oo nima gap")
                    return
                }
                
                let product = result.products
               
                self.itemList = ItemModel(products: product)

                DispatchQueue.main.async {
                    self.mainCollectionView?.reloadData()

                }
            }
            dataTask.resume()
        }
}

//MARK: - collection delegate, dataSourse -
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return itemList?.products.count ?? 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! mainCollectionViewCell
        
        cell.backgroundColor = .systemGray6
        
        cell.title.text = "\(self.itemList?.products[indexPath.row].title ?? "0")"
        cell.price.text = "\(self.itemList?.products[indexPath.row].price ?? 0) $"
        cell.discount.text = "\(self.itemList?.products[indexPath.row].discountPercentage ?? 0) %"
        cell.rating.text = "\(self.itemList?.products[indexPath.row].rating ?? 0) ⭐️"
        cell.brand.text = "\(self.itemList?.products[indexPath.row].brand ?? "0")"
        let url = URL(string: "\(self.itemList?.products[indexPath.row].thumbnail ?? "0")")
        cell.itemImage.kf.setImage(with: url)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (view.frame.width), height: (view.frame.height) / 5)
    }
}
