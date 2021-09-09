////
////  YearMonthHeaderView.swift
////  appointment
////
////  Created by Dylan Barteling on 24/04/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class YearMonthHeaderView: UITableViewHeaderFooterView {
//    
//    private var holidays: [HolidaySectionModel] = []
//    private var year: Int = Date().year
//    
//    private let itemsPerRow: CGFloat = 3
//    private let sectionInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
//    
//    @IBOutlet private weak var monthsCollectionView: UICollectionView! {
//        didSet {
//            monthsCollectionView.register(R.nib.monthCollectionViewCell)
//            monthsCollectionView.dataSource = self
//            monthsCollectionView.delegate = self
//        }
//    }
//    
//    func configure(year: Int, holidays: [HolidaySectionModel]) {
//        self.year = year
//        self.holidays = holidays
//        monthsCollectionView.reloadData()
//    }
//}
//
//extension YearMonthHeaderView: UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 12
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.monthCollectionViewCell, for: indexPath)!
//        cell.configure(month: indexPath.row + 1, year: year, holidays: holidays)
//        return cell
//    }
//}
//
//extension YearMonthHeaderView: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        let horizontalItemsPerRow: CGFloat = 3
//        let horizontalPaddingSpace = sectionInsets.left * (horizontalItemsPerRow + 1)
//        let horizontalAvailableWidth = collectionView.frame.width - horizontalPaddingSpace
//        let widthPerItem = floor(horizontalAvailableWidth / horizontalItemsPerRow)
//        
//        let verticalItemsPerRow: CGFloat = 4
//        let verticalPaddingSpace = sectionInsets.top * (verticalItemsPerRow + 1)
//        let verticalAvailableWidth = collectionView.frame.height - verticalPaddingSpace
//        let heightPerItem = floor(verticalAvailableWidth / verticalItemsPerRow)
//        
//        return CGSize(width: widthPerItem, height: heightPerItem)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return sectionInsets
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInsets.left
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let month = indexPath.row + 1
//        let dateComponents = DateComponents(year: year, month: month, day: 1)
//        let date = Calendar.current.date(from: dateComponents)!
//        let show = "\(date.localizedDateString(dateFormat: Date.DateFormats.monthName.rawValue)!), \(year)"
//        print("Show month:", show)
//    }
//}
