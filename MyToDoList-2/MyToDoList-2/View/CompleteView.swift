//
//  CompleteView.swift
//  MyToDoList-2
//
//  Created by t2023-m0045 on 2023/09/18.
//

import UIKit

class CompleteView: UIView {
   
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
    
    let completeListTitleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "CompleteList")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let completeListTableView: UITableView = {
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
        addSubview(completeListTitleImageView)
        
        completeListTitleImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            completeListTitleImageView.widthAnchor.constraint(equalToConstant: 260),
            completeListTitleImageView.heightAnchor.constraint(equalToConstant: 60),
            completeListTitleImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: -5),
            completeListTitleImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 40)
        ])
    }
    
    func setupTableView() {
        addSubview(completeListTableView)
        
        completeListTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            completeListTableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 150),
            completeListTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            completeListTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -25),
            completeListTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -60)
        ])
    }
    
    func configureCompleteListTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        completeListTableView.delegate = delegate
        completeListTableView.dataSource = dataSource
        completeListTableView.reloadData()
    }
}
