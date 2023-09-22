//
//  MainView.swift
//  MyToDoList-2
//
//  Created by t2023-m0045 on 2023/09/19.
//

import UIKit

class MainView: UIView {
    
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
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.5
        
        return imageView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile4")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 100
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        
        return imageView
    }()
    
    lazy var todoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("To Do", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
       
        return button
    }()
    
    lazy var completeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Complete", for: .normal)
        button.setTitleColor(UIColor.systemCyan, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemCyan.cgColor
        
        return button
    }()
    
    lazy var myPageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("My Page", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        
        return button
    }()
    
    
    
    //MARK: - UI
    
    func configureUI(){
        configureBackgroundImage()
        configureprofileImage()
        configureToDoButton()
        configureCompleteButton()
        configureMyPageButton()
    }
    
    func configureBackgroundImage(){
        addSubview(backgroundImageView)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.widthAnchor.constraint(equalToConstant: 400),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 900),
        ])
    }
    
    func configureprofileImage(){
        addSubview(profileImageView)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 200),
            profileImageView.heightAnchor.constraint(equalToConstant: 200),
            profileImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100)
        ])
    }
    
    func configureToDoButton(){
        addSubview(todoButton)
        
        todoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todoButton.widthAnchor.constraint(equalToConstant: 300),
            todoButton.heightAnchor.constraint(equalToConstant: 60),
            todoButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            todoButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 440)
        ])
    }
    
    func configureCompleteButton(){
        addSubview(completeButton)
        
        completeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            completeButton.widthAnchor.constraint(equalToConstant: 300),
            completeButton.heightAnchor.constraint(equalToConstant: 60),
            completeButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            completeButton.topAnchor.constraint(equalTo: todoButton.topAnchor, constant: 77)
        ])
    }
    
    func configureMyPageButton(){
        addSubview(myPageButton)
        
        myPageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myPageButton.widthAnchor.constraint(equalToConstant: 300),
            myPageButton.heightAnchor.constraint(equalToConstant: 60),
            myPageButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            myPageButton.topAnchor.constraint(equalTo: completeButton.topAnchor, constant: 77)
        ])
    }
}

