//
//  ContentView.swift
//  H4XOR by Me
//
//  Created by Aibar Kunanbay on 09.03.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager=NetwordManager()
    var body: some View {
        NavigationView{
            List(networkManager.posts){post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
                
            }
            .navigationBarTitle("H4XOR NEWS")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let post=[
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "As salam"),
//    Post(id: "3", title: "Bonjour")
//]

