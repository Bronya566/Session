//
//  GroupsViewController.swift
//  Lesson1
//
//  Created by Marcus on 22.02.2021.
//

import UIKit

class GroupsViewController: UITableViewController {
    
    private var groups: [Group] = []
    private var finishGroups = TestsData.testsGroup()
    private var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.vkFriendsGroup() { data in
            self.updateGroups(data: data)
        }
    }
    
    private func updateGroups(data: [Group]) {
        groups = data
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groups.count
    }

    // MARK: - Segues
    @IBAction func unwingFromManyGroups(_ sender: UIStoryboardSegue ){
        
        guard
        let controller = sender.source as? ManyGroupsViewController,
        let indexPath = controller.tableView.indexPathForSelectedRow
        else {return}
        let manyGroups = controller.manyGroups[indexPath.row]
        finishGroups.append(manyGroups)
        groups.append(manyGroups)
        tableView.reloadData()
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath)

        let name = groups[indexPath.row].name
        cell.textLabel?.text = name
        cell.imageView?.load(url: groups[indexPath.row].imageName)

        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    
    }

extension GroupsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let search = searchBar.text ?? ""
        var newGroups: [Group] = []
        for group in finishGroups {
            if group.name.contains(search) {
                newGroups.append(group)
            }
        }
        groups = newGroups
        if search == "" {
            groups = finishGroups
        }
        tableView.reloadData()
    }
}

class ManyGroupsViewController: UITableViewController {
    var manyGroups = TestsData.testsManyGroups()
    @IBAction func ManyGroups(_action: UIButton){
        let storyboardTableView = UIStoryboard(name: "ManyGroups", bundle: nil)
        let nextScreen = storyboardTableView.instantiateViewController(identifier: "ManyGroupsViewController")
        
        present(nextScreen, animated: true, completion: nil)
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return manyGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ManyGroupCell", for: indexPath)

        let name = manyGroups[indexPath.row].name
        cell.textLabel?.text = name
        cell.imageView?.image = UIImage(systemName: manyGroups[indexPath.row].imageName)

        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            manyGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    
}
