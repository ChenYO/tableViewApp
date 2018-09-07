//
//  RestarantDetailViewController.swift
//  tableViewApp
//
//  Created by 陳仲堯 on 2018/9/6.
//  Copyright © 2018年 陳仲堯. All rights reserved.
//

import UIKit

class RestarantDetailViewController: UIViewController {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    var restaurant: Restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = restaurant.name
        location.text = restaurant.location
        type.text = restaurant.type
        restaurantImage.image = UIImage(named: restaurant.image)
        
        navigationItem.largeTitleDisplayMode = .never
            
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}
