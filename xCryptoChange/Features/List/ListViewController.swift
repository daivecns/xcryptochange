import SnapKit
import UIKit

// MARK: - Display Protocol
protocol ListViewDisplaying: AnyObject {
    func display(state: ListViewDisplayState)
}

// MARK: - List View Display State
enum ListViewDisplayState: Equatable {
    case error(ExchangeAPIError)
    case display(ExchangeViewModel)
    case list([ExchangeViewModel])
}

// MARK: - View Controller
final class ListViewController: UIViewController {
    // MARK: - Private properties
    let interactor: ListViewInteracting
    let coordinator: ExchangeCoordinating
    var exchanges = [ExchangeViewModel]()
    var errorView: ExchangeErrorView?
    
    // MARK: - Interface Components
    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        spinner.style = .medium
        spinner.startAnimating()
        return spinner
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.isAccessibilityElement = true
        tableView.backgroundColor = .white
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.estimatedRowHeight = Sizing.rowHeight
        tableView.tableHeaderView = UIView()
        tableView.keyboardDismissMode = .onDrag
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorInset = UIEdgeInsets(top: .zero, left: Margin.default, bottom: .zero, right: Margin.default)
        tableView.separatorStyle = .singleLine
        tableView.isHidden = true
        tableView.register(ExchangeCell.self, forCellReuseIdentifier: Strings.ExchangeCell.identifier)
        return tableView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
        interactor.fetchData()
    }
    
    // MARK: Initialization
    init(coordinator: ExchangeCoordinating, interactor: ListViewInteracting) {
        self.coordinator = coordinator
        self.interactor = interactor
        
        super.init(nibName: nil, bundle: nil)
        
        self.coordinator.viewController = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Layout Helpers
private extension ListViewController {
    func buildLayout() {
        buildHierarchy()
        defineConstraints()
        configureViews()
    }
    
    func buildHierarchy() {
        view.addSubview(tableView)
        view.addSubview(spinner)
    }
    
    func defineConstraints() {
        spinner.snp.remakeConstraints {
            $0.center.equalToSuperview()
        }
        
        tableView.snp.remakeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(Margin.default)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureViews() {
        view.backgroundColor = .white
        
        navigationItem.title = Strings.Main.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.accessibilityIdentifier = Strings.Accessibility.ListView.TableView.identifier
    }
    
    func display(apiError: ExchangeAPIError) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            showErrorView(for: apiError)
        }
    }
}

// MARK: - Private Helpers
private extension ListViewController {
    func showErrorView(for apiError: ExchangeAPIError) {
        hideErrorView()
        errorView = ExchangeErrorView(apiError: apiError, delegate: self)
        
        guard let errorView else { return }
        
        view.addSubview(errorView)
        
        errorView.snp.remakeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(Margin.large)
        }
    }
    
    func hideErrorView() {
        if errorView?.superview != nil {
            errorView?.removeFromSuperview()
        }
    }
}

// MARK: - ListViewDisplaying {
extension ListViewController: ListViewDisplaying {
    func display(state: ListViewDisplayState) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            spinner.stopAnimating()
            hideErrorView()
        }
        
        switch state {
        case .display(let exchange):
            coordinator.openDetails(of: exchange)
            
        case .error(let error):
            display(apiError: error)
            
        case .list(let viewModel):
            exchanges = viewModel
            
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                tableView.reloadData()
                tableView.isHidden = false
            }
        }
    }
}

// MARK: - TableView Delegate {
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.didSelected(exchange: exchanges[indexPath.row])
    }
}

// MARK: - TableView Datasource {
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exchanges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Strings.ExchangeCell.identifier) as? ExchangeCell else {
            return UITableViewCell()
        }
        cell.configureWith(exchange: exchanges[indexPath.row])
        
        return cell
    }
}

// MARK: - ErrorView Delegate
extension ListViewController: ExchangeErrorViewDelegate {
    func retry() {
        hideErrorView()
        spinner.startAnimating()
        interactor.fetchData()
    }
}

