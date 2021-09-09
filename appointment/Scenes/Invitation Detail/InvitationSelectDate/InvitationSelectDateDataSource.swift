//
//  InvitationSelectDateDataSource.swift
//  appointment
//
//  Created by Youssef Jdidi on 6/23/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

protocol InvitationSelectDataSourceProtocol: UICollectionViewDataSource, UICollectionViewDelegate {
    func set(dates: [AppointmentDate])
    func set(collectionView: UICollectionView)
    func data() -> [AppointmentDate: Bool]
    func getSelectedDate() -> AppointmentDateViewModel?
}

class InvitationSelectDataSource: NSObject, InvitationSelectDataSourceProtocol {

    private var dates: [AppointmentDate: Bool] = [:]
    private var collectionView: UICollectionView?
    private let viewModelProvider: AppointmentViewModelProviderProtocol

    init(viewModelProvider: AppointmentViewModelProviderProtocol) {
      self.viewModelProvider = viewModelProvider
    }

    func set(dates: [AppointmentDate]) {
        
        dates.forEach { date in
            self.dates[date] = false
        }
    }

    func set(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }

    func data() -> [AppointmentDate: Bool] {
        return self.dates
    }

    func getSelectedDate() -> AppointmentDateViewModel? {
        guard let appointmentDate = self.dates.first(where: { _, value -> Bool in
            return value == true
        })?.key else { return nil }
        return viewModelProvider.dateViewModel(from: appointmentDate)
    }
}

extension InvitationSelectDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: InvitationSelectDateCollectionCell.identifier,
            for: indexPath
            ) as?  InvitationSelectDateCollectionCell else {
                return UICollectionViewCell()
        }
        let viewModel = viewModelProvider.dateViewModel(from: Array(dates.keys)[indexPath.row])
        cell.setUp(
            with: viewModel,
            selected: Array(dates.values)[indexPath.row]
        )
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
         guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: InvitationSelectDateHeaderView.identifier, for: indexPath) as? InvitationSelectDateHeaderView else {
                   return UICollectionReusableView()
               }
               header.setUp(text: "Party")
               return header
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected at \(indexPath.row)")
        self.set(dates: Array(dates.keys))
        self.collectionView?.reloadData()
        self.dates[Array(self.dates.keys)[indexPath.row]]?.toggle()
        self.collectionView?.reloadItems(at: [indexPath])
    }
}
