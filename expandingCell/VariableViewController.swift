//
//  VariableViewController.swift
//  expandingCell
//
//  Created by Soulchild on 07/02/2020.
//  Copyright © 2020 fluffy. All rights reserved.
//

import UIKit

class VariableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var expandedIndexSet : IndexSet = []
    
    var avatars = ["Asriel", "Sans", "Toriel"]
    var messages = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra nisl eu tellus ullamcorper, quis imperdiet nisl fermentum. Pellentesque efficitur convallis turpis ut porttitor. Cras eleifend purus eu fringilla mattis. Sed finibus rutrum finibus. Donec ornare imperdiet erat id porttitor. Curabitur non dui ut risus finibus accumsan quis id erat.",
        
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In malesuada mi sed tincidunt sodales. Vestibulum fringilla viverra diam, nec luctus quam fermentum et. Proin vel leo a augue iaculis tempus. Phasellus a nulla quis arcu auctor imperdiet sed faucibus neque. Proin eu odio erat. Phasellus convallis velit id velit luctus, non hendrerit risus molestie. Morbi at libero imperdiet, pharetra nunc et, congue quam. Nullam ac lorem ac sem lobortis interdum. Curabitur nibh leo, ultrices in posuere id, ullamcorper quis nunc. Vestibulum ut leo venenatis nunc aliquet ornare. Proin at dolor eget lectus posuere tempor. Donec scelerisque semper tortor ac molestie.",
        
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed nulla dignissim, porta libero ac, facilisis erat. Nulla facilisi. Sed finibus, neque vitae fringilla iaculis, diam nunc iaculis dui, eget vulputate metus arcu nec orci. Sed maximus nunc posuere gravida malesuada. Pellentesque id arcu pellentesque, viverra neque at, elementum ligula. Curabitur sit amet quam risus. Sed eu dapibus nulla. Quisque ac dictum lectus. Maecenas in magna a nulla sodales aliquam ac at mi. Proin rhoncus leo sit amet lorem luctus dignissim. Vivamus faucibus mauris metus, vestibulum fermentum elit feugiat vel. In quis magna bibendum, egestas erat non, consectetur lorem. Praesent."
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 280.0
    }
    
}

extension VariableViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? VariableTableViewCell else {
            print("failed to get cell")
            return UITableViewCell()
        }
        
        cell.avatarImageView.image = UIImage(named: avatars[indexPath.row])
        cell.messageLabel.text = messages[indexPath.row]
        cell.selectionStyle = .none
        
        if expandedIndexSet.contains(indexPath.row) {
            cell.messageLabel.numberOfLines = 0
        } else {
            cell.messageLabel.numberOfLines = 3
        }
        
        return cell
    }
}

extension VariableViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if(expandedIndexSet.contains(indexPath.row)){
            expandedIndexSet.remove(indexPath.row)
        } else {
            expandedIndexSet.insert(indexPath.row)
        }

        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

