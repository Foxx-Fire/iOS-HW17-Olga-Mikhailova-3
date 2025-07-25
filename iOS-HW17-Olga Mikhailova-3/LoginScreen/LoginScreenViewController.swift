//
//  ViewController.swift
//  iOS-HW17-Olga Mikhailova-3
//
//  Created by FoxxFire on 24.07.2025.
//

import UIKit

class LoginScreenViewController: UIViewController {
  
  //MARK: - Properties
  
  let backgroundView = LoginBackgroundView()
  
  // MARK: - UIElements
  
  private lazy var titleLabel = createTitleLabel(text: "Login")
  
  private lazy var loginTextField = createTextField(
    placeholder: "Username",
    leftIcon: UIImage(systemName: "person") ?? UIImage()
  )
  
  private lazy var passwordTextField = createTextField(
    placeholder: "Password",
    leftIcon: UIImage(systemName: "lock") ?? UIImage(),
    rightIcon: UIImage(systemName: "checkmark.circle.fill")?
      .withTintColor(.systemGreen, renderingMode: .alwaysOriginal) ?? UIImage()
  )
  
  private lazy var loginButton = createActionButton(
    title: "Login",
    backgroundColor: .systemIndigo,
    action: UIAction { [weak self] _ in
      self?.loginButtonTapped()
    }
  )
  
  private lazy var forgotButton = createTextButton(
    title: "Forgot your password?",
    font: UIFont.systemFont(ofSize: 16, weight: .semibold),
    color: .white
  )
  
  private lazy var dividerLeftView = createDividerView()
  private lazy var dividerRightView = createDividerView()
  
  private lazy var connectLabel = createDescriptionLabel(
    text: "or connect with",
    font: UIFont.systemFont(ofSize: 14),
    color: .gray
  )
  
  private lazy var facebookButton = createSocialButton(
    title: "Facebook",
    image: UIImage(named: "facebook")?.withTintColor(.white),
    backgroundColor: .systemBlue,
    action: UIAction { [weak self] _ in
      self?.fbButtonTapped()
    }
  )
  
  private lazy var twitterButton = createSocialButton(
    title: "Twitter",
    image: UIImage(named: "twitter")?.withTintColor(.white),
    backgroundColor: .systemIndigo,
    action: UIAction { [weak self] _ in
      self?.twitterButtonTapped()
    }
  )
  
  private lazy var signUpLabel = createDescriptionLabel(
    text: "Don't have account?",
    font: UIFont.systemFont(ofSize: 14),
    color: .gray
  )
  
  private lazy var signUpButton = createTextButton(
    title: "Sign up",
    font: UIFont.systemFont(ofSize: 16, weight: .semibold),
    color: .systemIndigo
  )
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    setupHierarchy()
    setupLayout()
  }
  
  // MARK: - Setup Hierarchy
  
  private func setupHierarchy() {
    view.addSubview(backgroundView)
    backgroundView.addSubview(titleLabel)
    backgroundView.addSubview(loginTextField)
    backgroundView.addSubview(passwordTextField)
    backgroundView.addSubview(loginButton)
    backgroundView.addSubview(forgotButton)
    backgroundView.addSubview(dividerLeftView)
    backgroundView.addSubview(dividerRightView)
    backgroundView.addSubview(connectLabel)
    backgroundView.addSubview(facebookButton)
    backgroundView.addSubview(twitterButton)
    backgroundView.addSubview(signUpLabel)
    backgroundView.addSubview(signUpButton)
  }
  
  // MARK: - Setup Layout
  
  private func setupLayout() {
    // Background
    backgroundView.pinToSuperview()
    
    // Title Label
    titleLabel
      .centerXToSuperview()
      .topToSuperview(offset: 40, safeArea: true)
    
    // Text Fields
    loginTextField
      .horizontalToSuperview(inset: 40)
      .topToBottom(of: titleLabel, offset: 40)
      .height(45)
    
    passwordTextField
      .horizontalToSuperview(inset: 40)
      .topToBottom(of: loginTextField, offset: 20)
      .height(45)
    
    // Buttons
    loginButton
      .horizontalToSuperview(inset: 40)
      .topToBottom(of: passwordTextField, offset: 40)
      .height(45)
    
    forgotButton
      .centerXToSuperview()
      .topToBottom(of: loginButton, offset: 16)
    
    // Dividers
    dividerLeftView
      .leadingToSuperview(offset: 20)
      .trailingToSuperview(offset: 260)
      .topToBottom(of: forgotButton, offset: 220)
      .height(1)
    
    dividerRightView
      .leadingToSuperview(offset: 260)
      .trailingToSuperview(offset: 20)
      .topToBottom(of: forgotButton, offset: 220)
      .height(1)
    
    // Connect Label
    connectLabel
      .centerXToSuperview()
      .bottomToTop(of: dividerLeftView, offset: 7)
    
    // Social Buttons
    facebookButton
      .leadingToSuperview(offset: 25)
      .width(150)
      .topToBottom(of: connectLabel, offset: 16)
      .height(35)
    
    twitterButton
      .trailingToSuperview(offset: 25)
      .width(150)
      .topToBottom(of: connectLabel, offset: 16)
      .height(35)
    
    // Sign Up
    signUpLabel
      .leadingToSuperview(offset: 110)
      .topToBottom(of: facebookButton, offset: 30)
    
    signUpButton
      .leadingToTrailing(of: signUpLabel, offset: 6)
      .centerY(to: signUpLabel)
  }
  
  //MARK: - Functions
  
  private func createTitleLabel(text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
    label.textAlignment = .center
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }
  
  private func createTextField(
    placeholder: String,
    leftIcon: UIImage? = nil,
    rightIcon: UIImage? = nil
  ) -> UITextField {
    let textField = UITextField()
    textField.placeholder = placeholder
    textField.backgroundColor = UIColor(white: 0.95, alpha: 1)
    textField.layer.cornerRadius = 20
    textField.borderStyle = .none
    
    if let icon = leftIcon {
      textField.setLeftIcon(icon)
    }
    
    if let rightIcon = rightIcon {
      textField.setRightIcon(rightIcon)
    }
    
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }
  
  private func createActionButton(
    title: String,
    backgroundColor: UIColor,
    action: UIAction?
  ) -> UIButton {
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = backgroundColor
    button.layer.cornerRadius = 20
    button.addShadow()
    
    if let action = action {
      button.addAction(action, for: .touchUpInside)
    }
    
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }
  
  
  private func createTextButton(
    title: String,
    font: UIFont,
    color: UIColor,
    action: UIAction? = nil
  ) -> UIButton {
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    button.titleLabel?.font = font
    button.setTitleColor(color, for: .normal)
    button.backgroundColor = .none
    
    if  let action = action {
      button.addAction(action, for: .touchUpInside)
    }
    
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }
  
  private func createDividerView() -> UIView {
    let view = UIView()
    view.backgroundColor = .lightGray
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }
  
  private func createDescriptionLabel(
    text: String,
    font: UIFont,
    color: UIColor
  ) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = font
    label.textColor = color
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }
  
  private func createSocialButton(
    title: String,
    image: UIImage?,
    backgroundColor: UIColor,
    action: UIAction?
  ) -> UIButton {
    let button = UIButton(type: .custom)
    
    var config = UIButton.Configuration.filled()
    config.cornerStyle = .capsule
    config.baseForegroundColor = .white
    config.baseBackgroundColor = backgroundColor
    config.title = title
    config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
      var outgoing = incoming
      outgoing.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
      return outgoing
    }
    
    if let image = image {
//      config.image = image.resized(to: CGSize(width: 24, height: 24))
//      config.imagePadding = 8
//      config.imagePlacement = .leading
      let targetSize = CGSize(width: 24, height: 24)
          let resizedImage = UIGraphicsImageRenderer(size: targetSize).image { _ in
              image.draw(in: CGRect(origin: .zero, size: targetSize))
          }
          config.image = resizedImage
          config.imagePadding = 8
          config.imagePlacement = .leading
    }
    
    config.contentInsets = NSDirectionalEdgeInsets(
      top: 5,
      leading: 12,
      bottom: 5,
      trailing: 20
    )
    
    button.configuration = config
    button.addShadow()
    
    if let action = action {
      button.addAction(action, for: .touchUpInside)
    }
    
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }
  
}

