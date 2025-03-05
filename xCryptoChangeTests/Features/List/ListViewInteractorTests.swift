import XCTest
@testable import xCryptoChange

final class ListViewInteractorTests: XCTestCase {
    
    // MARK: - Fetch Data Tests
    func testFetchData_WithSuccess_ShouldFetchAllExchanges() {
        // Given
        let (sut, presenter, service) = makeSUT()
        let exchangesDTO = ExchangeViewModelMockFactory.make()
        service.fetchAllExchangesResult = .success(exchangesDTO)
        
        // When
        sut.fetchData()
        
        // Then
        XCTAssertEqual(service.fetchAllExchangesCount, 1)
        XCTAssertEqual(presenter.presentExchangesDTOCount, 1)
        XCTAssertEqual(presenter.exchangesDTOReceived, exchangesDTO)
    }
    
    func testFetchData_WithInvalidJSONFailure_ShouldNotFetchAndDisplayInvalidJSONFailure() {
        // Given
        let (sut, presenter, service) = makeSUT()
        service.fetchAllExchangesResult = .failure(.invalidJSON)
        
        // When
        sut.fetchData()
        
        // Then
        XCTAssertEqual(service.fetchAllExchangesCount, 1)
        XCTAssertEqual(presenter.presentExchangesDTOCount, 0)
        XCTAssertEqual(presenter.presentErrorCount, 1)
        XCTAssertEqual(presenter.errorReceived, .invalidJSON)
    }
    
    func testFetchData_WithInvalidRequestFailure_ShouldNotFetchAndDisplayInvalidRequestFailure() {
        // Given
        let (sut, presenter, service) = makeSUT()
        service.fetchAllExchangesResult = .failure(.invalidRequest)
        
        // When
        sut.fetchData()
        
        // Then
        XCTAssertEqual(service.fetchAllExchangesCount, 1)
        XCTAssertEqual(presenter.presentExchangesDTOCount, 0)
        XCTAssertEqual(presenter.presentErrorCount, 1)
        XCTAssertEqual(presenter.errorReceived, .invalidRequest)
    }
    
    func testFetchData_WithNotConnectedFailure_ShouldNotFetchAndDisplayNotConnectedFailure() {
        // Given
        let (sut, presenter, service) = makeSUT()
        service.fetchAllExchangesResult = .failure(.notConnected)
        
        // When
        sut.fetchData()
        
        // Then
        XCTAssertEqual(service.fetchAllExchangesCount, 1)
        XCTAssertEqual(presenter.presentExchangesDTOCount, 0)
        XCTAssertEqual(presenter.presentErrorCount, 1)
        XCTAssertEqual(presenter.errorReceived, .notConnected)
    }
    
    func testFetchData_WithUnknownFailure_ShouldNotFetchAndDisplayUnknwonFailure() {
        // Given
        let (sut, presenter, service) = makeSUT()
        service.fetchAllExchangesResult = .failure(.unknown)
        
        // When
        sut.fetchData()
        
        // Then
        XCTAssertEqual(service.fetchAllExchangesCount, 1)
        XCTAssertEqual(presenter.presentExchangesDTOCount, 0)
        XCTAssertEqual(presenter.presentErrorCount, 1)
        XCTAssertEqual(presenter.errorReceived, .unknown)
    }
    
    // MARK: - DidSelect Tests
    func testDidSelect() {
        // Given
        let (sut, presenter, _) = makeSUT()
        let exchange = ExchangeViewModel.fixture()
        
        // When
        sut.didSelected(exchange: exchange)
        
        // Then
        XCTAssertEqual(presenter.presentExchangeCount, 1)
        XCTAssertEqual(presenter.exchangeReceived, exchange)
    }
}

// MARK: - SUT
private extension ListViewInteractorTests {
    func makeSUT() -> (ListViewInteractor, ListViewPresenterSpy, ExchangeServiceSpy) {
        let presenter = ListViewPresenterSpy()
        let service = ExchangeServiceSpy()
        return (ListViewInteractor(presenter: presenter, service: service), presenter, service)
    }
}

