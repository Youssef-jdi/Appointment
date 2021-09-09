//
//  TimelineCollectionViewLayout.swift
//  appointment
//
//  Created by Raluca Mesterca on 23/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

/// This allows collection view to be shown in grid format
class TimelineLayout: UICollectionViewFlowLayout {

    // MARK: Properties
    var itemWidth: CGFloat
    var itemHeight: CGFloat
    var space: CGFloat

    // MARK: Init
    init(itemWidth: CGFloat, itemHeight: CGFloat, space: CGFloat) {
        self.itemWidth = itemWidth
        self.itemHeight = itemHeight
        self.space = space

        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        self.itemWidth = 50
        self.itemHeight = 50
        self.space = 3

        super.init()
    }

    override var collectionViewContentSize: CGSize {
        let items = self.collectionView!.numberOfItems(inSection: 0)
        let sections = self.collectionView!.numberOfSections

        let width = CGFloat(items) * (itemWidth + space)
        let height = CGFloat(sections) * (itemHeight + space)

        return CGSize(width: width, height: height)
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)

        let x = CGFloat(indexPath.row) * (itemWidth + space)
        let y = CGFloat(indexPath.section) + CGFloat(indexPath.section) * (itemHeight + space)

        attributes.frame = CGRect(x: x, y: y, width: itemWidth, height: itemHeight)

        return attributes
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

        let minRow = rect.origin.x > 0
            ? Int(floor(rect.origin.x / (itemWidth + space)))
            : 0

        let maxRow = Int(floor(rect.size.width / (itemWidth + space)) + CGFloat(minRow))

        var attributes = [UICollectionViewLayoutAttributes]()

        for i in 0...self.collectionView!.numberOfSections - 1 {
            guard minRow < maxRow else { return [] }

            for j in minRow...maxRow {
                attributes.append(self.layoutAttributesForItem(at: IndexPath(item: j, section: i))!)
            }
        }

        return attributes
    }
}
