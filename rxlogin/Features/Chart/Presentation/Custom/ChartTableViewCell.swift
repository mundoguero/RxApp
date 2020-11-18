//
//  ChartTableViewCell.swift
//  rxlogin
//
//  Created by Jonatas Brisotti on 18/11/20.
//  Copyright © 2020 Jonatas Brisotti. All rights reserved.
//

import UIKit

class ChartTableViewCell: UITableViewCell {
    
    private var nameDescrption: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension ChartTableViewCell {
    private func setupUI() {
        addSubview(nameDescrption)
        nameDescrption.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        nameDescrption.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20).isActive = true
        nameDescrption.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
}

extension ChartTableViewCell {
    public func setup(with subject: Subject) {
        nameDescrption.text = "\(subject.title)"
    }
}
