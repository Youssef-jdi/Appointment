//
//  AddDateCollectionCell.swift
//  appointment
//
//  Created by Tran Gia Huy on 04/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class AddDateCollectionCell: UICollectionViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var seperatorView: UIView!
    @IBOutlet weak var topGridView: UIStackView!
    @IBOutlet weak var bottomGridView: UIStackView!

    private let colors: [UIColor] = [
        R.color.appOutlookBlue()!,
        R.color.appBlue()!
    ]

    static var identifier: String {
           return String(describing: AddDateCollectionCell.self)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        topGridView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        bottomGridView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }

    func setup(time: String) {
        timeLabel.text = time.count == 1 ? "0\(time)" : time
    }

    func createGridViews(with events: [CalendarItem?], hour: Int) {
        
        events.forEach { event in
            guard let event = event else {
                let topNilView = UIView()
                let bottomNilView = UIView()
                
                topNilView.alpha = 0
                bottomNilView.alpha = 0
                
                bottomGridView.addArrangedSubview(bottomNilView)
                topGridView.addArrangedSubview(topNilView)
                return
            }
            
            let gridViewTop = UIView()
            gridViewTop.backgroundColor = R.color.appBlue()
            gridViewTop.alpha = event.startTime < hour && event.endTime >= (hour - 1) ? 0.5 : 0
            
            let gridViewBottom = UIView()
            gridViewBottom.backgroundColor = R.color.appBlue()
            gridViewBottom.alpha = event.startTime <= hour && event.endTime > hour ? 0.5 : 0
            
            topGridView.addArrangedSubview(gridViewTop)
            bottomGridView.addArrangedSubview(gridViewBottom)
            
            if hour == event.startTime {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                gridViewBottom.addSubview(label)
                label.text = event.title
                label.textColor = .white
                label.bottomAnchor.constraint(equalTo: gridViewBottom.bottomAnchor).isActive = true
                label.leadingAnchor.constraint(equalTo: gridViewBottom.leadingAnchor, constant: 8).isActive = true 
            }
        }

        for i in events.indices {
            if topGridView.arrangedSubviews.indices.contains(i) {
                topGridView.arrangedSubviews[i].backgroundColor = colors[i % 2 == 0 ? 0 : 1]
            }
            if bottomGridView.arrangedSubviews.indices.contains(i) {
                bottomGridView.arrangedSubviews[i].backgroundColor = colors[i % 2 == 0 ? 0 : 1]
            }
        }
    }
}
