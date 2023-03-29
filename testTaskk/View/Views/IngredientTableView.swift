//
//  IngredientTableView.swift
//  testTaskk
//
//  Created by Юрий on 29.03.2023.
//

import UIKit

final class IngredientTableView: UITableView {
    
    var viewModel: MainViewModelProtocol? {
        didSet {
            reloadData()
        }
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        registerCells()
        setupView()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func registerCells() {
        register(IngredientCell.self, forCellReuseIdentifier: IngredientCell.id)
    }
    
    private func setupView() {
        separatorStyle = .none
    }
    
    private func setDelegates() {
        delegate = self
        dataSource = self
    }
}

extension IngredientTableView: UITableViewDelegate,
                               UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.ingredients.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.id, for: indexPath) as? IngredientCell
        else {
            return UITableViewCell()
        }
        cell.ingredientLabel.text = viewModel?.ingredients[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        31
    }
    
}
