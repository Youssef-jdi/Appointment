//
//  TimelineHeaderDataSource.swift
//  appointment
//
//  Created by Raluca Mesterca on 09/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class TimelineHeaderDataSource: NSObject, UICollectionViewDataSource {

    private var data: [String] = []
    private var isMonthAgenda: Bool = true
    private var dayCount: Int?

    func set(data: [String]) {
        self.data = data
    }

    func set(isMonthAgenda: Bool) {
        self.isMonthAgenda = isMonthAgenda
    }

    func handleViewDidLoad() {
        dayCount = isMonthAgenda ? 31 : 7
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard var dayCount = dayCount else { assertionFailure(); return 0 }
        dayCount = isMonthAgenda ? 31 : 7
        return dayCount + 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: R.reuseIdentifier.timelineHeaderCollectionViewCell,
            for: indexPath) else { assertionFailure(); return UICollectionViewCell() }

        cell.configure(for: indexPath.row, isMonthAgenda: isMonthAgenda)
        return cell
    }
}
