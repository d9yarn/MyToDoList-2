//
//  AddToDoListView.swift
//  MyToDoList-2
//
//  Created by t2023-m0045 on 2023/09/19.
//

import UIKit

class AddToDoListView: UIView {
    
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
    
    let todoLabel: UILabel = {
        let label = UILabel()
        label.text = "Add New ToDo"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        return label
    }()
    
    let startingDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Starting Date"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        return label
    }()
    
    let todoTextField: UITextField = {
        let textField = UITextField()
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.textColor = .gray
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray2.withAlphaComponent(0.2)
        
        return textField
    }()
    
    let dateTextField: UITextField = {
        let textField = UITextField()
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.textColor = .gray
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray2.withAlphaComponent(0.2)
        
        return textField
    }()
    
    let datePicker: UIDatePicker = {
        let pickerView = UIDatePicker()
        pickerView.backgroundColor = .white
        pickerView.preferredDatePickerStyle = .inline
        
        return pickerView
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AddToDoList")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let addToDoListButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add ToDo List", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    
    //MARK: - UI
    
    func configureUI(){
        configureToDoLabel()
        configureToDoTextView()
        configureStartingDateLabel()
        configureStartingDateTextView()
        configureBackgroundImageView()
        configureAddToDoListButton()
        
    }
    
    func configureToDoLabel(){
        addSubview(todoLabel)
        
        todoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todoLabel.widthAnchor.constraint(equalToConstant: 360),
            todoLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            todoLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 80)
        ])
    }
    
    func configureStartingDateLabel(){
        addSubview(startingDateLabel)
        
        startingDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startingDateLabel.widthAnchor.constraint(equalToConstant: 340),
            startingDateLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            startingDateLabel.topAnchor.constraint(equalTo: todoTextField.bottomAnchor, constant: 30)
        ])
    }
    
    func configureToDoTextView(){
        addSubview(todoTextField)
        
        todoTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todoTextField.widthAnchor.constraint(equalToConstant: 340),
            todoTextField.heightAnchor.constraint(equalToConstant: 60),
            todoTextField.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            todoTextField.topAnchor.constraint(equalTo: todoLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func configureStartingDateTextView(){
        addSubview(dateTextField)
        
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateTextField.widthAnchor.constraint(equalToConstant: 350),
            dateTextField.heightAnchor.constraint(equalToConstant: 60),
            dateTextField.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            dateTextField.topAnchor.constraint(equalTo: startingDateLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func configureBackgroundImageView(){
        addSubview(backgroundImageView)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.widthAnchor.constraint(equalToConstant: 350),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 150),
            backgroundImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 100)
        ])
    }
    
    func configureAddToDoListButton(){
        addSubview(addToDoListButton)
        
        addToDoListButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addToDoListButton.widthAnchor.constraint(equalToConstant: 350),
            addToDoListButton.heightAnchor.constraint(equalToConstant: 60),
            addToDoListButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            addToDoListButton.topAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -120)
        ])
    }
}

