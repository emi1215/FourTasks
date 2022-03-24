//
//  Task1InputViewController.swift
//  FourTasks
//
//  Created by 横田瑛美 on 2022/03/23.
//

import UIKit
import RealmSwift

class Task1InputViewController: UIViewController {
    @IBOutlet weak var task1TitleTextField: UITextField!
    @IBOutlet weak var task1ContentsTextView: UITextView!
    @IBOutlet weak var task1DatePicker: UIDatePicker!
    
    let realm = try! Realm()
    var task: Task1!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
                self.view.addGestureRecognizer(tapGesture)

                task1TitleTextField.text = task.title1
                task1ContentsTextView.text = task.contents1
                task1DatePicker.date = task.date1

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            try! realm.write {
                self.task.title1 = self.task1TitleTextField.text!
                self.task.contents1 = self.task1ContentsTextView.text
                self.task.date1 = self.task1DatePicker.date
                self.realm.add(self.task, update: .modified)
            }

            super.viewWillDisappear(animated)
        }

        @objc func dismissKeyboard(){
            // キーボードを閉じる
            view.endEditing(true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


