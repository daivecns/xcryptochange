import XCTest
@testable import xCryptoChange

final class ListViewPresenterTests: XCTestCase {
    
    // MARK: - Present Exchanges DTO Tests
    func testPresentExchangesDTO_WithDTO_ShouldDisplayExchangesList() {
        // Given
        let (sut, viewController) = makeSUT()
        let exchange = ExchangeViewModel.fixture()
        
        // When
        sut.present(exchangesDTO: ExchangeDTO.fixture())
        
        // Then
        guard case .list(let exchanges) = viewController.stateReceived else {
            XCTFail()
            return
        }
        XCTAssertEqual(viewController.displayStateCount, 1)
        XCTAssertEqual(exchanges[.zero], exchange)
    }
    
    func testPresentExchange_WithExchange_ShouldDisplayExchangeDetails() {
        // Given
        let (sut, viewController) = makeSUT()
        let exchange = ExchangeViewModel.fixture()
        
        // When
        sut.present(exchange: exchange)
        
        // Then
        XCTAssertEqual(viewController.displayStateCount, 1)
        XCTAssertEqual(viewController.stateReceived, .display(exchange))
    }
    
    func testPresentError_WithInvalidJSONFailure_ShouldDisplayInvalidJSONFailure() {
        // Given
        let (sut, viewController) = makeSUT()
        
        // When
        sut.present(error: .invalidJSON)
        
        // Then
        XCTAssertEqual(viewController.displayStateCount, 1)
        XCTAssertEqual(viewController.stateReceived, .error(.invalidJSON))
    }
    
    func testPresentError_WithInvalidRequestFailure_ShouldDisplayInvalidRequestFailure() {
        // Given
        let (sut, viewController) = makeSUT()
        
        // When
        sut.present(error: .invalidRequest)
        
        // Then
        XCTAssertEqual(viewController.displayStateCount, 1)
        XCTAssertEqual(viewController.stateReceived, .error(.invalidRequest))
    }
    
    func testPresentError_WithNotConnectedFailure_ShouldDisplayNotConnectedFailure() {
        // Given
        let (sut, viewController) = makeSUT()
        
        // When
        sut.present(error: .notConnected)
        
        // Then
        XCTAssertEqual(viewController.displayStateCount, 1)
        XCTAssertEqual(viewController.stateReceived, .error(.notConnected))
    }
    
    func testPresentError_WithUnknwonFailure_ShouldDisplayUnknwonFailure() {
        // Given
        let (sut, viewController) = makeSUT()
        
        // When
        sut.present(error: .unknown)
        
        // Then
        XCTAssertEqual(viewController.displayStateCount, 1)
        XCTAssertEqual(viewController.stateReceived, .error(.unknown))
    }
}

// MARK: - SUT
private extension ListViewPresenterTests {
    func makeSUT() -> (ListViewPresenter, ListViewControllerSpy) {
        let viewController = ListViewControllerSpy()
        let presenter = ListViewPresenter()
        presenter.viewController = viewController
        
        return (presenter, viewController)
    }
}
