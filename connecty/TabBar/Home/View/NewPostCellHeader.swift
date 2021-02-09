
import UIKit

protocol NewPostCellHeaderDelegate{
    func didTapUser()
}

class NewPostCellHeader: UICollectionViewCell{
    
    static let identifier = "NewPostCellHeaderID"
    
    var delegate: NewPostCellHeaderDelegate?
    
    let postView: UIView = {
        let vi = UIView()
        vi.backgroundColor = .white
        return vi
    }()
    
    let userName: UIButton = {
        let label = UIButton(type: .system)
        label.setTitleColor(.black, for: .normal)
        label.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        label.contentHorizontalAlignment = .left
        label.addTarget(self, action: #selector(userNameTap), for: .touchUpInside)
        return label
    }()
    
    @objc func userNameTap(){
        delegate?.didTapUser()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder){fatalError("init(coder:) has not been implemented")}
    
    func configure(){
        backgroundColor = .systemBackground
        addSubview(postView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        postView.frame = bounds
    }
}
