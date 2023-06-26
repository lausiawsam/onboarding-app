import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "HELLO WORLD"
        label.textColor = .white
        label.font = .systemFont(ofSize: 40)
        
        view.addSubview(label)
        constraintsInit()
    }
    
    func constraintsInit() {
        NSLayoutConstraint.activate([
          label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
