@testable import xCryptoChange
import XCTest

final class ExchangeAPIErrorTests: XCTest {
    
    func testExchangeAPIError_WithInvalidJSONError_ShouldReturnInvalidJSONImageAndMessage() {
        // Given
        let sut: ExchangeAPIError
        
        // When
        sut = .invalidJSON
        
        // Then
        XCTAssertEqual(sut.image, Strings.Errors.InvalidJSON.image)
        XCTAssertEqual(sut.message, Strings.Errors.InvalidJSON.message)
    }
    
    func testExchangeAPIError_WithInvalidRequestError_ShouldReturnInvalidRequestImageAndMessage() {
        // Given
        let sut: ExchangeAPIError
        
        // When
        sut = .invalidRequest
        
        // Then
        XCTAssertEqual(sut.image, Strings.Errors.InvalidRequest.image)
        XCTAssertEqual(sut.message, Strings.Errors.InvalidRequest.message)
    }
    
    func testExchangeAPIError_WithNotConnectedError_ShouldReturnNotConnectedImageAndMessage() {
        // Given
        let sut: ExchangeAPIError
        
        // When
        sut = .notConnected
        
        // Then
        XCTAssertEqual(sut.image, Strings.Errors.NotConnected.image)
        XCTAssertEqual(sut.message, Strings.Errors.NotConnected.message)
    }
    
    func testExchangeAPIError_WithUnknownError_ShouldReturnUnknownImageAndMessage() {
        // Given
        let sut: ExchangeAPIError
        
        // When
        sut = .unknown
        
        // Then
        XCTAssertEqual(sut.image, Strings.Errors.Unknown.image)
        XCTAssertEqual(sut.message, Strings.Errors.Unknown.message)
    }
    
}
