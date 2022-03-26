//
//  Task3ViewController.swift
//  FourTasks
//
//  Created by 横田瑛美 on 2022/03/23.
//

import UIKit
import RealmSwift

class Task3ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var task3TableView: UITableView!
    
    let realm = try! Realm()
    
    var taskArray = try! Realm().objects(Task3.self).sorted(byKeyPath: "date3", ascending: true)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            let task3InputViewController:ViewController = segue.destination as! ViewController

            if segue.identifier == "task3CellSegue" {
                let indexPath = self.task3TableView.indexPathForSelectedRow
                task3InputViewController.task = taskArray[indexPath!.row]
            } else {
                let task = Task3()

                let allTasks = realm.objects(Task3.self)
                if allTasks.count != 0 {
                    task.id3 = allTasks.max(ofProperty: "id")! + 1
                }

                task3InputViewController.task = task
            }
        }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           task3TableView.reloadData()
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        task3TableView.fillerRowHeight = UITableView.automaticDimension
        task3TableView.delegate = self
        task3TableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return taskArray.count
        }

        // 各セルの内容を返すメソッド
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // 再利用可能な cell を得る
            let cell = tableView.dequeueReusableCell(withIdentifier: "Task3Cell", for: indexPath)
            
            let task = taskArray[indexPath.row]
                    cell.textLabel?.text = task.title3

            let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm"

            let dateString:String = formatter.string(from: task.date3)
                cell.detailTextLabel?.text = dateString

            return cell
        }

        // 各セルを選択した時に実行されるメソッド
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "task3CellSegue",sender: nil)
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
