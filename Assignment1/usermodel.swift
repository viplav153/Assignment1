//
//  usermodel.swift
//  Assignment1
//
//  Created by Viplav Anand on 13/02/22.
//

import Foundation
import SwiftUI

/*
struct User: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case designation
        case email
    }
    
    var id = UUID()
    var name: String
    var designation: String
    var email: String
}*/

struct User : Codable,Identifiable{
    
    enum CodingKeys: CodingKey {
        case name
        case designation
        case email
        case id
       
    }
    
    
    var name : String
    var designation : String
    var email : String
    var  id  : Int
}


struct Team: Codable {
    enum CodingKeys: CodingKey {
        case ios_team
       
    }
    
    var ios_team : [User]?
}

class ReadData: ObservableObject  {
    @Published var users = [Team]()
    
        
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "empdata", withExtension: "json")//gives url path of empdata.json
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        //print(data!)
        let users = try? JSONDecoder().decode([Team].self, from: data!)
        print(users![0].ios_team!)
        //print(url)
        self.users = users!
        
    }
     
}

