//
//  NetworkManager.swift
//  testTask
//
//  Created by Юрий on 28.03.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func loadCategories(completion: @escaping ([String]?, String?) -> Void)
    func loadIngredients(completion: @escaping ([String]?, String?) -> Void)
    func addIngredient(name: String, completion: @escaping (String?) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    
    func loadCategories(completion: @escaping ([String]?, String?) -> Void) {
        // simulated get request
        let categories = ["Салаты", "Супы", "Фирменные блюда", "Основные"]
        completion(categories, nil)
    }
    
    func loadIngredients(completion: @escaping ([String]?, String?) -> Void) {
        // simulated get request
        let ingredients = ["Огурцы", "Перец", "Спаржа", "Курица", "Помидор", "Мидии"]
        completion(ingredients, nil)
    }
    
    func addIngredient(name: String, completion: @escaping (String?) -> Void) {
        // simulated post request
        completion(nil)
    }

}
