import XCTest
@testable import xCryptoChange

final class ExchangeFactoryTests: XCTestCase {
    
    // MARK: - Make Tests
    func testMake_WithServiceParameter_ShouldInstantiateListViewController() {
        // Given
        let sut: UIViewController
        
        // When
        sut = makeSUT(ExchangeService())
        
        // Then
        XCTAssertTrue(sut.isKind(of: ListViewController.self))
    }
    
    func testMake_WithExchangeParameter_ShouldInstantiateDetailsViewController() {
        // Given
        let sut: UIViewController
        
        // When
        sut = makeSUT(ExchangeViewModel.fixture())
        
        // Then
        XCTAssertTrue(sut.isKind(of: DetailsViewController.self))
    }
}

// MARK: - SUT
private extension ExchangeFactoryTests {
    func makeSUT(_ service: ExchangeServicing) -> UIViewController {
        ExchangeFactory.make(with: service)
    }
    
    func makeSUT(_ exchange: ExchangeViewModel) -> UIViewController {
        ExchangeFactory.make(with: exchange)
    }
}
