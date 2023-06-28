import UIKit

class ViewController: UIViewController {
    
    var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        loginButton = UIButton(type: .system)
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 30)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(handleLoginTouchUpInside), for: .touchUpInside)
        
        view.addSubview(loginButton)
        constraintsInit()
    }
    
    func constraintsInit() {
        NSLayoutConstraint.activate([
          loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func handleLoginTouchUpInside() {
        print("Login button has been tapped")
        let secondVc = SecondViewController()
        secondVc.modalPresentationStyle = .fullScreen
        present(secondVc, animated: true)
      }

}

