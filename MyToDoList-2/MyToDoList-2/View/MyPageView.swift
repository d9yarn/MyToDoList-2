//
//  MyPage.swift
//  MyToDoList-2
//
//  Created by t2023-m0045 on 2023/09/19.
//

import UIKit

class MyPageView: UIView {
    
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
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "KingCloud"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        return label
    }()
    
    let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "MenuIcon"), for: .normal)
        button.contentMode = .scaleAspectFill
        
        return button
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile4")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 45
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.2).cgColor
        
        return imageView
    }()
    
    let numbersOfPostLabel: UILabel = {
        let label = UILabel()
        label.text = "7"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        return label
    }()
    
    let numbersOfFollowerLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        return label
    }()
    
    let numbersOfFollowingLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        return label
    }()
    
    let postLabel: UILabel = {
        let label = UILabel()
        label.text = "post"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        
        return label
    }()
    
    let followerLabel: UILabel = {
        let label = UILabel()
        label.text = "follower"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        
        return label
    }()
    
    let followingLabel: UILabel = {
        let label = UILabel()
        label.text = "following"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        
        return label
    }()
    
    let userNickNameLabel: UILabel = {
        let label = UILabel()
        label.text = "킹구름"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14.5, weight: .bold)
        
        return label
    }()
    
    let userInfomationLabel: UILabel = {
        let label = UILabel()
        label.text = "안녕하새오 시고르자브종 구르미애오🐶"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        return label
    }()
    
    let userUrlLabel: UILabel = {
        let label = UILabel()
        label.text = "spartacodingclub.kr"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        return label
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        return button
    }()
    
    
    let messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Message", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        return button
    }()
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .lightGray
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
        
        return button
    }()
    
    let divider: UIView = {
        let path = UIView()
        path.backgroundColor = .lightGray
        
        return path
    }()
    
    let gridImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Grid")
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black
        
        return imageView
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(MyPageCollectionViewCell.self, forCellWithReuseIdentifier: "MyPageCell")
        
        return collectionView
    }()
    
    
    //MARK: - Helpers
    
    func createDivider() -> UIView {
        let divider = UIView()
        divider.backgroundColor = .lightGray
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        return divider
    }
    
    func setUpCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        collectionView.reloadData()
    }
    
    
    //MARK: - UI
    
    func configureUI(){
        configureUserInfo()
        configureUserFollowInfo()
        configureCollectionView()
    }
    
    
    //MARK: - UserInfo
    
    func configureUserInfo(){
        configureUserNameLabel()
        configureMeneButton()
        configureProfileImageView()
        configureUserNickNameLabel()
        configureUserInfomationLabel()
        configureUserUrlLabel()
        
        configureFollowButton()
        configureMessageButton()
        configureMoreButton()
        configureDivider()
        configureGridImageView()
    }
    
    func configureUserNameLabel(){
        addSubview(userNameLabel)
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNameLabel.widthAnchor.constraint(equalToConstant: 150),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20),
            userNameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: -32),
            userNameLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureMeneButton(){
        addSubview(menuButton)
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuButton.widthAnchor.constraint(equalToConstant: 27),
            menuButton.heightAnchor.constraint(equalToConstant: 27),
            menuButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: -35),
            menuButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20)
        ])
    }
    
    func configureProfileImageView(){
        addSubview(profileImageView)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 90),
            profileImageView.heightAnchor.constraint(equalToConstant: 90),
            profileImageView.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 20),
            profileImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15)
            
        ])
    }
    
    func configureUserNickNameLabel(){
        addSubview(userNickNameLabel)
        
        userNickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNickNameLabel.widthAnchor.constraint(equalToConstant: 300),
            userNickNameLabel.heightAnchor.constraint(equalToConstant: 15),
            userNickNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            userNickNameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)
        ])
    }
    
    func configureUserInfomationLabel(){
        addSubview(userInfomationLabel)
        
        userInfomationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userInfomationLabel.widthAnchor.constraint(equalToConstant: 300),
            userInfomationLabel.heightAnchor.constraint(equalToConstant: 14),
            userInfomationLabel.topAnchor.constraint(equalTo: userNickNameLabel.bottomAnchor, constant: 7),
            userInfomationLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)
        ])
    }
    
    func configureUserUrlLabel(){
        addSubview(userUrlLabel)
        
        userUrlLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userUrlLabel.widthAnchor.constraint(equalToConstant: 300),
            userUrlLabel.heightAnchor.constraint(equalToConstant: 14),
            userUrlLabel.topAnchor.constraint(equalTo: userInfomationLabel.bottomAnchor, constant: 4),
            userUrlLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)
        ])
    }
    
    func configureFollowButton(){
        addSubview(followButton)
        
        followButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followButton.widthAnchor.constraint(equalToConstant: 158),
            followButton.heightAnchor.constraint(equalToConstant: 30),
            followButton.topAnchor.constraint(equalTo: userUrlLabel.bottomAnchor, constant: 15),
            followButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16)
        ])
    }
    
    func configureMessageButton(){
        addSubview(messageButton)
        
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageButton.widthAnchor.constraint(equalToConstant: 158),
            messageButton.heightAnchor.constraint(equalToConstant: 30),
            messageButton.topAnchor.constraint(equalTo: userUrlLabel.bottomAnchor, constant: 15),
            messageButton.leadingAnchor.constraint(equalTo: followButton.trailingAnchor, constant: 8)
        ])
    }
    
    func configureMoreButton(){
        addSubview(moreButton)
        
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moreButton.widthAnchor.constraint(equalToConstant: 30),
            moreButton.heightAnchor.constraint(equalToConstant: 30),
            moreButton.topAnchor.constraint(equalTo: userUrlLabel.bottomAnchor, constant: 15),
            moreButton.leadingAnchor.constraint(equalTo: messageButton.trailingAnchor, constant: 8)
        ])
    }
    
    func configureDivider(){
        let divider1 = createDivider()
        let divider2 = createDivider()
        let divider3 = createDivider()
        
        addSubview(divider1)
        addSubview(divider2)
        addSubview(divider3)
        
        NSLayoutConstraint.activate([
            divider1.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 20),
            divider1.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            divider1.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            divider1.heightAnchor.constraint(equalToConstant: 0.2),
            
            divider2.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 60),
            divider2.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            divider2.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            divider2.heightAnchor.constraint(equalToConstant: 0.2),
            
            divider3.topAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20),
            divider3.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            divider3.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            divider3.heightAnchor.constraint(equalToConstant: 0.2)
        ])
    }
    
    func configureGridImageView(){
        addSubview(gridImageView)
        
        gridImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gridImageView.widthAnchor.constraint(equalToConstant: 25),
            gridImageView.heightAnchor.constraint(equalToConstant: 25),
            gridImageView.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 28),
            gridImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16)
        ])
    }
    func configureCollectionView(){
        addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 60),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20)
        ])
    }
    
    
    
    //MARK: - UserFollowInfo
    
    func configureUserFollowInfo(){
        configureNumbersOfPostLabel()
        configurePostLabel()
        configureNumbersOfFollowerLabel()
        configureFollowerLabel()
        configureNumbersOfFollowingLabel()
        configureFollowingLabel()
    }
    
    func configureNumbersOfPostLabel(){
        addSubview(numbersOfPostLabel)
        
        numbersOfPostLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numbersOfPostLabel.widthAnchor.constraint(equalToConstant: 20),
            numbersOfPostLabel.heightAnchor.constraint(equalToConstant: 20),
            numbersOfPostLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 45),
            numbersOfPostLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -220)
        ])
    }
    
    func configurePostLabel(){
        addSubview(postLabel)
        
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postLabel.widthAnchor.constraint(equalToConstant: 50),
            postLabel.heightAnchor.constraint(equalToConstant: 20),
            postLabel.centerXAnchor.constraint(equalTo: numbersOfPostLabel.centerXAnchor),
            postLabel.topAnchor.constraint(equalTo: numbersOfPostLabel.bottomAnchor, constant: 1)
        ])
    }
    
    func configureNumbersOfFollowerLabel(){
        addSubview(numbersOfFollowerLabel)
        
        numbersOfFollowerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numbersOfFollowerLabel.widthAnchor.constraint(equalToConstant: 20),
            numbersOfFollowerLabel.heightAnchor.constraint(equalToConstant: 20),
            numbersOfFollowerLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 45),
            numbersOfFollowerLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -135)
            
        ])
    }
    
    func configureFollowerLabel(){
        addSubview(followerLabel)
        
        followerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followerLabel.widthAnchor.constraint(equalToConstant: 50),
            followerLabel.heightAnchor.constraint(equalToConstant: 20),
            followerLabel.centerXAnchor.constraint(equalTo: numbersOfFollowerLabel.centerXAnchor),
            followerLabel.topAnchor.constraint(equalTo: numbersOfFollowerLabel.bottomAnchor, constant: 1)
        ])
    }
    
    func configureNumbersOfFollowingLabel(){
        addSubview(numbersOfFollowingLabel)
        
        numbersOfFollowingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numbersOfFollowingLabel.widthAnchor.constraint(equalToConstant: 20),
            numbersOfFollowingLabel.heightAnchor.constraint(equalToConstant: 20),
            numbersOfFollowingLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -50),
            numbersOfFollowingLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 45)
        ])
    }
    
    func configureFollowingLabel(){
        addSubview(followingLabel)
        
        followingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followingLabel.widthAnchor.constraint(equalToConstant: 60),
            followingLabel.heightAnchor.constraint(equalToConstant: 20),
            followingLabel.topAnchor.constraint(equalTo: numbersOfFollowingLabel.bottomAnchor, constant: 1),
            followingLabel.centerXAnchor.constraint(equalTo: numbersOfFollowingLabel.centerXAnchor),
        ])
    }
}

