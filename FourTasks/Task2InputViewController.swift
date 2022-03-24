//
//  Task2InputViewController.swift
//  FourTasks
//
//  Created by 横田瑛美 on 2022/03/24.
//

import UIKit
import RealmSwift

class Task2InputViewController: UIViewController {
    @IBOutlet weak var task2TextField: UITextField!
    @IBOutlet weak var task2TextView: UITextView!
    @IBOutlet weak var task2DatePicker: UIDatePicker!
    
    let realm = try! Realm()
    var task: Task2!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
                self.view.addGestureRecognizer(tapGesture)

                task2TextField.text = task.title2
                task2TextView.text = task.contents2
                task2DatePicker.date = task.date2
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
           try! realm.write {
               self.task.title2 = self.task2TextField.text!
               self.task.contents2 = self.task2TextView.text
               self.task.date2 = self.task2DatePicker.date
               self.realm.add(self.task, update: .modified)
           }

           super.viewWillDisappear(animated)
       }

       @objc func dismissKeyboard(){
           // キーボードを閉じる
           view.endEditing(true)
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
