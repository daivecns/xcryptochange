import XCTest

final class xCryptoChangeUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testSuccessfulLoadingData() throws {
        let app = XCUIApplication()
        app.launch()
        
        let title = app.staticTexts["xCryptoChange"]
        XCTAssertTrue(title.exists)
        
        let tableViewQueries = app.tables["exchangesList"]
        XCTAssertTrue(tableViewQueries.waitForExistence(timeout: 3.0), "The exchange list must appear after loading")
        
        let cell1 = tableViewQueries.children(matching: .cell).element(boundBy: 0)
        cell1.tap()
        
        let detailsTitle = app.staticTexts["Details"]
        XCTAssertTrue(detailsTitle.exists)
        
        let exchangeIDLabel = app.staticTexts["Exchange ID:"]
        let exchangeName = app.staticTexts["Exchange Name:"]
        let exchangeSite = app.staticTexts["Website:"]
        let exchangeRank = app.staticTexts["Rank:"]
        XCTAssertTrue(exchangeIDLabel.exists)
        XCTAssertTrue(exchangeName.exists)
        XCTAssertTrue(exchangeSite.exists)
        XCTAssertTrue(exchangeRank.exists)
        
        let dataQuoteStart = app.staticTexts["Data Quote Start:"]
        let dataQuoteEnd = app.staticTexts["Data Quote End:"]
        let dataOrderbookStart = app.staticTexts["Data Orderbook Start:"]
        let dataOrderbookEnd = app.staticTexts["Data Orderbook End:"]
        let dataTradeStart = app.staticTexts["Data Trade Start:"]
        let dataTradeEnd = app.staticTexts["Data Trade End:"]
        XCTAssertTrue(dataQuoteStart.exists)
        XCTAssertTrue(dataQuoteEnd.exists)
        XCTAssertTrue(dataOrderbookStart.exists)
        XCTAssertTrue(dataOrderbookEnd.exists)
        XCTAssertTrue(dataTradeStart.exists)
        XCTAssertTrue(dataTradeEnd.exists)
        
        let hourlyVolume = app.staticTexts["Hourly Volume (USD):"]
        let dailyVolume = app.staticTexts["Daily Volume (USD):"]
        let monthlyVolume = app.staticTexts["Monthly Volume (USD):"]
        XCTAssertTrue(hourlyVolume.exists)
        XCTAssertTrue(dailyVolume.exists)
        XCTAssertTrue(monthlyVolume.exists)
        
        let dataSymbolsQty = app.staticTexts["Data Symbols Qty:"]
        XCTAssertTrue(dataSymbolsQty.exists)
        
        
        let backButtonItem = app.navigationBars["Details"].buttons["xCryptoChange"]
        backButtonItem.tap()
        
        XCTAssertTrue(tableViewQueries.waitForExistence(timeout: 3.0), "The exchange list don't appear after timeout")
    }
    
    @MainActor
    func testInvalidJSONFailure() throws {
        let app = XCUIApplication()
        app.launchEnvironment["invalid-json-failure-test"] = "YES"
        app.launch()
        
        let title = app.staticTexts["xCryptoChange"]
        XCTAssertTrue(title.exists)
        
        let apiErrorImage = app.images["apiErrorImage"]
        XCTAssertTrue(apiErrorImage.waitForExistence(timeout: 2.0))
        
        let apiErrorMessage = app.staticTexts["Ocorreu um erro ao processar os dados.\nO formato da resposta não é válido. Por favor, tente novamente mais tarde."]
        XCTAssertTrue(apiErrorMessage.waitForExistence(timeout: 2.0))
        
        let retryButton = app.buttons["Tentar novamente"]
        XCTAssertTrue(retryButton.waitForExistence(timeout: 2.0))
        
        retryButton.tap()
        
        XCTAssertTrue(app.images["apiErrorImage"].waitForExistence(timeout: 2.0))
        XCTAssertTrue(app.staticTexts["Ocorreu um erro ao processar os dados.\nO formato da resposta não é válido. Por favor, tente novamente mais tarde."].waitForExistence(timeout: 2.0))
        XCTAssertTrue(app.buttons["Tentar novamente"].waitForExistence(timeout: 2.0))
    }
    
    @MainActor
    func testInvalidRequestFailure() throws {
        let app = XCUIApplication()
        app.launchEnvironment["invalid-request-failure-test"] = "YES"
        app.launch()
        
        let title = app.staticTexts["xCryptoChange"]
        XCTAssertTrue(title.exists)
        
        let apiErrorImage = app.images["apiErrorImage"]
        XCTAssertTrue(apiErrorImage.exists)
        
        let apiErrorMessage = app.staticTexts["A solicitação não pôde ser processada.\nVerifique os dados enviados e tente novamente."]
        XCTAssertTrue(apiErrorMessage.exists)
        
        let retryButton = app.buttons["Tentar novamente"]
        XCTAssertTrue(retryButton.exists)
        
        retryButton.tap()
        
        XCTAssertTrue(app.images["apiErrorImage"].exists)
        XCTAssertTrue(app.staticTexts["A solicitação não pôde ser processada.\nVerifique os dados enviados e tente novamente."].exists)
        XCTAssertTrue(app.buttons["Tentar novamente"].exists)
    }
    
    @MainActor
    func testNotConnectedFailure() throws {
        let app = XCUIApplication()
        app.launchEnvironment["not-connected-failure-test"] = "YES"
        app.launch()
        
        let title = app.staticTexts["xCryptoChange"]
        XCTAssertTrue(title.exists)
        
        let apiErrorImage = app.images["apiErrorImage"]
        XCTAssertTrue(apiErrorImage.waitForExistence(timeout: 2.0))
        
        let apiErrorMessage = app.staticTexts["Parece que você está offline.\nVerifique sua conexão com a internet e tente novamente."]
        XCTAssertTrue(apiErrorMessage.waitForExistence(timeout: 2.0))
        
        let retryButton = app.buttons["Tentar novamente"]
        XCTAssertTrue(retryButton.waitForExistence(timeout: 2.0))
        
        retryButton.tap()
        
        XCTAssertTrue(app.images["apiErrorImage"].waitForExistence(timeout: 2.0))
        XCTAssertTrue(app.staticTexts["Parece que você está offline.\nVerifique sua conexão com a internet e tente novamente."].waitForExistence(timeout: 2.0))
        XCTAssertTrue(app.buttons["Tentar novamente"].waitForExistence(timeout: 2.0))
    }
    
    @MainActor
    func testUnknownFailure() throws {
        let app = XCUIApplication()
        app.launchEnvironment["unknown-failure-test"] = "YES"
        app.launch()
        
        let title = app.staticTexts["xCryptoChange"]
        XCTAssertTrue(title.exists)
        
        let apiErrorImage = app.images["apiErrorImage"]
        XCTAssertTrue(apiErrorImage.waitForExistence(timeout: 2.0))
        
        let apiErrorMessage = app.staticTexts["Ocorreu um erro inesperado.\nPor favor, tente novamente."]
        XCTAssertTrue(apiErrorMessage.waitForExistence(timeout: 2.0))
        
        let retryButton = app.buttons["Tentar novamente"]
        XCTAssertTrue(retryButton.waitForExistence(timeout: 2.0))
        
        retryButton.tap()
        
        XCTAssertTrue(app.images["apiErrorImage"].waitForExistence(timeout: 2.0))
        XCTAssertTrue(app.staticTexts["Ocorreu um erro inesperado.\nPor favor, tente novamente."].waitForExistence(timeout: 2.0))
        XCTAssertTrue(app.buttons["Tentar novamente"].waitForExistence(timeout: 2.0))
    }
}


