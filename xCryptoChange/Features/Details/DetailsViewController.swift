import UIKit

// MARK: - Displaying Protocol
protocol DetailsViewDisplaying: AnyObject {
    func displayDetails(of exchange: ExchangeViewModel)
}

// MARK: - View Controller
class DetailsViewController: UIViewController {

    // MARK: - Private properties
    let exchange: ExchangeViewModel
    let interactor: DetailsViewInteracting
    
    // MARK: - Interface Components
    private lazy var idStackView: UIStackView = {
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
    
    private lazy var exchangeSiteStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.mininum
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var exchangeSiteLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.minimum, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var exchangeSiteValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.default, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rankStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.mininum
        stackView.alignment = .trailing
        return stackView
    }()
    
    private lazy var rankLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.minimum, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rankValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.default, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataQuoteStartStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.mininum
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var dataQuoteStartLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.minimum, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataQuoteStartValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.default, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataQuoteEndStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.mininum
        stackView.alignment = .trailing
        return stackView
    }()
    
    private lazy var dataQuoteEndLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.minimum, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataQuoteEndValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.default, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataOrderbookStartStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.mininum
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var dataOrderbookStartLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.minimum, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataOrderbookStartValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.default, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataOrderbookEndStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.mininum
        stackView.alignment = .trailing
        return stackView
    }()
    
    private lazy var dataOrderbookEndLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.minimum, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataOrderbookEndValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.default, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataTradeStartStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.mininum
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var dataTradeStartLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.minimum, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataTradeStartValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.default, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataTradeEndStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.mininum
        stackView.alignment = .trailing
        return stackView
    }()
    
    private lazy var dataTradeEndLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.minimum, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataTradeEndValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.default, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var volumeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.default
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var volume1HrsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.mininum
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var volume1HrsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.minimum, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var volume1HrsValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.default, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var volume1DayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.mininum
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var volume1DayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.minimum, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var volume1DayValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.default, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var volume1MonthStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.mininum
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var volume1MonthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.minimum, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var volume1MonthValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.default, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataSymbolsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.mininum
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var dataSymbolsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.minimum, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataSymbolsValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.default, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    init(exchange: ExchangeViewModel, interactor: DetailsViewInteracting) {
        self.exchange = exchange
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
        interactor.load(exchange: exchange)
    }
}

// MARK: - Private Layout Helpers
private extension DetailsViewController {
    func buildLayout() {
        buildHierarchy()
        defineConstraints()
        configureViews()
    }
    
    func buildHierarchy() {
        exchangeIDStackView.addArrangedSubview(exchangeIDLabel)
        exchangeIDStackView.addArrangedSubview(exchangeIDValue)
        exchangeNameStackView.addArrangedSubview(exchangeNameLabel)
        exchangeNameStackView.addArrangedSubview(exchangeNameValue)
        exchangeSiteStackView.addArrangedSubview(exchangeSiteLabel)
        exchangeSiteStackView.addArrangedSubview(exchangeSiteValue)
        idStackView.addArrangedSubview(exchangeIDStackView)
        idStackView.addArrangedSubview(exchangeNameStackView)
        idStackView.addArrangedSubview(exchangeSiteStackView)
        view.addSubview(idStackView)
        
        rankStackView.addArrangedSubview(rankLabel)
        rankStackView.addArrangedSubview(rankValue)
        view.addSubview(rankStackView)
        
        dataQuoteStartStackView.addArrangedSubview(dataQuoteStartLabel)
        dataQuoteStartStackView.addArrangedSubview(dataQuoteStartValue)
        view.addSubview(dataQuoteStartStackView)
        
        dataQuoteEndStackView.addArrangedSubview(dataQuoteEndLabel)
        dataQuoteEndStackView.addArrangedSubview(dataQuoteEndValue)
        view.addSubview(dataQuoteEndStackView)
        
        dataOrderbookStartStackView.addArrangedSubview(dataOrderbookStartLabel)
        dataOrderbookStartStackView.addArrangedSubview(dataOrderbookStartValue)
        view.addSubview(dataOrderbookStartStackView)
        
        dataOrderbookEndStackView.addArrangedSubview(dataOrderbookEndLabel)
        dataOrderbookEndStackView.addArrangedSubview(dataOrderbookEndValue)
        view.addSubview(dataOrderbookEndStackView)
        
        dataTradeStartStackView.addArrangedSubview(dataTradeStartLabel)
        dataTradeStartStackView.addArrangedSubview(dataTradeStartValue)
        view.addSubview(dataTradeStartStackView)
        
        dataTradeEndStackView.addArrangedSubview(dataTradeEndLabel)
        dataTradeEndStackView.addArrangedSubview(dataTradeEndValue)
        view.addSubview(dataTradeEndStackView)
        
        volume1HrsStackView.addArrangedSubview(volume1HrsLabel)
        volume1HrsStackView.addArrangedSubview(volume1HrsValue)
        volume1DayStackView.addArrangedSubview(volume1DayLabel)
        volume1DayStackView.addArrangedSubview(volume1DayValue)
        volume1MonthStackView.addArrangedSubview(volume1MonthLabel)
        volume1MonthStackView.addArrangedSubview(volume1MonthValue)
        volumeStackView.addArrangedSubview(volume1HrsStackView)
        volumeStackView.addArrangedSubview(volume1DayStackView)
        volumeStackView.addArrangedSubview(volume1MonthStackView)
        view.addSubview(volumeStackView)
        
        dataSymbolsStackView.addArrangedSubview(dataSymbolsLabel)
        dataSymbolsStackView.addArrangedSubview(dataSymbolsValue)
        view.addSubview(dataSymbolsStackView)
    }
    
    func defineConstraints() {
        idStackView.snp.remakeConstraints {
            $0.leading.equalToSuperview().inset(Margin.largest)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(Margin.default)
        }
        
        rankStackView.snp.remakeConstraints {
            $0.trailing.equalToSuperview().inset(Margin.largest)
            $0.top.equalTo(idStackView.snp.top)
        }
        
        dataQuoteStartStackView.snp.remakeConstraints {
            $0.leading.equalToSuperview().inset(Margin.largest)
            $0.top.equalTo(idStackView.snp.bottom).offset(Spacing.extraLarge)
        }
        
        dataQuoteEndStackView.snp.remakeConstraints {
            $0.trailing.equalToSuperview().inset(Margin.largest)
            $0.top.equalTo(dataQuoteStartStackView.snp.top)
        }
        
        dataOrderbookStartStackView.snp.remakeConstraints {
            $0.leading.equalToSuperview().inset(Margin.largest)
            $0.top.equalTo(dataQuoteStartStackView.snp.bottom).offset(Spacing.large)
        }
        
        dataOrderbookEndStackView.snp.remakeConstraints {
            $0.trailing.equalToSuperview().inset(Margin.largest)
            $0.top.equalTo(dataOrderbookStartStackView.snp.top)
        }
        
        dataTradeStartStackView.snp.remakeConstraints {
            $0.leading.equalToSuperview().inset(Margin.largest)
            $0.top.equalTo(dataOrderbookStartStackView.snp.bottom).offset(Spacing.large)
        }
        
        dataTradeEndStackView.snp.remakeConstraints {
            $0.trailing.equalToSuperview().inset(Margin.largest)
            $0.top.equalTo(dataTradeStartStackView.snp.top)
        }
        
        volumeStackView.snp.remakeConstraints {
            $0.leading.equalToSuperview().inset(Margin.largest)
            $0.top.equalTo(dataTradeStartStackView.snp.bottom).offset(Spacing.extraLarge)
        }
        
        dataSymbolsStackView.snp.remakeConstraints {
            $0.leading.equalToSuperview().inset(Margin.largest)
            $0.top.equalTo(volumeStackView.snp.bottom).offset(Spacing.extraLarge)
        }
    }
    
    func configureViews() {
        view.backgroundColor = .white
        
        navigationItem.title = Strings.Details.title
        navigationController?.navigationBar.tintColor = .black
        
        exchangeIDLabel.text         = Strings.Details.ExchangeID.caption
        exchangeNameLabel.text       = Strings.Details.ExchangeName.caption
        exchangeSiteLabel.text       = Strings.Details.ExchangeSite.caption
        rankLabel.text               = Strings.Details.Rank.caption
        
        dataQuoteStartLabel.text     = Strings.Details.DataQuoteStart.caption
        dataQuoteEndLabel.text       = Strings.Details.DataQuoteEnd.caption
        dataOrderbookStartLabel.text = Strings.Details.DataOrderbookStart.caption
        dataOrderbookEndLabel.text   = Strings.Details.DataOrderbookEnd.caption
        dataTradeStartLabel.text     = Strings.Details.DataTradeStart.caption
        dataTradeEndLabel.text       = Strings.Details.DataTradeEnd.caption
        
        volume1HrsLabel.text         = Strings.Details.HourlyVolume.caption
        volume1DayLabel.text         = Strings.Details.DailyVolume.caption
        volume1MonthLabel.text       = Strings.Details.MonthlyVolume.caption
        
        dataSymbolsLabel.text        = Strings.Details.DataSymbolsCount.caption
    }
}

// MARK: - DetailsViewDisplaying {
extension DetailsViewController: DetailsViewDisplaying {
    func displayDetails(of exchange: ExchangeViewModel) {
        exchangeIDValue.text         = exchange.exchangeID
        exchangeNameValue.text       = exchange.name
        exchangeSiteValue.text       = exchange.site
        rankValue.text               = exchange.rank
        
        dataQuoteStartValue.text     = exchange.dataQuoteStart
        dataQuoteEndValue.text       = exchange.dataQuoteEnd
        dataOrderbookStartValue.text = exchange.orderBookDataStart
        dataOrderbookEndValue.text   = exchange.orderBookDataEnd
        dataTradeStartValue.text     = exchange.dataTradeStart
        dataTradeEndValue.text       = exchange.dataTradeEnd
        
        volume1HrsValue.text         = exchange.hourlyVolumeUSD
        volume1DayValue.text         = exchange.dailyVolumeUSD
        volume1MonthValue.text       = exchange.monthlyVolumeUSD
        
        dataSymbolsValue.text        = exchange.dataSymbolsQty
    }
}
