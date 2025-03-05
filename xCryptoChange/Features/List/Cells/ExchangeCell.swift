import SnapKit
import UIKit

final class ExchangeCell: UITableViewCell {
    // MARK: - Interface Components
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.default
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var exchangeIDStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.mininum
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var exchangeIDLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.minimum, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var exchangeIDValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.default, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var exchangeNameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.mininum
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var exchangeNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.minimum, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var exchangeNameValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.default, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dailyVolumeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.mininum
        stackView.alignment = .trailing
        return stackView
    }()
    
    private lazy var dailyVolumeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.minimum, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dailyVolumeValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.default, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .right
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initilizer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        exchangeNameValue.text = ""
        exchangeIDValue.text = ""
        dailyVolumeValue.text = "0,00"
    }
}

// MARK: - Private Layout Helpers
private extension ExchangeCell {
    func buildLayout() {
        buildHierarchy()
        configureViews()
        defineConstraints()
    }
    
    func buildHierarchy() {
        contentView.addSubview(mainStackView)
        contentView.addSubview(dailyVolumeStackView)
        
        exchangeIDStackView.addArrangedSubview(exchangeIDLabel)
        exchangeIDStackView.addArrangedSubview(exchangeIDValue)
        
        exchangeNameStackView.addArrangedSubview(exchangeNameLabel)
        exchangeNameStackView.addArrangedSubview(exchangeNameValue)
        
        mainStackView.addArrangedSubview(exchangeIDStackView)
        mainStackView.addArrangedSubview(exchangeNameStackView)
        
        dailyVolumeStackView.addArrangedSubview(dailyVolumeLabel)
        dailyVolumeStackView.addArrangedSubview(dailyVolumeValue)
    }
    
    func defineConstraints() {
        mainStackView.snp.remakeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(Margin.default)
            $0.trailing.lessThanOrEqualToSuperview().inset(Margin.large)
        }
        
        dailyVolumeStackView.snp.remakeConstraints {
            $0.top.equalTo(mainStackView.snp.top)
            $0.trailing.equalToSuperview().inset(Margin.default)
        }
    }
    
    func configureViews() {
        exchangeIDLabel.text = Strings.ExchangeCell.ExchangeID.caption
        exchangeNameLabel.text = Strings.ExchangeCell.ExchangeName.caption
        dailyVolumeLabel.text = Strings.ExchangeCell.DailyVolume.caption
    }
}

// MARK: - Public API
extension ExchangeCell {
    func configureWith(exchange: ExchangeViewModel) {
        accessoryType = .disclosureIndicator
        isAccessibilityElement = true
        
        exchangeIDValue.text = exchange.exchangeID
        exchangeNameValue.text = exchange.name
        dailyVolumeValue.text = exchange.dailyVolumeUSD
    }
}
