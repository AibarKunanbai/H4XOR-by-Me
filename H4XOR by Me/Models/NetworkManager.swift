//
//  NetworkManager.swift
//  H4XOR by Me
//
//  Created by Aibar Kunanbay on 09.03.2022.
//

import Foundation
class NetwordManager: ObservableObject{
    @Published var posts = [Post]()
    func fetchData(){
        if let url=URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session=URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error==nil{
                    let decode=JSONDecoder()
                    if let safedata = data {
                        do{
                            let results = try decode.decode(Result.self, from: safedata)
                            DispatchQueue.main.async {
                                self.posts=results.hits

                            }
                        } catch {
                            print(error)
                        }
                    }
                    
                }
                
            }
            task.resume()
        }
    }
    
}
