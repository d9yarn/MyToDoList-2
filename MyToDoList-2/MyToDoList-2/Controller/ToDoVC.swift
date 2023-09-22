//
//  ToDoVC.swift
//  MyToDoList-2
//
//  Created by t2023-m0045 on 2023/09/18.
//

import UIKit

class ToDoVC: UIViewController {
    
    
    //MARK: - Properties
    
    let todoView = ToDoView()
    
    var todoItems = [ToDoList]()
    var selectedDate: Date?
    
    var textInputHandler: ((String, Date) -> Void)?
    var updateToDo: [ToDoList] = []
   
    
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = todoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initToDoItems()
        navigationItemSetting()
        tableViewDelegate()
    }
    
    
    //MARK: - Settings
    
    func initToDoItems(){
        todoItems.append(ToDoList(todoTitle: "강아지", todoDate: Date()))
        todoItems.append(ToDoList(todoTitle: "고양이", todoDate: Date()))
    }
    
    func navigationItemSetting(){
        self.navigationItem.title = "ToDo List"
        let rightButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonTapped(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    func tableViewDelegate(){
        todoView.configureTableView(delegate: self, dataSource: self)
        todoView.todoListTableView.register(ToDoListTableViewCell.self, forCellReuseIdentifier: ToDoListTableViewCell.identifier)
    }
    
    
    // MARK: - Action
    
    func addNewToDoList(_ item: ToDoList) {
        todoItems.append(item)
        
        todoView.todoListTableView.reloadData()
    }
    
    @objc func addButtonTapped(_ button: UIButton){
        let addToDoListVC = AddToDoListVC()
        
        addToDoListVC.textInputHandler = { [weak self] text, date in
            let newToDoItem = ToDoList(todoTitle: text, todoDate: date)
            
            self?.updateToDo.append(newToDoItem)
            self?.todoView.todoListTableView.reloadData()
            
            // 데이터 저장 로직
        }
        self.present(addToDoListVC, animated: true)
    }
    
    
    func updateItem(at indexPath: IndexPath, with newText: String) {
        // indexPath에 해당하는 항목을 newText로 업데이트
        if indexPath.row < todoItems.count {
            todoItems[indexPath.row].todoTitle = newText
            
            DispatchQueue.main.async {
                self.todoView.todoListTableView.reloadRows(at: [indexPath], with: .automatic)
            }
            // 데이터 저장 로직 추가
        }
    }
    
    func completeItem(at indexPath: IndexPath){
        if indexPath.row < todoItems.count {
            let completedItem = todoItems.remove(at: indexPath.row)
            
            // 클로저를 이용한 데이터 전달
            textInputHandler?(completedItem.todoTitle, Date())
            
            todoView.todoListTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func deleteItem(at indexPath: IndexPath){
        if indexPath.row < todoItems.count {
            var deletedItem = todoItems.remove(at: indexPath.row)
            
            todoView.todoListTableView.deleteRows(at: [indexPath], with: .automatic)
            // deletedItems.append(deletedItem)
        }
        // 데이터 저장 로직 추가
    }
}


// MARK: - TableView

extension ToDoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ToDoListTableViewCell.identifier, for: indexPath) as! ToDoListTableViewCell
        cell.selectionStyle = .none
        
        // todoItem Title
        let todoItem = todoItems[indexPath.row]
        cell.todoListTitleLabel.text = todoItem.todoTitle
        
        // todoItem Date
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "M월 dd일"
        let todoDate = dateFomatter.string(from: todoItem.todoDate!)
        cell.todoListDateLabel.text = todoDate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 셀을 탭할 때 액션시트 띄우기
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // Edit
        let editButton = UIAlertAction(title: "수정하기", style: .default) { [weak self] _ in
            let alert = UIAlertController(title: "할일 수정하기", message: "", preferredStyle: .alert)
            print("수정")
            
            alert.addTextField { textField in
                textField.placeholder = "수정할 내용을 입력해주세요."
                // 텍스트필드의 높이 조절
                if let textField = alertController.textFields?.first {
                    textField.heightAnchor.constraint(equalToConstant: 25).isActive = true // 높이를 원하는 크기로 조절
                }
            }
            
            let cancelButton = UIAlertAction(title: "취소", style: .cancel) { _ in
                tableView.deselectRow(at: indexPath, animated: true)
                print("수정하기 취소")
            }
            
            let saveButton = UIAlertAction(title: "저장", style: .default) { [weak self] _ in
                if let newText = alert.textFields?.first?.text, !newText.isEmpty {
                    self?.updateItem(at: indexPath, with: newText)
                    print("수정내용 저장")
                }
            }
            alert.addAction(cancelButton)
            alert.addAction(saveButton)
            self?.present(alert, animated: true, completion: nil)
        }
        
        // Complete
        let completeButton = UIAlertAction(title: "완료하기", style: .default) { [weak self] _ in
            print("완료")
            
            let confirmationAlert = UIAlertController(title: "완료 확인", message: "할일을 완료하시겠습니까?", preferredStyle: .alert)
            let cancelConfirmationAction = UIAlertAction(title: "취소", style: .cancel) { _ in
                tableView.deselectRow(at: indexPath, animated: true)
                print("완료하기 취소")
            }
            
            let confirmCompleteAction = UIAlertAction(title: "확인", style: .destructive) { _ in
                self?.completeItem(at: indexPath)
            }
            confirmationAlert.addAction(cancelConfirmationAction)
            confirmationAlert.addAction(confirmCompleteAction)
            
            self?.present(confirmationAlert, animated: true, completion: nil)
        }
        
        // Delete
        let deleteButton = UIAlertAction(title: "삭제하기", style: .destructive) { [weak self] _ in
            print("삭제")
            let confirmationAlert = UIAlertController(title: "삭제 확인", message: "정말 삭제하시겠습니까?", preferredStyle: .alert)
            let cancelConfirmationAction = UIAlertAction(title: "취소", style: .cancel) { _ in
                tableView.deselectRow(at: indexPath, animated: true)
                print("삭제하기 취소")
            }
            
            let confirmDeleteAction = UIAlertAction(title: "확인", style: .destructive) { _ in
                self?.deleteItem(at: indexPath)
            }
            confirmationAlert.addAction(cancelConfirmationAction)
            confirmationAlert.addAction(confirmDeleteAction)
            
            self?.present(confirmationAlert, animated: true, completion: nil)
        }
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel) { _ in
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        alertController.addAction(editButton)
        alertController.addAction(completeButton)
        alertController.addAction(deleteButton)
        alertController.addAction(cancelButton)
        
        present(alertController, animated: true, completion: nil)
    }
}
