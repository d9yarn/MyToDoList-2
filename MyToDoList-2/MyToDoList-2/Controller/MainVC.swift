//
//  MainVC.swift
//  MyToDoList-2
//
//  Created by t2023-m0045 on 2023/09/18.
//

import UIKit

class MainVC: UIViewController {
    
    let mainView = MainView()
    
    var sav: ((MainVC) -> Void)?
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMainView()
    }
    
    private func setMainView() {
        
        mainView.todoButton.addTarget(self, action: #selector(todoButtonTapped(_:)), for: .touchUpInside)
        mainView.completeButton.addTarget(self, action: #selector(completeButtonTapped(_:)), for: .touchUpInside)
        mainView.myPageButton.addTarget(self, action: #selector(myPageButtonTapped(_:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        changeButtonColor(button: mainView.todoButton, backgroundColor: .white, titleColor: .systemBlue)
        changeButtonColor(button: mainView.completeButton, backgroundColor: .white, titleColor: .systemCyan)
        changeButtonColor(button: mainView.myPageButton, backgroundColor: .white, titleColor: .gray)
    }
    
    
    // MARK: - Action
    
    @objc func todoButtonTapped(_ button: UIButton){
        changeButtonColor(button: mainView.todoButton, backgroundColor: .systemBlue, titleColor: .white)
        let todoVC = ToDoVC()
        
        sendToDoList?.(ToDoList)
        
        }
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.pushViewController(todoVC, animated: true)
    }
    
    @objc func completeButtonTapped(_ button: UIButton){
        changeButtonColor(button: mainView.completeButton, backgroundColor: .systemCyan, titleColor: .white)
        let completeVC = CompleteVC()
        
        
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.pushViewController(completeVC, animated: true)
    }
    
    @objc func myPageButtonTapped(_ button: UIButton){
        changeButtonColor(button: mainView.myPageButton, backgroundColor: .gray, titleColor: .white)
        let tabBarController = TabBar()
        
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.pushViewController(tabBarController, animated: true)
//        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    //MARK: - 
    private func changeButtonColor(button: UIButton, backgroundColor: UIColor, titleColor: UIColor) {
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
    }
    
}


