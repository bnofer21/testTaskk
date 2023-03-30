//
//  MainViewController.swift
//  testTaskk
//
//  Created by Юрий on 29.03.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    var viewModel: MainViewModelProtocol?
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setTargets()
        getCategories()
        getIngredients()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setMoveViewNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        deleteMoveViewNotifiations()
    }
    
    private func setTargets() {
        mainView.addIngredientTarget(target: self, action: #selector(addIngridient))
    }
    
    private func showErrorAlert(_ error: String) {
        let alertController = UIAlertController(
            title: "Ошибка",
            message: error,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "ОК", style: .default)
        alertController.addAction(okAction)
        
        present(alertController, animated: true)
    }
    
    private func getCategories() {
        viewModel?.loadCategories { [weak self] error in
            guard let self = self else { return }

            if let error = error {
                self.showErrorAlert(error)
            } else {
                self.mainView.categoryCollectionView.viewModel = self.viewModel
            }
        }
    }
    
    private func getIngredients() {
        viewModel?.loadIngredients{ [weak self] error in
            guard let self = self,
                  let viewModel = self.viewModel
            else { return }
            
            if let error = error {
                self.showErrorAlert(error)
            } else {
                self.mainView.setViewModel(viewModel)
            }
        }
    }
    
    private func showAddAlert() {
        let alertController = UIAlertController(title: "Добавить ингридиент",
                                                message: "Введите название ингридиента",
                                                preferredStyle: .alert)
        alertController.addTextField()
        
        let addAction = UIAlertAction(title: "Добавить", style: .default) { [weak self] _ in
            let textfield = alertController.textFields?.first
            guard let text = textfield?.text else { return }
            self?.addIngredient(name: text)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .default)
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    private func addIngredient(name: String) {
        viewModel?.addIngredient(name: name) { [weak self] error in
            guard let self = self,
                  let viewModel = self.viewModel else { return }
            
            if let error = error {
                self.showErrorAlert(error)
            } else {
                self.mainView.addIngredient(at: viewModel.ingredients.count-1)
            }
        }
    }
    
    @objc private func addIngridient() {
        showAddAlert()
    }

}




