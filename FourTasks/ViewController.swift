//
//  ViewController.swift
//  FourTasks
//
//  Created by 横田瑛美 on 2022/03/23.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    @IBOutlet weak var task1CategoryTextField: UITextField!
    @IBOutlet weak var task2CategoryTextField: UITextField!
    @IBOutlet weak var task3CategoryTextField: UITextField!
    @IBOutlet weak var task4CategoryTextField: UITextField!
    
    let realm = try! Realm()
    var task: View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
                self.view.addGestureRecognizer(tapGesture)

                task1CategoryTextField.text = task.category1
                task2CategoryTextField.text = task.category2
                task3CategoryTextField.text = task.category3
                task4CategoryTextField.text = task.category4
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            try! realm.write {
                self.task.category1 = self.task1CategoryTextField.text!
                self.task.category2 = self.task2CategoryTextField.text!
                self.task.category3 = self.task3CategoryTextField.text!
                self.task.category4 = self.task4CategoryTextField.text!
                self.realm.add(self.task, update: .modified)
            }

            super.viewWillDisappear(animated)
        }

        @objc func dismissKeyboard(){
            // キーボードを閉じる
            view.endEditing(true)
        }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }


}

