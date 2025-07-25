
import UIKit

final class LoginBackground: UIView {
  
  private lazy var whiteBackgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var backroundImageView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "back")
    view.contentMode = .scaleAspectFill
    view.clipsToBounds = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupHierarchy()
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  private func setupHierarchy() {
    addSubview(whiteBackgroundView)
    whiteBackgroundView.addSubview(backroundImageView)
  }
  
  private func setupLayout() {
    NSLayoutConstraint.activate([
      whiteBackgroundView.topAnchor.constraint(equalTo: topAnchor),
      whiteBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
      whiteBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
      whiteBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      backroundImageView.topAnchor.constraint(equalTo: whiteBackgroundView.topAnchor),
      backroundImageView.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor),
      backroundImageView.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor),
      backroundImageView.heightAnchor.constraint(equalToConstant: 560)
    ])
  }
}
