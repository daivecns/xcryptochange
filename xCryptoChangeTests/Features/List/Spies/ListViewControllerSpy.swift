import Foundation
@testable import xCryptoChange

final class ListViewControllerSpy: ListViewDisplaying {
    
    // MARK: - Execution Counters
    private(set) var displayStateCount = 0
    
    // MARK: - Execution Received Data
    private(set) var stateReceived: ListViewDisplayState?
    
    // MARK: - Spy Methods
    func display(state: ListViewDisplayState) {
        displayStateCount += 1
        stateReceived = state
    }
}
