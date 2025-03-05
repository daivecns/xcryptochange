import XCTest
@testable import xCryptoChange

final class DetailsViewPresenterTests: XCTestCase {
    
    // MARK: - Presenting Details Tests
    func testPresentDetails_WithExchange_ShouldDisplayExchangeDetails() {
        // Given
        let (sut, viewController) = makeSUT()
        let exchange = ExchangeViewModel.fixture()
        
        // When
        sut.presenterDetails(of: exchange)
        
        // Then
        XCTAssertEqual(viewController.displayDetailsCount, 1)
        XCTAssertEqual(viewController.exchangeReceived, exchange)
    }
}

// MARK: - SUT
private extension DetailsViewPresenterTests {
    func makeSUT() -> (DetailsViewPresenter, DetailsViewControllerSpy) {
        let viewController = DetailsViewControllerSpy()
        let presenter = DetailsViewPresenter()
        presenter.viewController = viewController
        
        return (presenter, viewController)
    }
}

