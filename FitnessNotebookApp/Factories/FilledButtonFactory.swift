//
//  FilledButtonFactory.swift
//  FitnessNotebookApp
//
//  Created by Sergei Bakhmatov on 22.07.2023.
//

import UIKit

protocol ButoonFactory {
    func createButton() -> UIButton
}

final class FilledButtonFactory: ButoonFactory {
    
    let title: String
    let color: UIColor
    let action: UIAction
    
    init(title: String, color: UIColor, action: UIAction) {
        self.title = title
        self.color = color
        self.action = action
    }
    
    func createButton() -> UIButton {
        var attributes = AttributeContainer()
        attributes.font = UIFont.boldSystemFont(ofSize: 18)
        
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.attributedTitle = AttributedString(title, attributes: attributes)
        buttonConfiguration.baseBackgroundColor = color
        let button = UIButton(configuration: buttonConfiguration, primaryAction: action)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    
}
