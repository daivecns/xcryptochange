import XCTest
@testable import xCryptoChange

final class DetailsViewInteractorTests: XCTestCase {
    
    // MARK: - Load Tests
    func testLoad_WithViewModel_ShouldDisplayData() {
        // Given
        let (sut, presenter) = makeSUT()
        let exchange = ExchangeViewModel.fixture()
        
        // When
        sut.load(exchange: exchange)
        
        // Then
        XCTAssertEqual(presenter.presenterDetailsCount, 1)
        XCTAssertEqual(presenter.exchangeReceived, exchange)
    }
}

// MARK: - SUT
private extension DetailsViewInteractorTests {
    func makeSUT() -> (DetailsViewInteractor, DetailsViewPresenterSpy) {
        let presenter = DetailsViewPresenterSpy()
        return (DetailsViewInteractor(presenter: presenter), presenter)
    }
}

