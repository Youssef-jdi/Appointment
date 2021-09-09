////
////  HomeTitleView.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 4.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//protocol HomeTitleViewDelegate: class {
//    func didEndEditing(with year: Int)
//}
//
//class OldHomeTitleView: UIView {
//    
//    @IBOutlet private weak var contentView: UIView!
//    @IBOutlet private weak var yearLabel: UILabel! {
//        didSet {
//            yearLabel.text = Date().year.description
//        }
//    }
//    @IBOutlet private weak var inputTextField: UITextField! {
//        didSet {
//            inputTextField.inputView = datePicker
//            inputTextField.textColor = .clear
//            inputTextField.delegate = self
//            inputTextField.borderStyle = .none
//        }
//    }
//    
//    @IBOutlet private weak var downImageView: UIImageView! {
//        didSet {
//            downImageView.tintColor = .white
//            downImageView.contentMode = .scaleAspectFit
//        }
//    }
//    
//    lazy var datePicker: UIPickerView = {
//        let picker = UIPickerView()
//        picker.dataSource = self
//        picker.delegate = self
//        picker.tintColor = ThemeService.shared.theme.firstColor
//        return picker
//    }()
//    
//    weak var delegate: HomeTitleViewDelegate?
//    private var isDown: Bool = true
//    private var years: [Int] = []
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.commontInit()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.commontInit()
//    }
//    
//    private func handleAnimation() {
//        UIView.animate(withDuration: 0.3,
//                       animations: {
//                        self.downImageView.transform = CGAffineTransform(rotationAngle:
//                            self.isDown ? 0 : .pi)}
//        )
//    }
//    
//    private func titleViewPressed() {
//        isDown.toggle()
//        handleAnimation()
//    }
//        
//    private func commontInit() {
//        Bundle.main.loadNibNamed(R.nib.homeTitleView.name, owner: self, options: nil)
//        addSubview(contentView)
//        contentView.frame = self.bounds
//        contentView.isUserInteractionEnabled = true
//        contentView.autoresizingMask = [
//            .flexibleWidth,
//            .flexibleHeight
//        ]
//        years += 1_900...3_000
//        guard let index = years.firstIndex(of: Date().year) else { return }
//        datePicker.selectRow(index, inComponent: 0, animated: false)
//        ThemeService.shared.addThemeable(themable: self)
//    }
//}
//
//extension OldHomeTitleView: Themeable {
//    func applyTheme(theme: ProductModel) {
//        datePicker.tintColor = theme.firstColor
//    }
//}
//
//extension OldHomeTitleView: UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return years.count
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        let titleData = years[row].description
//        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
//        return myTitle
//    }
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        titleViewPressed()
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        titleViewPressed()
//        let text = years[datePicker.selectedRow(inComponent: 0)]
//        yearLabel.text = text.description
//        delegate?.didEndEditing(with: text)
//    }
//}
