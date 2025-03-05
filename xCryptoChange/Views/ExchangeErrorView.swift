import SnapKit
import UIKit

// MARK: - Error View Delegate
protocol ExchangeErrorViewDelegate: AnyObject {
    func retry()
}

// MARK: - Exchange Error View
final class ExchangeErrorView: UIView {
    
    // MARK: - Delegate
    weak var delegate: ExchangeErrorViewDelegate?
    
    // MARK: - Private Properties
    private let apiError: ExchangeAPIError

    // MARK: - Interface Components
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.extraLarge
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var messageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.default
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    private lazy var message: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.default, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var retryButton: UIButton = {
        let button = UIButton()
        button.tintColor = .darkGray
        return button
    }()
    
    // MARK: - Initializers
    init(apiError: ExchangeAPIError, delegate: ExchangeErrorViewDelegate? = nil) {
        self.apiError = apiError
        self.delegate = delegate
        super.init(frame: .zero)
        
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Layout Helpers
private extension ExchangeErrorView {
    func buildLayout() {
        buildHierarchy()
        defineConstraints()
        configureViews()
    }
    
    func buildHierarchy() {
        messageStackView.addArrangedSubview(image)
        messageStackView.addArrangedSubview(message)
        
        mainStackView.addArrangedSubview(messageStackView)
        mainStackView.addArrangedSubview(retryButton)
    
        addSubview(mainStackView)
    }
    
    func defineConstraints() {
        mainStackView.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configureViews() {
        image.image = UIImage(systemName: apiError.image, withConfiguration: UIImage.SymbolConfiguration(textStyle: .extraLargeTitle))
        image.accessibilityIdentifier = Strings.Accessibility.ErrorView.Image.identifier
        message.text = apiError.message
        message.accessibilityIdentifier = Strings.Accessibility.ErrorView.Message.identifier
        
        retryButton.setTitle(Strings.ErrorView.RetryButton.caption, for: .normal)
        retryButton.setTitleColor(.darkGray, for: .normal)
        retryButton.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.large, weight: .semibold)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapRetryButton))
        retryButton.addGestureRecognizer(tapGesture)
    }
}

// MARK: - Objective-C Exposable Methods
private extension ExchangeErrorView {
    @objc
    func didTapRetryButton() {
        delegate?.retry()
    }
}
