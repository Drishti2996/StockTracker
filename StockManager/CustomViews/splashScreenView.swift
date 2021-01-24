import UIKit

class SplashScreenView: UIView {
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUpConstraints()
    
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
    
    func setUpConstraints() {
        addSubview(logoImage)
        logoImage.image = UIImage(named: "stockImage")
        NSLayoutConstraint.activate([
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            logoImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            logoImage.topAnchor.constraint(equalTo: topAnchor),
            logoImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
}
