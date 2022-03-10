//
//  Extensions.swift
//  UITextField(UIKit-HomeWork)
//
//  Created by Эдуард Потоки on 28.11.2021.
//

import Foundation
import UIKit
extension ViewController: UITextFieldDelegate {
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == myTextField1 {
            myTextField1.resignFirstResponder()
            myTextField2.becomeFirstResponder()
        } else if textField == alert.textFields?[0] {
            
            alert.dismiss(animated: true, completion: nil)
            myTextField4.text = alert.textFields?[0].text
        }
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1 || textField.tag == 2 {
            return false
        }
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.textColor = .darkGray
        return true
    }
}
//
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 18)"
        
    }
    
}
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { 73 }
    
}

//
extension UIPickerView {
    func selectedTitleForComponent(component: Int, pickerView: UIPickerView) -> String? {
        let row = selectedRow(inComponent: component)
        return delegate?.pickerView?(pickerView, titleForRow: row, forComponent: component)
        
    }
}
extension UITextField {
    func placeholderColor(color: UIColor) {
        let tfPlaceholder = placeholder
        attributedPlaceholder = NSAttributedString(string: tfPlaceholder!, attributes: [NSAttributedString.Key.foregroundColor: color])
    }
}
