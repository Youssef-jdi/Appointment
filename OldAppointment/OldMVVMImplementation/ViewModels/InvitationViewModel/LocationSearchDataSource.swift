////
////  LocationSearchDataSource.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 05/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import GooglePlaces
//
//class LocationSearchDataSource: NSObject, UITableViewDataSource {
//
//    var matchingItems: [GMSAutocompletePrediction] = []
//    var didSelectCell: ((String) -> Void)?
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return matchingItems.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: R.reuseIdentifier.alertTableViewCell.identifier)
//        cell.textLabel?.attributedText = createAttributedText(from: matchingItems[indexPath.row].attributedFullText)
//        return cell
//    }
//
//    func createAttributedText(from text: NSAttributedString) -> NSMutableAttributedString {
//        let regularFont = UIFont.systemFont(ofSize: UIFont.labelFontSize)
//        let boldFont = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
//
//        let bolded = text.mutableCopy() as! NSMutableAttributedString
//        bolded.enumerateAttribute(NSAttributedString.Key.gmsAutocompleteMatchAttribute, in: NSMakeRange(0, bolded.length), options: []) {
//            (value, range: NSRange, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
//            let font = (value == nil) ? regularFont : boldFont
//            bolded.addAttribute(NSAttributedString.Key.font, value: font, range: range)
//        }
//        return bolded
//    }
//}
//
//extension LocationSearchDataSource: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return nil
//    }
//
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return nil
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let text = tableView.cellForRow(at: indexPath)?.textLabel?.text
//        didSelectCell?(text!)
//    }
//}
