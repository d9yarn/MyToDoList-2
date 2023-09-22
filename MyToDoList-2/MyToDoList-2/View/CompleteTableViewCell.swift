//
//  CompleteTableViewCell.swift
//  MyToDoList-2
//
//  Created by t2023-m0045 on 2023/09/20.
//

import UIKit

class CompleteListTableViewCell: UITableViewCell {

    //MARK: - Properties
    
    static let identifier = "CompleteCell"
    
    var todoView = ToDoView()
    
    lazy var safeArea = safeAreaLayoutGuide
    
    let completeListTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    let completeListDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .right
        
        return label
    }()
    
    
    //MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude) // 구분선 제거
        configureUI()
        
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    //MARK: - UI
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            contentView.layer.cornerRadius = 18
            contentView.layer.borderWidth = 2
            contentView.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.5).cgColor
        } else {
            contentView.layer.cornerRadius = 18
            contentView.layer.borderWidth = 1
            contentView.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        }
    }
    
    override func layoutSubviews() {
        // 테이블 뷰 셀 사이의 간격
        super.layoutSubviews()
        
        contentView.backgroundColor = .white
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 12, left: 10, bottom: 0, right: 10))
       
    }
    
    func configureUI(){
        configureToDoListTitleLabel()
        contigureToDoListDateLabel()
    }
    
    func configureToDoListTitleLabel(){
        contentView.addSubview(completeListTitleLabel)
        
        completeListTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            completeListTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            completeListTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            completeListTitleLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func contigureToDoListDateLabel(){
        contentView.addSubview(completeListDateLabel)
        
        completeListDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            completeListDateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            completeListDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            completeListDateLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
