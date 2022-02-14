//
//  ContentView.swift
//  Assignment 1.0
//
//  Created by Varun Singh on 11/02/22.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var res = ReadFile()
        
    var body: some View {
        List(res.members){ user in
            HStack(alignment: .center, spacing: 80){
//                Image("Avatar").resizable().frame(width: 30, height: 30)
//                    .foregroundColor(Color.cyan)
                AsyncImage(
                  url: URL(string: user.avatar),
                  content: { image in
                  image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                }, placeholder: {
                  Color.gray
                })
                    .aspectRatio(contentMode: .fit)
                            .frame(width:50, height:50)
                            .clipShape(Circle())
                            .shadow(radius: 1)
                            .overlay(Circle().stroke(Color.red, lineWidth: 2))
                
                VStack(alignment: .leading, spacing: 5){
                    
                    HStack(alignment: .top,spacing: 10) {
                        
                        Text(user.first_name)
                            .font(.title2)
                            .fontWeight(.light)
                            .foregroundColor(Color.gray)
                        
                        Text(user.last_name)
                            .font(.title2)
                            .fontWeight(.light)
                            .foregroundColor(Color.gray)
                    }
                    HStack(alignment: .center, spacing:5){
                        Text(user.email).font(.caption2).foregroundColor(Color.brown)
                    }
                }


            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
