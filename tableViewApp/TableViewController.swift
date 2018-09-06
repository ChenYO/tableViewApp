//
//  TableViewController.swift
//  tableViewApp
//
//  Created by 陳仲堯 on 2018/9/5.
//  Copyright © 2018年 陳仲堯. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var restaurantList = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "CafeLore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    var locationList = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    var typeList = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / SeaFood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    var restaurantImage = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster" , "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    var restaurantVisited = Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        
        cell.name.text = restaurantList[indexPath.row]
        cell.location.text = locationList[indexPath.row]
        cell.type.text = typeList[indexPath.row]
        cell.restaurantImage.image = UIImage(named: restaurantImage[indexPath.row])
        
        cell.heartImage.isHidden = (self.restaurantVisited[indexPath.row]) ? false : true
        //cell.accessoryType = restaurantVisited[indexPath.row] ? .checkmark : .none
        
        return cell
    }

    /*
     導入導覽控制器:將改為點擊後另開視窗
    */
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        //建立動作選單
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do", preferredStyle: .actionSheet)
//
//        //ipad呈現選單的方式為popover的方式，所以須多加判斷以防在ipad使用時閃退
//        if let popoverController = optionMenu.popoverPresentationController {
//            if let cell = tableView.cellForRow(at: indexPath) {
//                popoverController.sourceView = cell
//                popoverController.sourceRect = cell.bounds
//            }
//        }
//
//        //加入打電話動作
//        let callActionHandler = {(action: UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later", preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
//
//        //加入打卡動作
//        let title = restaurantVisited[indexPath.row] ? "Undo CheckIn" : "Check In"
//        let checkInAction = UIAlertAction(title: title, style: .default, handler: {(action: UIAlertAction) -> Void in
//            let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
//
//            //由於cell reuse的關係，當螢幕往下拉時，會有同列的資料被勾選，所以要記錄哪一列被標記來預防此錯誤
//            self.restaurantVisited[indexPath.row] = (self.restaurantVisited[indexPath.row]) ? false : true
//
//            cell.heartImage.isHidden = (self.restaurantVisited[indexPath.row]) ? false : true
//
//        })
//
//        //取消動作
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//        optionMenu.addAction(callAction)
//        optionMenu.addAction(checkInAction)
//        optionMenu.addAction(cancelAction)
//
//        //呈現選單
//        present(optionMenu, animated: true, completion: nil)
//
//        //取消列的選取
//        tableView.deselectRow(at: indexPath, animated: false)
//    }
    
    //內建刪除列的方法
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .delete {
//            restaurantList.remove(at: indexPath.row)
//            locationList.remove(at: indexPath.row)
//            typeList.remove(at: indexPath.row)
//            restaurantVisited.remove(at: indexPath.row)
//            restaurantImage.remove(at: indexPath.row)
//        }
//
//        tableView.deleteRows(at: [indexPath], with: .fade)
//    }
    
    //向左滑時: 自訂編輯列的功能
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //刪除列
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (action, sourceView, completionHandler) in
            //從資料來源刪除列
            self.restaurantList.remove(at: indexPath.row)
            self.locationList.remove(at: indexPath.row)
            self.typeList.remove(at: indexPath.row)
            self.restaurantImage.remove(at: indexPath.row)
            self.restaurantVisited.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            completionHandler(true)
        }
        
        //分享列
        let shareAction = UIContextualAction(style: .normal, title: "Share") {
            (action, sourceView, completionHandler) in
            let defaultText = "Just checking in at " + self.restaurantList[indexPath.row]
            
            let activityController: UIActivityViewController
            
            //可分享圖片至其他軟體
            if let imageToShare = UIImage(named: self.restaurantImage[indexPath.row]) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            //for ipad popover
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        return swipeConfiguration
    }
    
    //向右滑: 打卡
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let checkInAction = UIContextualAction(style: .normal, title: "checkIn") {
            (action, sourceView, completionHandler) in
            
            let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
            
            self.restaurantVisited[indexPath.row] = (self.restaurantVisited[indexPath.row]) ? false : true
            
            cell.heartImage.isHidden = (self.restaurantVisited[indexPath.row]) ? false : true
            
            completionHandler(true)
        }
        
        checkInAction.backgroundColor = UIColor(red: 38.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        //checkInAction.image = UIImage(named: "share")
        
        checkInAction.image = self.restaurantVisited[indexPath.row] ? UIImage(named: "undo") : UIImage(named: "tick")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkInAction])
        
        return swipeConfiguration
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestarantDetailViewController
                destinationController.restaurantName = restaurantImage[indexPath.row]
                destinationController.labelName = restaurantList[indexPath.row]
                destinationController.labelLocation = locationList[indexPath.row]
                destinationController.labelType = typeList[indexPath.row]
            }
        }
    }
    

}
