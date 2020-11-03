//
//  PostsView.swift
//  JsonPlaceholder
//
//  Created by Riccardo on 03/11/2020.
//

import Foundation
import UIKit
import TinyConstraints


class PostsView: UIView {
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        // configure the table view
        return tableView
    }()
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        
        // configure the progress
        activityIndicatorView.hidesWhenStopped = true
        
        return activityIndicatorView
    }()
    
    init() {
        super.init(frame: .zero)
        
        // add the subviews
        addSubviews()
        
        // and setup the contraints
        setupConstraints()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        
        let views = [tableView, activityIndicatorView]
        
        views.forEach {
            addSubview($0)
        }
    }
    
    func setupConstraints() {
        tableView.edgesToSuperview()
        
        activityIndicatorView.edgesToSuperview()
    }
    
    
    
}
