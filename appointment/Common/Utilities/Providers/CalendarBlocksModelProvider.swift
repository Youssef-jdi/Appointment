//
//  CalendarBlocksModelProvider.swift
//  appointment
//
//  Created by Irina Filkovskaya on 09.06.2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

struct CalendarItem: Equatable {
    let title: String
    let startTime: Int // Double
    let endTime: Int // Double
}

//sourcery: AutoMockable
protocol CalendarBlocksModelProviderProtocol {
    /// Takes an array of calendar items scheduled for a day as a parameter,
    /// and returns a the items layed out in a model where keys
    /// represent hours (hour lines) and values represent item columns,
    /// where *nils* signify a column free from an entry block. The *maxDisplayableTogether* parameter defines the maximum number of columns.
    /// - Parameters:
    ///     - items: An Array of calendar items represeting appointments
    /// scheduled for a particular day.
    ///     - maxDisplayableTogether: A maximum number of items with overlapping
    ///     times that can be displayed simultaneously.
    func model(from items: [CalendarItem], maxDisplayableTogether: Int) -> [Int: [CalendarItem?]]
}

class CalendarBlocksModelProvider: CalendarBlocksModelProviderProtocol {
    /// Specifies the limit imposed on a number of simultaneous items per hour.
    private var limitPerHour = 0
    
    func model(from items: [CalendarItem], maxDisplayableTogether: Int) -> [Int: [CalendarItem?]] {
        
        self.limitPerHour = maxDisplayableTogether
        defer { self.limitPerHour = 0 }
        
        var maxItems = 0
        
        // sort items by duration, longest first, so that the longer
        // items are grouped to the left
        let sortedItems = items.sorted { ($0.endTime - $0.startTime) > ($1.endTime - $1.startTime) }
        
        var data: [Int: [CalendarItem?]] = [:]
        
        // go through the items one by one and insert them to the data.
        sortedItems.forEach { item in
            
            guard item.startTime < item.endTime else { return }
            let hours = Array(item.startTime...item.endTime)
            // define the position at which the item should be inserted in the model
            guard let position = columnNumber(for: item, in: data) else { return }
            
            // increase the counter for maximum items per line
            if (position + 1) > maxItems {
                maxItems = (position + 1)
            }
                    
            // insert the item for every hour of its duration
            hours.forEach { hour in
                // if the model contains no items for this hour, add this item
                guard let existingHourData = data[hour] else {
                    data[hour] = {
                        switch position {
                        case 0:
                            return [item]
                        default:
                            // precede with nils if the item position is not 0
                            var hourItems: [CalendarItem?] = Array(repeating: nil, count: position)
                            hourItems.append(item)
                            return hourItems
                        }
                    }()
                    return
                }

                let count = existingHourData.count
                var newHourData = existingHourData

                // add the item to the hour items, preceding with nils if required
                if count <= (position - 1) {
                    let nils: [CalendarItem?] = Array(repeating: nil, count: (position - count))
                    newHourData.append(contentsOf: nils)
                    newHourData.append(item)
                } else {
                    newHourData.append(item)
                }
                
                data[hour] = newHourData
            }
        }
        
        var completeData = addTrailingNilsIfNeeded(data: data,
                                                   lineWidth: maxItems)
        _ = completeData.sorted { $0.0 < $1.0 }
        
        return completeData
    }
}

private extension CalendarBlocksModelProvider {
    
    /// Takes an item and a calendar day model as parameters, and returns
    /// the number of column which the item can take in the model.
    /// The column numbers start at 0.
    func columnNumber(for item: CalendarItem, in data: [Int: [CalendarItem?]]) -> Int? {
        var canReturn = false
        var counter = 0
        var columnNumber = 0
        
        let hours = Array(item.startTime...item.endTime)
        
        while canReturn == false {
            
            hourLoop: for i in hours.indices {

                // if the possible column number is beyond the limit,
                // discard the calculation and return nil
                guard columnNumber < limitPerHour else {
                    return nil
                }
                
                let hour = hours[i]
                // check if there's no records for the target hour at all
                if data[hour] == nil {
                    counter += 1
                    if counter > hours.count {
                        canReturn = true
                    }
                // check if the record contains nil for the target column
                } else if let hourItems = data[hour], !hourItems.indices.contains(columnNumber) {
                    counter += 1
                    canReturn = counter > hours.count
                } else {
                    counter = 0
                    columnNumber += 1
                    break hourLoop
                }
            }
        }
        return columnNumber
    }
    
    func addTrailingNilsIfNeeded(data: [Int: [CalendarItem?]], lineWidth: Int) -> [Int: [CalendarItem?]] {

        var result: [Int: [CalendarItem?]] = [:]
        
        data.forEach { key, value in
            var newValue = value
            if value.count < lineWidth {
                let diff = lineWidth - value.count
                newValue.append(contentsOf: Array(repeating: nil, count: diff))
            }
            result[key] = newValue
        }
        return result
    }
}
