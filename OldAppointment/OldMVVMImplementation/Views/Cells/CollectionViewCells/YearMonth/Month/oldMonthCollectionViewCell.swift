////
////  MonthCollectionViewCell.swift
////  appointment
////
////  Created by Dylan Barteling on 23/04/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class MonthCollectionViewCell: UICollectionViewCell {
//    
//    @IBOutlet private var weekLabels: [UILabel]!
//    
//    @IBOutlet private weak var daysStackView: UIStackView!
//    @IBOutlet private weak var weekStackView: UIStackView!
//    @IBOutlet private weak var monthLabel: UILabel!
//    
//    @IBOutlet private weak var daysCollectionView: UICollectionView! {
//        didSet {
//            daysCollectionView.register(R.nib.dayCollectionViewCell)
//            daysCollectionView.dataSource = self
//            daysCollectionView.delegate = self
//            daysCollectionView.isUserInteractionEnabled = false
//        }
//    }
//    
//    private var holidays: [HolidaySectionModel] = []
//    
//    private var weekDates: WeekDates! = WeekDates() {
//        didSet {
//            daysCollectionView.reloadData()
//            layoutIfNeeded()
//            weekDates.weekNumbers.forEach {
//                let label = UILabel()
//                label.font = UIFont.systemFont(ofSize: 8)
//                label.textColor = R.color.appLightRed()
//                label.text = "\($0)"
//                label.translatesAutoresizingMaskIntoConstraints = false
//                label.heightAnchor.constraint(equalToConstant: widthPerItem).isActive = true
//                weekStackView.addArrangedSubview(label)
//            }
//        }
//    }
//    
//    private lazy var widthPerItem = daysStackView.frame.width / horizontalItemsPerRow
//    private let horizontalItemsPerRow: CGFloat = 7 // a week has 7 days
//    private let sectionInsets = UIEdgeInsets.zero
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        weekStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
//    }
//    
//    private func getHolidaysByDate(at date: Date?) -> [HolidayModel]? {
//        guard let date = date else { return nil }
//        return holidays.flatMap { $0.holidays }
//            .filter {
//                Calendar.current.compare($0.date, to: date, toGranularity: .day) == .orderedSame
//        }
//    }
//    
//    func configure(month: Int, year: Int, holidays: [HolidaySectionModel]) {
//        let dateComponents = DateComponents(year: year, month: month, day: 1)
//        let date = Calendar.current.date(from: dateComponents)!
//        monthLabel.text = date.localizedDateString(dateFormat: Date.DateFormats.monthName.rawValue)
//        weekDates = Calendar.current.getAllDates(month: month, year: year)
//        self.holidays = holidays
//    }
//}
//
//extension MonthCollectionViewCell: UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return weekDates.dates.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.dayCollectionViewCell, for: indexPath)!
//        let date = weekDates.dates[indexPath.row]
//        cell.configure(date: date, holidays: getHolidaysByDate(at: date))
//        return cell
//    }
//}
//
//extension MonthCollectionViewCell: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: widthPerItem, height: widthPerItem)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return sectionInsets
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInsets.left
//    }
//}
