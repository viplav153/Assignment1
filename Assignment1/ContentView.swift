//
//  ContentView.swift
//  Assignment1
//
//  Created by Viplav Anand on 11/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var datas = ReadData()
       
       var body: some View {
           
           
           
           
           List(datas.users[0].ios_team!){ user in
               
               VStack(alignment: .leading) {
                   
                   Text(user.name)
                       .font(.title)
                       .fontWeight(.heavy)
                       .foregroundColor(Color.gray)
                       
                   HStack{
                       Text(user.designation)
                           .font(.title3)
                           .foregroundColor(Color.red)
                           
                       Spacer()
                       Text(user.email)
                           .font(.title3)
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

