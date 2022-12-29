//
//  ItemModel.swift
//  OnlineShop
//
//  Created by Mac on 28/12/22.
//

import Foundation

struct ItemModel: Decodable {
    
    let products: [Products]
}

struct Products: Decodable {
    
    let id                      : Int
    let title                   : String
    let description             : String
    let price                   : Int
    let discountPercentage      : Float
    let rating                  : Float
    let stock                   : Int
    let brand                   : String
    let category                : String
    let thumbnail               : String
    let images                  : Array<String>
}
