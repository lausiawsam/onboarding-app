import Foundation
import UIKit

final class NavigationOptionView: UIStackView {
    
    private var onTap: (() -> Void?)?
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    required init(
        firstLineText: String,
        secondLineText: String,
        imageSystemName: String,
        onTap: (() -> Void?)? = nil
    ) {
        super.init(frame: .zero)
        self.onTap = onTap
        setup(firstLineText, secondLineText, imageSystemName)
    }
    
    private func setup(
        _ firstLineText: String,
        _ secondLineText: String,
        _ imageSystemName: String
    ) {
        axis = .horizontal
        spacing = 20
        alignment = .center
        distribution = .fill
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler))
        addGestureRecognizer(tapGesture)
        
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
        
        addArrangedSubview(avatarView)
        addArrangedSubview(textStackView)
        addArrangedSubview(spacer)
        addArrangedSubview(chevronView)
    }
    
    @objc func tapGestureHandler() {
        if let safeOnTap = onTap {
            safeOnTap()
        }
    }
}
