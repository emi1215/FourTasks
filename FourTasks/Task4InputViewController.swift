//
//  Task4InputViewController.swift
//  FourTasks
//
//  Created by 横田瑛美 on 2022/03/24.
//

import UIKit
import RealmSwift

class Task4InputViewController: UIViewController {
    @IBOutlet weak var task4TextField: UITextField!
    @IBOutlet weak var task4TextView: UITextView!
    @IBOutlet weak var task4DatePicker: UIDatePicker!
    
    let realm = try! Realm()
    var task: Task4!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
                self.view.addGestureRecognizer(tapGesture)

                task4TextField.text = task.title4
                task4TextView.text = task.contents4
                task4DatePicker.date = task.date4

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            try! realm.write {
                self.task.title4 = self.task4TextField.text!
                self.task.contents4 = self.task4TextView.text
                self.task.date4 = self.task4DatePicker.date
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
