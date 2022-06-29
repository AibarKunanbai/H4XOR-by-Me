//
//  PostData.swift
//  H4XOR by Me
//
//  Created by Aibar Kunanbay on 09.03.2022.
//

import Foundation

struct Result: Decodable{
    let hits: [Post]
}
struct Post : Decodable , Identifiable{
    var id: String{
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url : String?
}
