//
//  PostsViewModel.swift
//  JsonPlaceholder
//
//  Created by Riccardo on 04/11/2020.
//

import Foundation
import Combine


enum PostViewModelState {
    case loading
    case loaded
    case error(Error)
}

final class PostsViewModel {
    @Published var posts = Posts()
    
    private var bindings = Set<AnyCancellable>()
    
    init() {
        posts.append(Post(userId: 1, id: 1, title: "Hello world", body: "Body"))
        posts.append(Post(userId: 2, id: 2, title: "Hello world", body: "Body"))
        posts.append(Post(userId: 3, id: 3, title: "Hello world", body: "Body"))
        posts.append(Post(userId: 4, id: 4, title: "Hello world", body: "Body"))
        posts.append(Post(userId: 5, id: 5, title: "Hello world", body: "Body"))
        posts.append(Post(userId: 6, id: 6, title: "Hello world", body: "Body"))
        posts.append(Post(userId: 8, id: 7, title: "Hello world", body: "Body"))
    }
    
    
    func clearPosts() {
        posts.removeAll()
    }
}
