import UIKit

extension UIView {
    // MARK: - Pin to superview edges
    func pinToSuperview() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
    
    // MARK: - Edge constraints
    @discardableResult
    func leadingToSuperview(offset: CGFloat = 0) -> Self {
        guard let superview = superview else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: offset).isActive = true
        return self
    }
    
    @discardableResult
    func trailingToSuperview(offset: CGFloat = 0) -> Self {
        guard let superview = superview else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -offset).isActive = true
        return self
    }
    
    @discardableResult
    func topToSuperview(offset: CGFloat = 0, safeArea: Bool = false) -> Self {
        guard let superview = superview else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        let anchor = safeArea ? superview.safeAreaLayoutGuide.topAnchor : superview.topAnchor
        topAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
        return self
    }
    
    @discardableResult
    func bottomToSuperview(offset: CGFloat = 0, safeArea: Bool = false) -> Self {
        guard let superview = superview else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        let anchor = safeArea ? superview.safeAreaLayoutGuide.bottomAnchor : superview.bottomAnchor
        bottomAnchor.constraint(equalTo: anchor, constant: -offset).isActive = true
        return self
    }
    
    // MARK: - Size constraints
    @discardableResult
    func height(_ height: CGFloat) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    func width(_ width: CGFloat) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    // MARK: - Center positioning
    @discardableResult
    func centerXToSuperview() -> Self {
        guard let superview = superview else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        return self
    }
    
    @discardableResult
    func centerY(to view: UIView) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return self
    }
    
    // MARK: - Relative positioning
    @discardableResult
    func topToBottom(of view: UIView, offset: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.bottomAnchor, constant: offset).isActive = true
        return self
    }
    
    @discardableResult
    func bottomToTop(of view: UIView, offset: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: view.topAnchor, constant: -offset).isActive = true
        return self
    }
    
    @discardableResult
    func leadingToTrailing(of view: UIView, offset: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: offset).isActive = true
        return self
    }
    
    // MARK: - Horizontal constraints
    @discardableResult
    func horizontalToSuperview(inset: CGFloat) -> Self {
        guard let superview = superview else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: inset),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -inset)
        ])
        return self
    }
}


