//
//  NewWorkoutViewController.swift
//  FitnessNotebookApp
//
//  Created by Sergei Bakhmatov on 22.07.2023.
//

import UIKit

final class NewWorkoutViewController: UIViewController {
    
    private lazy var workoutTextField: UITextField = {
        let textField = UITextField()
        
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(
            string: "New Workout",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let filledButtonFactory = FilledButtonFactory(
            title: "Save Workout",
            color: UIColor(named: "Teal") ?? .blue,
            action: UIAction { [unowned self] _ in
                save()
            }
        )
        return filledButtonFactory.createButton()
    }()
    
    private lazy var cancleButton: UIButton = {
        let filledButtonFactory = FilledButtonFactory(
            title: "Cancle",
            color: UIColor(named: "Maras") ?? .red,
            action: UIAction { [unowned self] _ in
                dismiss(animated: true)
            }
        )
        return filledButtonFactory.createButton()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        setupSubviews(workoutTextField, saveButton, cancleButton)
        setConstraints()
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            workoutTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            workoutTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            workoutTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: workoutTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            cancleButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
            cancleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            cancleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    private func save() {
        dismiss(animated: true)
    }

}
