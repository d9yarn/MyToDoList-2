//
//  TabBar.swift
//  MyToDoList-2
//
//  Created by t2023-m0045 on 2023/09/19.
//

import UIKit

class TabBar: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

        let myPageVC = MyPageVC()
        myPageVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house.fill"), selectedImage: nil)

        viewControllers = [myPageVC]
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController is MyPageVC {
            if let mainVC = viewControllers?.first as? MainVC {                navigationController?.popToViewController(mainVC, animated: true)
            }
        }
    }
}

