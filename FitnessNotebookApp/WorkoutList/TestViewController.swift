//
//  TestViewController.swift
//  FitnessNotebookApp
//
//  Created by Sergei Bakhmatov on 28.07.2023.
//

import UIKit

class TestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    let workouts = Workout.fetchWorkouts()
    
    
    private lazy var calendarView: UICalendarView = {
        let calendar = UICalendarView()
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        
        calendar.calendar = Calendar(identifier: .gregorian)
        calendar.backgroundColor = .gray
        calendar.layer.cornerCurve = .continuous
        calendar.layer.cornerRadius = 15
        calendar.tintColor = .systemTeal
        calendar.fontDesign = .rounded
        calendar.selectionBehavior = dateSelection
        
        calendar.translatesAutoresizingMaskIntoConstraints = false
        
        return calendar
    }()
    
    private lazy var workoutList: UITableView = {
        let list = UITableView()
        
        list.backgroundColor = .gray
        list.layer.cornerCurve = .continuous
        list.layer.cornerRadius = 15
        list.dataSource = self
        list.delegate = self
        list.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        list.translatesAutoresizingMaskIntoConstraints = false
        
        return list
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        setupSubviews(calendarView, workoutList)
        setConstraints()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
//        cell.configurationState
        return cell
    }
    
    func setupNavBar() {
        title = "Workout List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor.gray
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .add,
//            target: self,
//            action: #selector(addNewWorkout)
//        )
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            workoutList.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 20),
            workoutList.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            workoutList.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            workoutList.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
}

extension TestViewController: UICalendarSelectionSingleDateDelegate {
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        print(dateComponents?.date)
    }
}
