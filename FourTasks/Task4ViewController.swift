//
//  Task4ViewController.swift
//  FourTasks
//
//  Created by 横田瑛美 on 2022/03/24.
//

import UIKit
import RealmSwift

class Task4ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var task4TableView: UITableView!
    
    let realm = try! Realm()
    
    var taskArray = try! Realm().objects(Task4.self).sorted(byKeyPath: "date4", ascending: true)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            let task4InputViewController:Task4InputViewController = segue.destination as! Task4InputViewController

            if segue.identifier == "task4CellSegue" {
                let indexPath = self.task4TableView.indexPathForSelectedRow
                task4InputViewController.task = taskArray[indexPath!.row]
            } else {
                let task = Task4()

                let allTasks = realm.objects(Task4.self)
                if allTasks.count != 0 {
                    task.id4 = allTasks.max(ofProperty: "id")! + 1
                }

                task4InputViewController.task = task
            }
        }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           task4TableView.reloadData()
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        task4TableView.fillerRowHeight = UITableView.automaticDimension
        task4TableView.delegate = self
        task4TableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
        }

        // 各セルの内容を返すメソッド
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // 再利用可能な cell を得る
            let cell = tableView.dequeueReusableCell(withIdentifier: "Task4Cell", for: indexPath)
            
            let task = taskArray[indexPath.row]
                    cell.textLabel?.text = task.title4

                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-dd HH:mm"

                    let dateString:String = formatter.string(from: task.date4)
                    cell.detailTextLabel?.text = dateString

            return cell
        }

        // 各セルを選択した時に実行されるメソッド
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "task4CellSegue",sender: nil)
        }

        // セルが削除が可能なことを伝えるメソッド
        func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)-> UITableViewCell.EditingStyle {
            return .delete
        }

        // Delete ボタンが押された時に呼ばれるメソッド
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            if editingStyle == .delete {
                        // データベースから削除する
                        try! realm.write {
                            self.realm.delete(self.taskArray[indexPath.row])
                            tableView.deleteRows(at: [indexPath], with: .fade)
                        }
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

}
