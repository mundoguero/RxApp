//
//  AuthenticationViewController.swift
//  rxlogin
//
//  Created by Jonatas Brisotti on 17/11/20.
//  Copyright © 2020 Jonatas Brisotti. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Lottie

class AuthenticationViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private var viewModel = AuthenticationViewModel(model: AuthenticationBusinessModel())
    private var tableView: UITableView = {
        let tableview = UITableView(frame: CGRect.zero, style: .grouped)
        tableview.sectionHeaderHeight = 0.01
        tableview.sectionFooterHeight = 0.01
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    private var headerView = AuthenticationHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "RxApp"
        setNeedsStatusBarAppearanceUpdate()
    }
}

extension AuthenticationViewController {
    private func setupUI() {
        tableView.backgroundColor = .clear
        
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        
        addHeaderView()
    }
}

extension AuthenticationViewController {
    private func addHeaderView() {
        headerView = AuthenticationHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width,
                                                            height: self.view.frame.height))
        headerView.setup(self)
        tableView.tableHeaderView = headerView
    }
}

extension AuthenticationViewController {
    private func bindUI() {
        headerView.usernameTextField.rx.text.asObservable().distinctUntilChanged()
            .subscribe(onNext: { [weak self] value in
                guard let self = self else { return }
                self.viewModel.username.accept(value ?? "")
        }).disposed(by: disposeBag)
        
        headerView.passwordTextField.rx.text.asObservable().distinctUntilChanged()
            .subscribe(onNext: { [weak self] value in
                guard let self = self else { return }
                self.viewModel.password.accept(value ?? "")
        }).disposed(by: disposeBag)
    }
}

// MARK: AuthenticationHeaderViewDelegate
extension AuthenticationViewController: AuthenticationHeaderViewDelegate {
    func handlerTap() {
        self.showLoad()
        viewModel.rx_authentication().observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] value in
                guard let self = self else { return }
                self.goToFlow(value.password)
        }).disposed(by: disposeBag)
    }
}

extension AuthenticationViewController {
    private func goToFlow(_ pass: String) {
        if viewModel.password.value == pass {
            let storyboard = UIStoryboard(name: "Chart", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "ChartViewController") as? ChartViewController {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            self.hideLoad()
        }
    }
}

