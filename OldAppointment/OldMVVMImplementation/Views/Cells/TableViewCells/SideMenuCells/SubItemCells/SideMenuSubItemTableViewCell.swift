//
//  SideMenuSubItemTableViewCell.swift
//  appointment
//
//  Created by Onur Hüseyin Çantay on 2.03.2019.
//  Copyright © 2019 DTT. All rights reserved.
//

import UIKit

class SideMenuSubItemTableViewCell: UITableViewCell {
    override var reuseIdentifier: String? { return "SideMenuSubItemTableViewCell" }
    
    @IBOutlet private weak var headerLabel: UILabel! {
        didSet {
            headerLabel.font = R.font.robotoRegular(size: 18)
            headerLabel.textColor = R.color.appGray()!
        }
    }
    @IBOutlet private weak var iconImageView: UIImageView! {
        didSet {
            iconImageView.contentMode = .scaleAspectFit
        }
    }
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            
            tableView.register(UINib(nibName: "SideMenuTableViewCell", bundle: nil), forCellReuseIdentifier: R.reuseIdentifier.sideMenuTableViewCell.identifier)
            separatorInset.left = 0
            tableView.separatorStyle = .none
            tableView.showsVerticalScrollIndicator = false
            tableView.isScrollEnabled = false
            tableView.alwaysBounceVertical = false
        }
    }
    
    var dataModal: [SideMenuModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func prepareHeader(image: UIImage, text: String) {
        headerLabel.text = text
        iconImageView.image = image
    }
}

extension SideMenuSubItemTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModal.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let  cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.sideMenuTableViewCell.identifier) as? SideMenuTableViewCell else { return UITableViewCell() }
        cell.prepareCell(image: R.image.menu_Appointments()!, subText: dataModal[indexPath.row].descriptionText, notificationCount: "(23)")
        cell.separatorInset.left = 0
        return cell
    }
}
