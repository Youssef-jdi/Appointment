//
//  SyncDataSource.swift
//  appointment
//
//  Created by Rachel Polachova on 06/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

protocol SyncDataWSourceProtocol: UICollectionViewDataSource {
    func setupDataSource(with apps: [SyncApp])
}

// swiftlint:disable implicit_return
class SyncDataSource: NSObject, SyncDataWSourceProtocol {
    
    var dataSource = SyncApp.allCases
    
    func setupDataSource(with apps: [SyncApp]) {
        dataSource = apps
    }
}

// MARK: UICollectionViewDataSource
extension SyncDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.syncAppCell.identifier, for: indexPath) as? SyncAppCollectionViewCell else { return UICollectionViewCell() }
//
//        cell.configure(app: dataSource[indexPath.row])
        return UICollectionViewCell()
    }
}
