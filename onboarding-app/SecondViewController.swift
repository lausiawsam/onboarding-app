import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    var stackView = UIStackView()
    var closeButton: UIButton!
    var titleLabel: UILabel!
    var sectionTitle = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        layoutStackView()
        layoutCloseButton()
        layoutTitle()
        layoutCard(
            imageSystemName: "building.columns.circle.fill",
            firstLineText: "An account outside Wise",
            secondLineText: "Send from your bank",
            onTap: #selector(showCounterView)
        )
        layoutSectionTitle()
        layoutCard(
            imageSystemName: "eurosign.circle.fill",
            firstLineText: "4000 EUR available",
            secondLineText: "Euro"
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
        let scaleConfig = UIImage.SymbolConfiguration(pointSize: 40)
        let closeButtonImage = UIImage(systemName: "xmark.circle.fill")?.applyingSymbolConfiguration(colorConfig)?.applyingSymbolConfiguration(scaleConfig)
        
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.image = closeButtonImage
        // TODO: ask why there's a horizontal margin around the image by default. Is this a default UIButton inset thing? Or is it an SFSymbol thing?
        buttonConfig.contentInsets = .init(top: 0, leading: -20, bottom: 0, trailing: -20)
        
        closeButton = UIButton()
        closeButton.configuration = buttonConfig
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
            titleLabel.leadingAnchor.constraint(equalTo: stackView.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: stackView.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    func layoutSectionTitle() {
        sectionTitle.axis = .vertical
        sectionTitle.spacing = 8
        sectionTitle.alignment = .fill
        sectionTitle.distribution = .equalSpacing
        stackView.addArrangedSubview(sectionTitle)
        NSLayoutConstraint.activate([
            sectionTitle.leadingAnchor.constraint(equalTo: stackView.layoutMarginsGuide.leadingAnchor),
            sectionTitle.trailingAnchor.constraint(equalTo: stackView.layoutMarginsGuide.trailingAnchor)
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
    
    func layoutCard(
        imageSystemName: String,
        firstLineText: String,
        secondLineText: String,
        onTap: Selector? = nil
    ) {
        let cardStackView = UIStackView()
        cardStackView.axis = .horizontal
        cardStackView.spacing = 20
        cardStackView.alignment = .center
        cardStackView.distribution = .fill
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
        cardStackView.isUserInteractionEnabled = true
        
        if let action = onTap {
            let tapGesture = UITapGestureRecognizer(target: self, action: action)
            cardStackView.addGestureRecognizer(tapGesture)
        }
        
        // Avatar icon
        let colorConfig = UIImage.SymbolConfiguration(hierarchicalColor: .systemGray)
        let avatarSizeConfig = UIImage.SymbolConfiguration(pointSize: 50)
        let avatarImage = UIImage(systemName: imageSystemName)?.applyingSymbolConfiguration(colorConfig)?.applyingSymbolConfiguration(avatarSizeConfig)
        let avatarView = UIImageView(image: avatarImage)
        NSLayoutConstraint.activate([
            avatarView.widthAnchor.constraint(equalTo: avatarView.heightAnchor)
        ])
        
        // Text labels
        let textStackView = UIStackView()
        textStackView.axis = .vertical
        
        let firstLine = UILabel()
        firstLine.text = firstLineText
        firstLine.font = .systemFont(ofSize: 18, weight: .bold)
        
        let secondLine = UILabel()
        secondLine.text = secondLineText
        secondLine.textColor = .systemGray
        
        textStackView.addArrangedSubview(firstLine)
        textStackView.addArrangedSubview(secondLine)
        
        // Spacer
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        // Chevron
        let chevronSizeConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .light, scale: .default)
        let chevronImage = UIImage(systemName: "chevron.right")?.applyingSymbolConfiguration(colorConfig)?.applyingSymbolConfiguration(chevronSizeConfig)
        let chevronView = UIImageView(image: chevronImage)
        
        cardStackView.addArrangedSubview(avatarView)
        cardStackView.addArrangedSubview(textStackView)
        cardStackView.addArrangedSubview(spacer)
        cardStackView.addArrangedSubview(chevronView)
        
        stackView.addArrangedSubview(cardStackView)
        NSLayoutConstraint.activate([
            cardStackView.leadingAnchor.constraint(equalTo: stackView.layoutMarginsGuide.leadingAnchor),
            cardStackView.trailingAnchor.constraint(equalTo: stackView.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    @objc func closeView() {
        self.dismiss(animated: true)
    }
    
    @objc func showCounterView() {
        present(CounterViewController(), animated: true)
    }
}
