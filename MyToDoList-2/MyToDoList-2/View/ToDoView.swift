//
//  ToDoView.swift
//  MyToDoList-2
//
//  Created by t2023-m0045 on 2023/09/18.
//

import UIKit
import CoreData

class ToDoView: UIView {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Properties
    
    lazy var safeArea = safeAreaLayoutGuide
    
    let todoListTitleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ToDoList")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let todoListTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        tableView.layer.cornerRadius = 20
        
        return tableView
    }()
    
    
    //MARK: - UI
    
    private func configureUI(){
        configureToDoListTitleImage()
        setupTableView()
    }
    
    func configureToDoListTitleImage(){
        addSubview(todoListTitleImageView)
        
        todoListTitleImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todoListTitleImageView.widthAnchor.constraint(equalToConstant: 260),
            todoListTitleImageView.heightAnchor.constraint(equalToConstant: 60),
            todoListTitleImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: -5),
            todoListTitleImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 40)
        ])
    }
    
    func setupTableView() {
        addSubview(todoListTableView)
        
        todoListTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todoListTableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 150),
            todoListTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            todoListTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -25),
            todoListTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -60)
        ])
    }
    
    func configureTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        todoListTableView.delegate = delegate
        todoListTableView.dataSource = dataSource
        todoListTableView.reloadData()
    }
}

extension ToDoVC {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListData> {
        return NSFetchRequest<ToDoListData> (entityName: "content")
    }
}
