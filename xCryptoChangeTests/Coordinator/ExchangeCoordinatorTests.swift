import XCTest
@testable import xCryptoChange

final class ExchangeCoordinatorTests: XCTestCase {
    
    // MARK: - OpenDetails Tests
    func testOpenDetails_WithExchangeParameters_ShouldOpenDetailsScreen() {
        // Given
        let sut = makeSUT()
        let exchange = ExchangeViewModel.fixture()
        
        // When
        sut.openDetails(of: exchange)
        
        // Then
        XCTAssertEqual(sut.openDetailsCount, 1)
        XCTAssertEqual(sut.exchangeReceived, exchange)
    }
}

// MARK: - SUT
private extension ExchangeCoordinatorTests {
    func makeSUT() -> ExchangeCoordinatorSpy {
        ExchangeCoordinatorSpy()
    }
}
