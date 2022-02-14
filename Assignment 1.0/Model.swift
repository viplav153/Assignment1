//
//  Model.swift
//  Assignment 1.0
//
//  Created by Varun Singh on 11/02/22.
//

import Foundation

struct Team: Codable,Identifiable {
    enum CodingKeys: CodingKey {
        case first_name
        case last_name
        case avatar
        case email
        case emp_id
    }
    var id = UUID()
    var first_name: String
    var last_name: String
    var avatar: String
    var email: String
    var emp_id: String
}

class ReadFile: ObservableObject{
    @Published var members = [Team]()
    init(){
        load()
    }
    func load(){
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json")
        else{
            print("File Not Found")
            return
        }
        let data = try?Data(contentsOf: url)
        let members = try?JSONDecoder().decode([Team].self, from: data!)
        self.members = members!
    }
    
}
