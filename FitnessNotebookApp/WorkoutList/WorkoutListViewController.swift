//
//  ViewController.swift
//  FitnessNotebookApp
//
//  Created by Sergei Bakhmatov on 21.07.2023.
//

import UIKit

class WorkoutListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setupNavBar()
    }

    @objc private func addNewWorkout() {
        
    }

}

// MARK: - SetupUI
private extension WorkoutListViewController {
    
    func setupNavBar() {
        title = "Workout List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .brown
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewWorkout)
        )
        navigationController?.navigationBar.tintColor = .white
    }
    
}

