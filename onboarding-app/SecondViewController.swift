import Foundation
import UIKit

final class SecondViewController: UIViewController {
    
    private var stackView = UIStackView()
    private var closeButton: UIButton!
    private var titleLabel: UILabel!
    private var sectionTitle = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        layoutStackView()
        layoutCloseButton()
        layoutTitle()
        layoutNavigationOption(
            firstLineText: "An account outside Wise",
            secondLineText: "Send from your bank",
            imageSystemName: "building.columns.circle.fill",
            onTap: #selector(showCounterView)
        )
        layoutSectionTitle()
        layoutNavigationOption(
            firstLineText: "4000 EUR available",
            secondLineText: "Euro",
            imageSystemName: "eurosign.circle.fill"
        )
    }
    
    func layoutStackView() {
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func layoutCloseButton() {
        let colorConfig = UIImage.SymbolConfiguration(hierarchicalColor: .systemGray)
        let scaleConfig = UIImage.SymbolConfiguration(pointSize: 50)
        let closeButtonImage = UIImage(systemName: "xmark.circle.fill")?.applyingSymbolConfiguration(colorConfig)?.applyingSymbolConfiguration(scaleConfig)
        
        closeButton = UIButton(type: .custom)
        closeButton.setImage(closeButtonImage, for: .normal)
        closeButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        
        stackView.addArrangedSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: stackView.layoutMarginsGuide.leadingAnchor),
            closeButton.topAnchor.constraint(equalTo: stackView.layoutMarginsGuide.topAnchor)
        ])
    }
    
    func layoutTitle() {
        titleLabel = UILabel()
        titleLabel.text = "Where do you want to send from?"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.numberOfLines = 0
        
        stackView.addArrangedSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalTo: stackView.layoutMarginsGuide.widthAnchor)
        ])
    }
    
    func layoutSectionTitle() {
        sectionTitle.axis = .vertical
        sectionTitle.spacing = 8
        sectionTitle.alignment = .fill
        sectionTitle.distribution = .equalSpacing
        stackView.addArrangedSubview(sectionTitle)
        NSLayoutConstraint.activate([
            sectionTitle.widthAnchor.constraint(equalTo: stackView.layoutMarginsGuide.widthAnchor)
        ])
        
        let title = UILabel()
        title.text = "A Wise Balance"
        title.textColor = .systemGray
        sectionTitle.addArrangedSubview(title)
        
        let divider = UIView()
        divider.backgroundColor = .systemGray
        sectionTitle.addArrangedSubview(divider)
        NSLayoutConstraint.activate([
            divider.heightAnchor.constraint(equalToConstant: 1),
            divider.widthAnchor.constraint(equalTo: sectionTitle.widthAnchor, multiplier: 1)
        ])
    }
    
    func layoutNavigationOption(
        firstLineText: String,
        secondLineText: String,
        imageSystemName: String,
        onTap: Selector? = nil
    ) {
        let navigationOption = NavigationOptionView(
            firstLineText: "4000 EUR available",
            secondLineText: "Euro",
            imageSystemName: "eurosign.circle.fill",
            viewController: self,
            onTap: onTap
        )

        stackView.addArrangedSubview(navigationOption)
        NSLayoutConstraint.activate([
            navigationOption.widthAnchor.constraint(equalTo: stackView.layoutMarginsGuide.widthAnchor)
        ])
    }
    
    @objc func closeView() {
        dismiss(animated: true)
    }
    
    @objc func showCounterView() {
        present(CounterViewController(), animated: true)
    }
}
