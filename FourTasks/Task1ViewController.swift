//
//  Task1ViewController.swift
//  FourTasks
//
//  Created by 横田瑛美 on 2022/03/23.
//

import UIKit
import RealmSwift

class Task1ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var task1TableView: UITableView!
    
    let realm = try! Realm()
    
    var taskArray = try! Realm().objects(Task1.self).sorted(byKeyPath: "date1", ascending: true)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let task1InputViewController:Task1InputViewController = segue.destination as! ViewController

            if segue.identifier == "task1CellSegue" {
                let indexPath = self.task1TableView.indexPathForSelectedRow
                task1InputViewController.task = taskArray[indexPath!.row]
            } else {
                let task = Task1()

                let allTasks = realm.objects(Task1.self)
                if allTasks.count != 0 {
                    task.id1 = allTasks.max(ofProperty: "id")! + 1
                }

                task1InputViewController.task = task
            }
        }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           task1TableView.reloadData()
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        task1TableView.fillerRowHeight = UITableView.automaticDimension
        task1TableView.delegate = self
        task1TableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Task1Cell", for: indexPath)
        
        let task = taskArray[indexPath.row]
                cell.textLabel?.text = task.title1

                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm"

                let dateString:String = formatter.string(from: task.date1)
                cell.detailTextLabel?.text = dateString

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)-> UITableViewCell.EditingStyle {
            return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
                    // データベースから削除する
                    try! realm.write {
                        self.realm.delete(self.taskArray[indexPath.row])
                        tableView.deleteRows(at: [indexPath], with: .fade)
                    }
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


