////
////  Theme.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 2.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class ThemeService {
//    static let shared = ThemeService()
//    public var theme: ProductModel = defaultTheme {
//        didSet {
//            let encoder = JSONEncoder()
//            do {
//                let encoded = try encoder.encode(theme)
//                switch theme.type {
//                case .theme:
//                    userDefaults.set(encoded, forKey: "currentTheme")
//                    applyTheme()
//                default: break
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//            
//        }
//    }
//    
//    public var chatBackground: ProductModel = defaultBackground {
//        didSet {
//            let encoder = JSONEncoder()
//            do {
//                let encoded = try encoder.encode(theme)
//                switch theme.type {
//                case .background:
//                    userDefaults.set(encoded, forKey: "currentChatBackground")
//                default: break
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }
//    
//    private var listeners = NSHashTable<AnyObject>.weakObjects()
//    private var userDefaults = UserDefaults.standard
//    
//    public init() {}
//    
//    public func addThemeable(themable: Themeable, applyImmediately: Bool = true) {
//        guard case .theme = theme.type else { return }
//        guard !listeners.contains(themable) else { return }
//        listeners.add(themable as AnyObject)
//        
//        if applyImmediately {
//            themable.applyTheme(theme: theme)
//        }
//    }
//    
//    private func applyTheme() {
//        // The tintColor will trickle down to each view
//        if let window = UIApplication.shared.windows.first {
//            window.tintColor = theme.firstColor
//        }
//        
//        UIPickerView.appearance().backgroundColor = ThemeService.shared.theme.firstColor
//        // Update each listener. The type cast is needed because allObjects returns [AnyObject]
//        listeners.allObjects
//            .compactMap { $0 as? Themeable }
//            .forEach { $0.applyTheme(theme: theme) }
//    }
//}
//
//var defaultBackground = ProductModel(id: -2, type: .background(BackgroundProductModel(imageURL: nil)), price: Credit(amount: 0, localizedPrice: "0"), owned: true, name: "default".localized.firstCapitalized)
//
//var defaultTheme = ProductModel(id: -1, type: .theme(ThemeProductModel(firstColor: "#6A6A6A", highlightColor: "#F1443D")), price: Credit(amount: 0, localizedPrice: "0"), owned: true, name: "default".localized.firstCapitalized)
