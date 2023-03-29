//
//  MainView.swift
//  testTaskk
//
//  Created by Юрий on 29.03.2023.
//

import UIKit

final class MainView: UIView {
    
    private var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Раздел"
        label.font = Fonts.getFont(weight: .bold, size: 30)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    var categoryCollectionView: CategoryCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 4
        let collectionView = CategoryCollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private var deleteCategoryButton: GrayButton = {
        let button = GrayButton()
        button.setTitle("Удалить раздел", for: .normal)
        button.titleLabel?.font = Fonts.getFont(weight: .regular, size: 14)
        return button
    }()
    
    private var dishLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.getFont(weight: .bold, size: 24)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.text = "Блюдо"
        return label
    }()
    
    private var dishNameTextfield: CustomTextfield = {
        let field = CustomTextfield()
        field.placeholder = "Название"
        return field
    }()
    
    private var dishIngredientsLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.getFont(weight: .bold, size: 24)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.text = "Состав"
        return label
    }()
    
    private var ingredientTableView = IngredientTableView()
    
    private var addIngridientButton: AnimatedButton = {
        let button = AnimatedButton()
        button.backgroundColor = UIColor(red: 0.255, green: 0.565, blue: 0.584, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitle("Добавить ингридиент", for: .normal)
        button.titleLabel?.font = Fonts.getFont(weight: .bold, size: 11)
        return button
    }()
    
    private var imageLogo: UIImageView = {
        let logo = UIImageView()
        logo.backgroundColor = UIColor(red: 0.933, green: 0.918, blue: 0.918, alpha: 1)
        logo.contentMode = .scaleAspectFit
        logo.layer.cornerRadius = 25
        logo.image = UIImage(named: "addImage")
        return logo
    }()
    
    private var addImageButton: GrayButton = {
        let button = GrayButton()
        button.setTitle("Загрузить", for: .normal)
        button.titleLabel?.font = Fonts.getFont(weight: .regular, size: 20)
        return button
    }()
    
    private var propertiesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 15
        return stack
    }()
    
    private var addDishButton: AnimatedButton = {
        let button = AnimatedButton()
        button.setTitle("Добавить блюдо", for: .normal)
        button.backgroundColor = UIColor(red: 0.153, green: 0.365, blue: 0.443, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configurePropertiesStack()
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        addView(categoryLabel)
        addView(categoryCollectionView)
        addView(deleteCategoryButton)
        addView(dishLabel)
        addView(dishNameTextfield)
        addView(dishIngredientsLabel)
        addView(ingredientTableView)
        addView(addIngridientButton)
        addView(imageLogo)
        addView(addImageButton)
        addView(propertiesStack)
        addView(addDishButton)
    }
    
    private func configurePropertiesStack() {
        let propertiesCount = Resources.PropertyNames.allCases.count
        for i in 0..<propertiesCount {
            
            let label = UILabel()
            let field = CustomTextfield()
            let stack = UIStackView()
            
            stack.spacing = 10
            stack.axis = .vertical
            stack.distribution = .fill
            
            label.text = Resources.PropertyNames.allCases[i].rawValue
            label.font = Fonts.getFont(weight: .bold, size: 22)
            
            field.placeholder = Resources.PropertyNames.allCases[i].rawValue
            field.heightAnchor.constraint(equalToConstant: 41).isActive = true
            
            stack.addArrangedSubview(label)
            stack.addArrangedSubview(field)
            
            propertiesStack.addArrangedSubview(stack)
        }
    }
    
    func addIngredientTarget(target: Any, action: Selector) {
        addIngridientButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func addIngredient(at row: Int) {
        ingredientTableView.insertRows(at: [IndexPath(row: row, section: 0)], with: .top)
    }
    
    func setViewModel(_ viewModel: MainViewModelProtocol) {
        ingredientTableView.viewModel = viewModel
    }
    
}

private extension MainView {
    
    func setConstraints() {
        setCategoryConstraints()
        setDishConstraints()
        setImageConstraints()
        setPropertiesConstraints()
    }
    
    func setCategoryConstraints() {
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 34.5),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            
            categoryCollectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 15),
            categoryCollectionView.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 24),
            categoryCollectionView.widthAnchor.constraint(equalToConstant: 322),
            
            deleteCategoryButton.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 5),
            deleteCategoryButton.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor),
            deleteCategoryButton.widthAnchor.constraint(equalToConstant: 110),
            deleteCategoryButton.heightAnchor.constraint(equalToConstant: 22),
        ])
    }
    
    func setDishConstraints() {
        NSLayoutConstraint.activate([
            dishLabel.topAnchor.constraint(equalTo: deleteCategoryButton.bottomAnchor, constant: 13.4),
            dishLabel.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor),
            
            dishNameTextfield.topAnchor.constraint(equalTo: dishLabel.bottomAnchor, constant: 10),
            dishNameTextfield.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor),
            dishNameTextfield.widthAnchor.constraint(equalToConstant: 286),
            dishNameTextfield.heightAnchor.constraint(equalToConstant: 41),
            
            dishIngredientsLabel.topAnchor.constraint(equalTo: dishNameTextfield.bottomAnchor, constant: 15),
            dishIngredientsLabel.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor),
            
            ingredientTableView.topAnchor.constraint(equalTo: dishIngredientsLabel.bottomAnchor, constant: 10),
            ingredientTableView.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor),
            ingredientTableView.widthAnchor.constraint(equalToConstant: 286),
            ingredientTableView.bottomAnchor.constraint(equalTo: addIngridientButton.topAnchor, constant: -15),
            
            addIngridientButton.bottomAnchor.constraint(equalTo: imageLogo.topAnchor, constant: -15),
            addIngridientButton.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor),
            addIngridientButton.widthAnchor.constraint(equalToConstant: 286),
            addIngridientButton.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    func setImageConstraints() {
        NSLayoutConstraint.activate([
            imageLogo.bottomAnchor.constraint(equalTo: propertiesStack.topAnchor, constant: -15),
            imageLogo.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor),
            imageLogo.widthAnchor.constraint(equalToConstant: 50),
            imageLogo.heightAnchor.constraint(equalToConstant: 50),
            
            addImageButton.centerYAnchor.constraint(equalTo: imageLogo.centerYAnchor),
            addImageButton.leadingAnchor.constraint(equalTo: imageLogo.trailingAnchor, constant: 18),
            addImageButton.widthAnchor.constraint(equalToConstant: 98),
            addImageButton.heightAnchor.constraint(equalToConstant: 22),
        ])
    }
    
    func setPropertiesConstraints() {
        NSLayoutConstraint.activate([
            addDishButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            addDishButton.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor),
            addDishButton.heightAnchor.constraint(equalToConstant: 41),
            addDishButton.widthAnchor.constraint(equalToConstant: 286),
            
            propertiesStack.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor),
            propertiesStack.widthAnchor.constraint(equalToConstant: 286),
            propertiesStack.heightAnchor.constraint(equalToConstant: 165),
            propertiesStack.bottomAnchor.constraint(equalTo: addDishButton.topAnchor, constant: -15),
        ])
    }
    
}
