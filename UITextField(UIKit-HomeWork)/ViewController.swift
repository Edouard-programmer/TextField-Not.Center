//
//  ViewController.swift
//  UITextField(UIKit-HomeWork)
//
//  Created by Эдуард Потоки on 27.11.2021.
//

import UIKit
/*
 ) Создать форму регистрации, 3-4 TextField, при заполнение первого TeхtField, по нажатию на "Ввод" переходит к заполнению второго TextField и тд, на последнем по нажатию на "Ввод" клавиатура убирается.
 */
class ViewController: UIViewController {
    var logotypeImageView: UIImageView!
    var welcomeLabel: UILabel!
    //TF & AgePickerView
    var agePickerView: UIPickerView!
    var ageToolBar: UIToolbar!
    var myTextField2: UITextField!
    //
    var myTextField1: UITextField!
    //TF & DatePickerView
    var datePickerView: UIDatePicker!
    var dateToolBar: UIToolbar!
    var myTextField3: UITextField!
    //
    var myTextField4: UITextField!
    var alert: UIAlertController!
    //
    var marriedLabel: UILabel!
    var marriedSwitch: UISwitch!
    //
    var jobLabel: UILabel!
    var jobSwitch: UISwitch!
    //
    var myButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -80
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0
        }
        //
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bgLight")!)

        //
        createLogoType()
        createWelcomeLabel()
        //TextFields
        createNameTF()
        createAgeTF()
        createDateTF()
        createInstagramTF()
        //Labels && Switches
        createMarriedContent()
        createJobContent()
        //Button
        createMyButton()
    }
    //MARK: -LogoType & LogoLabel
    func createLogoType() {
        logotypeImageView = UIImageView()
        logotypeImageView.image = UIImage(named: "sun")
        logotypeImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logotypeImageView)
        NSLayoutConstraint.activate([
//            logotypeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logotypeImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            logotypeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
    func createWelcomeLabel() {
        welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome, my sunny Friend!"
        welcomeLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        welcomeLabel.textColor = .white
        welcomeLabel.layer.shadowRadius = 8
        welcomeLabel.layer.shadowOffset = CGSize(width: 5, height: -10)
        welcomeLabel.layer.shadowColor = UIColor.red.cgColor
        welcomeLabel.textAlignment = .center
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.widthAnchor.constraint(equalToConstant: view.frame.width),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 30),
            welcomeLabel.topAnchor.constraint(equalTo: logotypeImageView.bottomAnchor, constant: 25)
        ])
    }
    //MARK: -TextFields(Methods)
    func createNameTF() {
        myTextField1 = UITextField()
        myTextField1.borderStyle = .roundedRect
        myTextField1.tag = 0
        myTextField1.placeholder = "Enter your name"
//        myTextField1.placeholderColor(color: .lightGray)
        myTextField1.textContentType = .name
        myTextField1.clearButtonMode = .whileEditing
        myTextField1.delegate = self
        myTextField1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myTextField1)
        NSLayoutConstraint.activate([
            myTextField1.widthAnchor.constraint(equalToConstant: 300),
            myTextField1.heightAnchor.constraint(equalToConstant: 31),
            myTextField1.centerXAnchor.constraint(equalTo: welcomeLabel.centerXAnchor),
            myTextField1.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40)
        ])
    }
    func createAgeTF() {
        //PickerView for TF
        agePickerView = UIPickerView()
        ageToolBar = UIToolbar()
        ageToolBar.sizeToFit()
        let item = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ageToolBarDone))
        ageToolBar.setItems([item], animated: true)
        agePickerView.delegate = self
        agePickerView.dataSource = self
        //
        myTextField2 = UITextField()
        myTextField2.inputView = agePickerView
        myTextField2.inputAccessoryView = ageToolBar
        myTextField2.tag = 1
        myTextField2.borderStyle = .roundedRect
        myTextField2.placeholder = "Enter your age"
        myTextField2.textContentType = nil
        myTextField2.clearButtonMode = .whileEditing
        myTextField2.delegate = self
        myTextField2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myTextField2)
        NSLayoutConstraint.activate([
            myTextField2.widthAnchor.constraint(equalToConstant: 300),
            myTextField2.heightAnchor.constraint(equalToConstant: 31),
            myTextField2.centerXAnchor.constraint(equalTo: welcomeLabel.centerXAnchor),
            myTextField2.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 100)
        ])
    }
    func createDateTF() {
        datePickerView = UIDatePicker()
        datePickerView.preferredDatePickerStyle = .wheels
        datePickerView.datePickerMode = .date
        dateToolBar = UIToolbar()
        dateToolBar.sizeToFit()
        let item = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dateToolBarDone))
        dateToolBar.setItems([item], animated: true)
        myTextField3 = UITextField()
        myTextField3.inputView = datePickerView
        myTextField3.inputAccessoryView = dateToolBar
        myTextField3.tag = 2
        myTextField3.borderStyle = .roundedRect
        myTextField3.placeholder = "Enter current date"
        myTextField3.textContentType = nil
        myTextField3.clearButtonMode = .whileEditing
        myTextField3.delegate = self
        myTextField3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myTextField3)
        NSLayoutConstraint.activate([
            myTextField3.widthAnchor.constraint(equalToConstant: 300),
            myTextField3.heightAnchor.constraint(equalToConstant: 31),
            myTextField3.centerXAnchor.constraint(equalTo: welcomeLabel.centerXAnchor),
            myTextField3.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 160)
        ])
    }
    func createInstagramTF() {
        myTextField4 = UITextField()
        myTextField4.placeholder = "Enter current instagram"
        myTextField4.tag = 3
        myTextField4.borderStyle = .roundedRect
        myTextField4.delegate = self
        myTextField4.translatesAutoresizingMaskIntoConstraints = false
        myTextField4.addTarget(self, action: #selector(instagramDone), for: .touchDown)
        view.addSubview(myTextField4)
        NSLayoutConstraint.activate([
            myTextField4.widthAnchor.constraint(equalToConstant: 300),
            myTextField4.heightAnchor.constraint(equalToConstant: 31),
            myTextField4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myTextField4.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 220)
        ])
    }
    func createMarriedContent() {
        marriedLabel = UILabel()
        marriedLabel.text = "Married"
        marriedLabel.textColor = .lightGray
        marriedLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        marriedLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(marriedLabel)
        marriedSwitch = UISwitch()
        marriedSwitch.onTintColor = .blue
        marriedSwitch.backgroundColor = .lightGray
        marriedSwitch.layer.cornerRadius = 15
        marriedSwitch.isOn = false
        marriedSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(marriedSwitch)
        NSLayoutConstraint.activate([
            marriedLabel.leftAnchor.constraint(equalTo: myTextField4.leftAnchor, constant: 15),
            marriedLabel.topAnchor.constraint(equalTo: myTextField4.bottomAnchor, constant: 40),
            marriedSwitch.rightAnchor.constraint(equalTo: myTextField4.rightAnchor, constant: -15),
            marriedSwitch.topAnchor.constraint(equalTo: myTextField4.bottomAnchor, constant: 40)
            
        ])
        
    }
    func createJobContent() {
        jobLabel = UILabel()
        jobLabel.text = "Job"
        jobLabel.textColor = .lightGray
        jobLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        jobLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(jobLabel)
        jobSwitch = UISwitch()
        jobSwitch.onTintColor = .blue
        jobSwitch.backgroundColor = .lightGray
        jobSwitch.layer.cornerRadius = 15
        jobSwitch.isOn = false
        jobSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(jobSwitch)
        NSLayoutConstraint.activate([
            jobLabel.leftAnchor.constraint(equalTo: myTextField4.leftAnchor, constant: 15),
            jobLabel.topAnchor.constraint(equalTo: myTextField4.bottomAnchor, constant: 100),
            jobSwitch.rightAnchor.constraint(equalTo: myTextField4.rightAnchor, constant: -15),
            jobSwitch.topAnchor.constraint(equalTo: myTextField4.bottomAnchor, constant: 100)
        ])
        
    }
    func createMyButton() {
        myButton = UIButton()
        myButton.layer.cornerRadius = 20
        myButton.layer.borderWidth = 2
        myButton.layer.shadowColor = UIColor.lightGray.cgColor
        myButton.layer.shadowOpacity = 0.5
        myButton.layer.shadowOffset.height = -10
        myButton.layer.masksToBounds = false
//        myButton.layer.borderColor = UIColor.lightGray.cgColor
        myButton.setTitle("Go", for: .normal)
        myButton.setTitleColor(.darkGray, for: .normal)
        myButton.backgroundColor = .white
        myButton.addTarget(self, action: #selector(buttonDone), for: .touchUpInside)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myButton)
        NSLayoutConstraint.activate([
            myButton.widthAnchor.constraint(equalToConstant: 300),
            myButton.heightAnchor.constraint(equalToConstant: 60),
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
        ])
    }
    //MARK: -Methods(Objc)
    @objc func ageToolBarDone() {
        myTextField2.text = agePickerView.selectedTitleForComponent(component: 0, pickerView: agePickerView)
        ageToolBar.endEditing(true)
        myTextField3.becomeFirstResponder()
    }
    @objc func dateToolBarDone() {
        let date = DateFormatter()
        date.dateStyle = .medium
        date.timeStyle = .none
        myTextField3.text = date.string(from: datePickerView.date)
        myTextField3.resignFirstResponder()
        dateToolBar.endEditing(true)
        instagramDone()
    }
    @objc func instagramDone() {
        alert = UIAlertController(
            title: "Hello, my friend!", message: "Enter your nickname", preferredStyle: .alert)
//        let action = UIAlertAction(
//            title: "Enter", style: .default) { _ in
//            self.myTextField4.text = alert.textFields?.first?.text
//        }
        alert.addTextField { ( tf) in
            tf.delegate = self
            tf.placeholder = "For example: @40veYourNickName"
        }
//        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        //Hide Alert
//        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
//                self.myTextField4.text = self.alert.textFields?.first?.text
//                self.alert.dismiss(animated: true, completion: nil)
//        }
    }
    @objc func buttonDone() {
        if marriedSwitch.isOn {
            myButton.setTitle("Go", for: .normal)
            let vc = SecondViewController()
            let navVC = UINavigationController(rootViewController: vc)
            navVC.modalTransitionStyle = .coverVertical
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true, completion: nil)
        } else {
            myButton.setTitle("Your need a wife!", for: .normal)
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: myButton.center.x - 15, y: myButton.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: myButton.center.x + 15, y: myButton.center.y))

            myButton.layer.add(animation, forKey: "position")
        }
    }


}
