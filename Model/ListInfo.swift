//
//  ListInfo.swift
//  srikar
//
//  Created by epita on 01/07/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import Foundation

struct ListInfo: Codable {
    let results: [Contact]
}

struct Contact: Codable {
    let gender: String
    let name: ContactName
    let location: Place
    let email: String
    let phone: String
    let cell: String
    let picture: Picture
}
struct ContactName: Codable {
    let title:String
    let first:String
    let last:String
}
struct Place: Codable {
    let street:String
    let city:String
}
struct Picture: Codable {
    let large: String
    let thumbnail: String
}
