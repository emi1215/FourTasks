//
//  Task1ViewController.swift
//  FourTasks
//
//  Created by 横田瑛美 on 2022/03/23.
//

import UIKit

class Task1ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var task1TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        task1TableView.fillerRowHeight = UITableView.automaticDimension
        task1TableView.delegate = self
        task1TableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Task1Cell", for: indexPath)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)-> UITableViewCell.EditingStyle {
            return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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


