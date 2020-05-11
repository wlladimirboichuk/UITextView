//
//  ViewController.swift
//  UiTextView
//
//  Created by Volodymyr Boichuk on 11.05.2020.
//  Copyright © 2020 Volodymyr Boichuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        textView.font = UIFont(name: "AppleSDGothicNeo-regular", size: 17)
        textView.backgroundColor = self.view.backgroundColor
        textView.layer.cornerRadius = 10
        
        // Свойства степпера
        stepper.value = 17
        stepper.minimumValue = 10
        stepper.maximumValue = 25
        
        stepper.tintColor = .white; stepper.backgroundColor = .gray
        
        
        //скрывает и подбирает логику размеров клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(notification:)), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
        
         NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(notification:)), name: Notification.Name.UIKeyboardWillWillHide, object: nil)
    }

// Скрытие клавиатуры по тапу за пределами текстовой вьюхи.
    override func touchesBegan (_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
//        self.view.endEding(true) // метод скрывает клавиатуру после тапов в любом месте.
//        textView.resignFirsResponder()//скрывает клавиатуру для конкретных обьектов
    }
    
    
    // Обеспечивает тап по местности
    // со стороны где тапаем клава поднимает текст.
    // По тапам клавиатура проскроливается.
//      guard let userInfo = notification.userInfo as? [String: AnyObject],
//            let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
//                else { return }
//
//            if notification.name == Notification.Name.UIKeyboardWillHide {
//                textView.contentInset = UIEdgeInsets.zero
//            } else {
//                textView.contentInset = UIEdgeInsets(top: 0,
//                                                     left: 0,
//                                                     bottom: keyboardFrame.height - bottomConstraint.constant,
//                                                     right: 0)
//
//                textView.scrollIndicatorInsets = textView.contentInset
//            }
//
//            textView.scrollRangeToVisible(textView.selectedRange)
//
//

extension ViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) { // Срабатывает при тапе на Text View
        textView.backgroundColor = .white
        textView.textColor = .gray
    }
    
    func textViewDidEndEditing(_ textView: UITextView) { // Срабатывает по окончании работы с Text View
        textView.backgroundColor = self.view.backgroundColor
        textView.textColor = .black
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = "\(textView.text.count)"
        return textView.text.count + (text.count - range.length) <= 60
    }
}

}
