////
////  ImagePicker.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 4.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//public protocol ImagePickerDelegate: class {
//    func didSelect(image: UIImage?)
//}
//
//open class ImagePicker: NSObject, UINavigationControllerDelegate {
//
//    private let pickerController: UIImagePickerController
//    private weak var presentationController: UIViewController?
//    private weak var delegate: ImagePickerDelegate?
//
//    public init(presentationController: UIViewController, delegate: ImagePickerDelegate, mediaTypes: [String] ) {
//        self.pickerController = UIImagePickerController()
//        super.init()
//        self.presentationController = presentationController
//        self.delegate = delegate
//        self.pickerController.delegate = self
//        self.pickerController.allowsEditing = true
//        self.pickerController.mediaTypes = mediaTypes
//    }
//
//    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
//        guard UIImagePickerController.isSourceTypeAvailable(type) else {
//            return nil
//        }
//
//        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
//            self.pickerController.sourceType = type
//            self.pickerController.navigationBar.setBackgroundImage(self.presentationController?.navigationController?.navigationBar.backgroundImage(for: .default), for: .default)
//            self.pickerController.navigationBar.tintColor = .white
//            self.pickerController.navigationBar.titleTextAttributes = [
//                NSAttributedString.Key.foregroundColor: UIColor.white,
//                NSAttributedString.Key.font: R.font.openSans(size: 16)!
//            ]
//            self.presentationController?.navigationController?.show(self.pickerController, sender: nil)
//        }
//    }
//
//    public func present(from sourceView: UIView) {
//
//        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//
//        if let action = self.action(for: .camera, title: "Take photo") {
//            alertController.addAction(action)
//        }
//        if let action = self.action(for: .savedPhotosAlbum, title: "Camera roll") {
//            alertController.addAction(action)
//        }
//        if let action = self.action(for: .photoLibrary, title: "Photo library") {
//            alertController.addAction(action)
//        }
//
//        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            alertController.popoverPresentationController?.sourceView = sourceView
//            alertController.popoverPresentationController?.sourceRect = sourceView.bounds
//            alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
//        }
//
//        self.presentationController?.present(alertController, animated: true)
//    }
//
//    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
//        controller.dismiss(animated: true, completion: nil)
//
//        self.delegate?.didSelect(image: image)
//    }
//}
//
//extension ImagePicker: UIImagePickerControllerDelegate {
//
//    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        self.pickerController(picker, didSelect: nil)
//    }
//
//    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
//        guard let image = info[.editedImage] as? UIImage else {
//            return self.pickerController(picker, didSelect: nil)
//        }
//        self.pickerController(picker, didSelect: image)
//    }
//}
