//
//  Task3InputViewController.swift
//  FourTasks
//
//  Created by 横田瑛美 on 2022/03/24.
//

import UIKit
import RealmSwift

class Task3InputViewController: UIViewController {
    @IBOutlet weak var task3TextField: UITextField!
    @IBOutlet weak var task3TextView: UITextView!
    @IBOutlet weak var task3DatePicker: UIDatePicker!
    
    let realm = try! Realm()
    var task: Task3!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
                self.view.addGestureRecognizer(tapGesture)

                task3TextField.text = task.title3
                task3TextView.text = task.contents3
                task3DatePicker.date = task.date3

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            try! realm.write {
                self.task.title3 = self.task3TextField.text!
                self.task.contents3 = self.task3TextView.text
                self.task.date3 = self.task3DatePicker.date
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
