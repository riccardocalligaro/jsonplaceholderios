//
//  Post.swift
//  JsonPlaceholder
//
//  Created by Riccardo on 03/11/2020.
//

import Foundation

struct Post: Codable, Hashable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

typealias Posts = [Post]
