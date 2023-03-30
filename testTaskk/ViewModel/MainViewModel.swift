//
//  MainViewModel.swift
//  testTaskk
//
//  Created by Юрий on 29.03.2023.
//

import Foundation

protocol MainViewModelProtocol {
    var ingredients: [String] { get set }
    var categories: [String] { get set }
    
    func loadIngredients(completion: @escaping (String?) -> Void)
    func loadCategories(completion: @escaping (String?) -> Void)
    func addIngredient(name: String, completion: @escaping (String?) -> Void)
}


final class MainViewModel: MainViewModelProtocol {
    
    var networkManager: NetworkManagerProtocol?
    
    var categories = [String]()
    var ingredients = [String]()
    
    func loadCategories(completion: @escaping (String?) -> Void) {
        networkManager?.loadCategories { [weak self] categories, error in
            guard let self = self else { return }
            
            if let categories = categories {
                self.categories = categories
                completion(nil)
            } else {
                completion(error)
            }
        }
    }
    
    func loadIngredients(completion: @escaping (String?) -> Void) {
        networkManager?.loadIngredients { [weak self] ingredients, error in
            guard let self = self else { return }
            
            if let ingredients = ingredients {
                self.ingredients = ingredients
                completion(nil)
            } else {
                completion(error)
            }
        }
    }
    
    func addIngredient(name: String, completion: @escaping (String?) -> Void) {
        networkManager?.addIngredient(name: name) { [weak self] error in
            guard let self = self else { return }
            
            if let error = error {
                completion(error)
            } else {
                self.ingredients.append(name)
                completion(nil)
            }
        }
    }
}
