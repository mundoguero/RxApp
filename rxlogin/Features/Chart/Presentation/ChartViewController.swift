//
//  ChartViewController.swift
//  rxlogin
//
//  Created by Jonatas Brisotti on 18/11/20.
//  Copyright © 2020 Jonatas Brisotti. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ChartViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private var list: Chart = Chart()
    private var viewModel = ChartViewModel(model: ChartBusinessModel())
    private var tableView: UITableView = {
        let tableview = UITableView(frame: CGRect.zero, style: .grouped)
        tableview.sectionHeaderHeight = 0.01
        tableview.sectionFooterHeight = 0.01
        tableview.rowHeight = 50.0
        tableview.register(ChartTableViewCell.self, forCellReuseIdentifier: ChartTableViewCell.identifier)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Subjects"
        callApi()
    }
}

extension ChartViewController {
    private func setupUI() {
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    }
}


extension ChartViewController {
    private func callApi() {
        viewModel.rx_getAllSubjects().observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] value in
                guard let self = self else { return }
                self.hideLoad()
                self.list = value
                self.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
}

// MARK: UITableViewDataSource
extension ChartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ChartTableViewCell.identifier, for: indexPath) as? ChartTableViewCell {
            cell.setup(with: list.subjects[indexPath.item])
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: UITableViewDelegate
extension ChartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension ChartViewController {}
extension ChartViewController {}
