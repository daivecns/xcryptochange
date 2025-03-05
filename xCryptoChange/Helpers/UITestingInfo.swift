import Foundation

// MARK: - UI Testing Helper
enum UITestingInfo {
    static var isTestingInvalidJSONState: Bool {
        ProcessInfo.processInfo.environment["invalid-json-failure-test"] == "YES"
    }
    
    static var isTestingInvalidRequestState: Bool {
        ProcessInfo.processInfo.environment["invalid-request-failure-test"] == "YES"
    }
    
    static var isTestingNotConnectedState: Bool {
        ProcessInfo.processInfo.environment["not-connected-failure-test"] == "YES"
    }
    
    static var isTestingUnknownFailureState: Bool {
        ProcessInfo.processInfo.environment["unknown-failure-test"] == "YES"
    }
    
    static var isTestingNetworkStates: Bool {
        isTestingInvalidJSONState || isTestingInvalidRequestState ||
        isTestingNotConnectedState || isTestingUnknownFailureState
    }
}
