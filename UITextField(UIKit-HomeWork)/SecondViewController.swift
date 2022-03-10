//
//  SecondViewController.swift
//  UITextField(UIKit-HomeWork)
//
//  Created by Эдуард Потоки on 30.11.2021.
//

import UIKit

class SecondViewController: UIViewController {
    var myButton: UIButton!
    var myPickerView: UIPickerView!
    var mySlider: UISlider!
    var myActivityController: UIActivityViewController!
    var mySegmentedControl: UISegmentedControl!
    var imageView: UIImageView!
    var colors = ["Green", "Red", "Black", "Purple", "Gray", "Blue"]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Welcome Home"
        navigationItem.leftBarButtonItem  = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        view.backgroundColor = .green
        createMyButton()
        bgColorPickerView()
        createMySegmentControl()

    }
    func createMyButton() {
        myButton = UIButton(type: .roundedRect)
        myButton.setTitle("Back", for: .normal)
        myButton.setTitleColor(.gray, for: .normal)
        myButton.backgroundColor = .yellow
        myButton.layer.cornerRadius = 25
        myButton.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myButton)
        NSLayoutConstraint.activate([
            myButton.widthAnchor.constraint(equalToConstant: 100),
            myButton.heightAnchor.constraint(equalToConstant: 40),
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
    }
    func bgColorPickerView() {
        
        myPickerView = UIPickerView()
        myPickerView.backgroundColor = .purple
        myPickerView.layer.cornerRadius = view.frame.width / 2
        myPickerView.delegate = self
        myPickerView.dataSource = self
        myPickerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myPickerView)
        NSLayoutConstraint.activate([
            myPickerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            myPickerView.heightAnchor.constraint(equalToConstant: view.frame.height / 2),
            myPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myPickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        var colorNum = 0
        
        switch view.backgroundColor {
        case UIColor.red: colorNum = 1
        case UIColor.black: colorNum = 2
        case UIColor.green: colorNum = 0
        case UIColor.purple: colorNum = 3
        case UIColor.gray: colorNum = 4
        case UIColor.blue: colorNum = 5
            
        default: break
        }
        myPickerView.selectRow(colorNum, inComponent: 0, animated: false)
    }
    func bgImage() {
        imageView = UIImageView(frame: view.bounds)
        imageView.image = UIImage(named: "victory")
        imageView.contentMode = .scaleAspectFit
        imageView.center = view.center
        view.addSubview(imageView)
    }
    func createMySlider() {
        mySlider = UISlider()
        mySlider.value = mySlider.maximumValue
        mySlider.translatesAutoresizingMaskIntoConstraints = false
        mySlider.addTarget(self, action: #selector(changeScaleImage), for: .valueChanged)
        view.addSubview(mySlider)
        NSLayoutConstraint.activate([
            mySlider.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50),
            mySlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mySlider.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 250)
        ])
    }
//    func createActivityController() {
//        myActivityController = UIActivityViewController(activityItems: ["QWE", "QWE"], applicationActivities: nil)
//        myActivityController.toolbarItems = [UIBarButtonItem(barButtonSystemItem: .action, target: nil, action: nil)]
//        view.addSubview(myActivityController)
//    }
    func createMySegmentControl() {
        mySegmentedControl = UISegmentedControl(items: ["Item1", "Item2"])
        mySegmentedControl.selectedSegmentIndex = 0
        mySegmentedControl.isSelected = true
        mySegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        mySegmentedControl.addTarget(self, action: #selector(handlerSegmentedControl(target:)), for: .valueChanged)
        view.addSubview(mySegmentedControl)
        NSLayoutConstraint.activate([
            mySegmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100),
            mySegmentedControl.heightAnchor.constraint(equalToConstant: 60),
            mySegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mySegmentedControl.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    @objc func buttonHandler() {
        dismiss(animated: true, completion: nil)
    }
    @objc func handlerSegmentedControl(target: UISegmentedControl) {
        let index = mySegmentedControl.selectedSegmentIndex
        if mySegmentedControl == target {
            switch index {
            case 0:
                if mySlider != nil{
                mySlider.isHidden = true
                }
                imageView.isHidden = true
                bgColorPickerView()
            case 1:
                myPickerView.isHidden = true
                bgImage()
                createMySlider()
            default: break
            }
        }
    }
    @objc func changeScaleImage() {
        
        imageView.transform = CGAffineTransform(scaleX: CGFloat(mySlider.value), y: CGFloat(mySlider.value))
    }

}
