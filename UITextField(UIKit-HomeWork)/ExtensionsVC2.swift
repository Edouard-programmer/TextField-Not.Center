//
//  ExtensionsVC2.swift
//  UITextField(UIKit-HomeWork)
//
//  Created by Эдуард Потоки on 30.11.2021.
//

import Foundation
import UIKit

extension SecondViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        return colors[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch colors[row] {
        case "Red":
            view.backgroundColor = .red
        case "Black": view.backgroundColor = .black
        case "Green": view.backgroundColor = .green
        case "Blue": view.backgroundColor = .blue
        case "Gray": view.backgroundColor = .gray
        case "Purple": view.backgroundColor = .purple
        default:
            view.backgroundColor = .white
            
        }
    }
}
extension SecondViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        return colors.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}
