//
//  AddToDoListVC.swift
//  MyToDoList-2
//
//  Created by t2023-m0045 on 2023/09/19.
//

import UIKit

//
//protocol AddToDoDelegate: AnyObject {
//    func newToDoList(data: ToDoList)
//}


class AddToDoListVC: UIViewController {
    
    //MARK: - Properties
    
    let addToDoListView = AddToDoListView()
    
    var selectedDate: Date?
    var textInputHandler: ((String, Date) -> Void)?
    
    let todoTextViewPlaceHolder: String = "할일을 입력해주세요."
    let dateTextViewPlaceHolder: String = "날짜를 입력해주세요."
    
    
    
    //MARK: - Life Cycle
    
    override func loadView() {
        view = addToDoListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextViewPlaceHorder()
        setDatePickerView()
        setAddToDoListButtonTapped()
    }
    
    
    //MARK: - Settings
    
    private func setTextViewPlaceHorder() {
        // 플레이스 홀더 설정
        addToDoListView.todoTextField.placeholder = todoTextViewPlaceHolder
        addToDoListView.dateTextField.placeholder = dateTextViewPlaceHolder
    }
    
    private func setDatePickerView() {
        setDatePickerToolBar()
        // 데이트피커 설정
        addToDoListView.datePicker.datePickerMode = .date
        addToDoListView.dateTextField.inputView = addToDoListView.datePicker
    }
    
    private func setDatePickerToolBar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target : nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        addToDoListView.dateTextField.inputAccessoryView = toolbar
    }
    
    private func setAddToDoListButtonTapped(){
        addToDoListView.addToDoListButton.addTarget(self, action: #selector(addToDoListButtonTapped), for: .touchUpInside)
    }
    
    
    // MARK: - Actions
    
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateFormat = "M월 dd일"
        
        addToDoListView.dateTextField.text = formatter.string(from: addToDoListView.datePicker.date)
        selectedDate = addToDoListView.datePicker.date
        self.view.endEditing(true)
    }
    
    @objc func addToDoListButtonTapped() {
        // 할일과 날짜를 입력하지 않았을 때 띄우는 알림창
        guard let todoText = addToDoListView.todoTextField.text, !todoText.isEmpty,
              let dateText = addToDoListView.dateTextField.text, !dateText.isEmpty
        else {
            // 하나 이상의 필수 입력값이 누락된 경우
            showAlert(message: "할일과 날짜를 모두 입력하세요.")
            return
        }
        
        // 클로저를 통한 데이터 전달
        if let selectedDate = selectedDate {
            textInputHandler?(todoText, selectedDate)
        }
        
        let addToDoConfirmAlet = UIAlertController(title: "확인", message: "할 일을 추가하시겠습니까?", preferredStyle: .alert)
        let cancelConfirmAction = UIAlertAction(title: "취소", style: .cancel) { _ in
            print("할일 추가 취소")
        }
        let confirmAddAction = UIAlertAction(title: "확인", style: .default) { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }
        addToDoConfirmAlet.addAction(cancelConfirmAction)
        addToDoConfirmAlet.addAction(confirmAddAction)
        
        present(addToDoConfirmAlet, animated: true, completion: nil)
    }
    
    
    //MARK: - Helpers
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
