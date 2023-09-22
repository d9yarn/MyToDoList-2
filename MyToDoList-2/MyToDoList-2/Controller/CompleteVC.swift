//
//  CompleteVC.swift
//  MyToDoList-2
//
//  Created by t2023-m0045 on 2023/09/18.
//

import UIKit

class CompleteVC: UIViewController {
    
    //MARK: - Properties
    
    let completeView = CompleteView()
    
    var completedItems = [ToDoList]()
    var deletedItems: [ToDoList] = []

    var textInputHandler: ((String, Date) -> Void)?
    
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = completeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItemSetting()
        initcompletedItem()
        tableViewDelegate()
        completeDelegate()
    }
    
    
    //MARK: - Settings
    
    func navigationItemSetting(){
        self.navigationItem.title = "Complete"
    }
    
    func initcompletedItem(){
        completedItems.append(ToDoList(todoTitle: "야옹", todoDate: Date()))
    }
    
    func tableViewDelegate(){
        completeView.configureCompleteListTableView(delegate: self, dataSource: self)
        completeView.completeListTableView.register(CompleteListTableViewCell.self, forCellReuseIdentifier: CompleteListTableViewCell.identifier)
    }
    
    func completeDelegate() {
        textInputHandler = { [weak self] text, date in
            let completedItem = ToDoList(todoTitle: text, todoDate: date)
            
            self?.completedItems.append(completedItem)
            self?.completeView.completeListTableView.reloadData()
        }
    }
    
    
    // MARK: - Action
    
    func addCompletedToDoList(_ item: ToDoList) {
        self.completedItems.append(item)
        
        completeView.completeListTableView.reloadData()
    }
    
    func deleteItem(at indexPath: IndexPath){
        if indexPath.row < completedItems.count {
            let deletedItem = completedItems.remove(at: indexPath.row)
            
            completeView.completeListTableView.deleteRows(at: [indexPath], with: .automatic)
            // 데이터 저장 로직 추가
            deletedItems.append(deletedItem)
        }
    }
}


// MARK: - TableView

extension CompleteVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completedItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CompleteListTableViewCell.identifier, for: indexPath) as! CompleteListTableViewCell
        cell.selectionStyle = .none
        
        // completedItems Title
        let todoItem = completedItems[indexPath.row]
        cell.completeListTitleLabel.text = todoItem.todoTitle
        
        // completedItems Date
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "M월 dd일"
        let todoDate = dateFomatter.string(from: todoItem.todoDate!)
        cell.completeListDateLabel.text = todoDate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 셀을 탭할 때 액션시트 띄우기
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let deleteButton = UIAlertAction(title: "삭제하기", style: .destructive) { [weak self] _ in
            print("삭제")
            let confirmationAlert = UIAlertController(title: "삭제 확인", message: "정말 삭제하시겠습니까?", preferredStyle: .alert)
            let cancelConfirmationAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            let confirmDeleteAction = UIAlertAction(title: "확인", style: .destructive) { _ in
                // 여기에서 항목을 삭제합니다.
                self?.deleteItem(at: indexPath)
            }
            
            confirmationAlert.addAction(cancelConfirmationAction)
            confirmationAlert.addAction(confirmDeleteAction)
            
            self?.present(confirmationAlert, animated: true, completion: nil)
        }
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel) { _ in
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        alertController.addAction(deleteButton)
        alertController.addAction(cancelButton)
        
        present(alertController, animated: true, completion: nil)
    }
}
