import Foundation
import UIKit

final class CounterViewController: UIViewController {
    
    private let stackView = UIStackView()
    private let counterLabel = UILabel()
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        layoutStackView()
        layoutCounter()
    }
    
    func layoutStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func layoutCounter() {
        let decrementButton = UIButton()
        let decrementImage = UIImage(systemName: "minus.circle.fill")
        var decrementButtonConfig = UIButton.Configuration.plain()
        decrementButtonConfig.image = decrementImage
        decrementButton.configuration = decrementButtonConfig
        decrementButton.addTarget(self, action: #selector(decrementCounter), for: .touchUpInside)
        
        let incrementButton = UIButton()
        let incrementImage = UIImage(systemName: "plus.circle.fill")
        var incrementButtonConfig = UIButton.Configuration.plain()
        incrementButtonConfig.image = incrementImage
        incrementButton.configuration = incrementButtonConfig
        incrementButton.addTarget(self, action: #selector(incrementCounter), for: .touchUpInside)
        
        counterLabel.text = "\(counter)"
        counterLabel.font = .systemFont(ofSize: 40, weight: .bold)
        
        stackView.addArrangedSubview(decrementButton)
        stackView.addArrangedSubview(counterLabel)
        stackView.addArrangedSubview(incrementButton)
    }
    
    @objc func decrementCounter() {
        counter -= 1
        updateCounterLabel()
    }
    
    @objc func incrementCounter() {
        counter += 1
        updateCounterLabel()
    }
    
    func updateCounterLabel() {
        counterLabel.text = "\(counter)"
    }
}
