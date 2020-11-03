//
//  PostsViewController.swift
//  JsonPlaceholder
//
//  Created by Riccardo on 03/11/2020.
//

import UIKit
import Combine

enum PostSection {
    case posts
}

class PostsViewController: UIViewController {
    
    private var bindings = Set<AnyCancellable>()
    
    private let viewModel: PostsViewModel
    
    private lazy var postsView = PostsView()
    
    // diffable data sources
    typealias DataSource = UITableViewDiffableDataSource<PostSection, Post>
    typealias Snapshot = NSDiffableDataSourceSnapshot<PostSection, Post>
    
    private lazy var dataSource = makeDataSource()
    
    
    let reuseIdentifier = "PostCellReuseIdentifier"
    
    init(viewModel: PostsViewModel = PostsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = postsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Posts"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // set the table view delegate and data source
        setupTableView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(addTapped))

    }
    
    @objc func addTapped() {
        viewModel.clearPosts()
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        viewModel.$posts.sink {
            self.applySnapshot(posts: $0)
        }.store(in: &bindings)
    }
    
    
    func setupTableView() {
        postsView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        postsView.tableView.delegate = self
        
        postsView.tableView.dataSource = dataSource
    }
    
    private func makeDataSource() -> DataSource {
        return DataSource(tableView: postsView.tableView, cellProvider: { tableView, indexPath, post in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier)
            cell?.textLabel?.text = post.title
            return cell
        }
        )
    }
    
    func applySnapshot(posts: Posts) {
        var snapshot = Snapshot()
        
        snapshot.appendSections([.posts])
        snapshot.appendItems(posts)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension PostsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
