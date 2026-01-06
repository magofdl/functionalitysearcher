import XCTest
@testable import FunctionalitySearcher

final class AppContextTests: XCTestCase {
    
    func testAppContextInitialization() {
        let userId = "USER-12345"
        let timestamp = Date()
        let region = "US"
        let contractCount = 5
        let userEmail = "test@example.com"
        let userRole = "admin"
        
        let context = AppContext(
            userId: userId,
            timestamp: timestamp,
            region: region,
            contractCount: contractCount,
            userEmail: userEmail,
            userRole: userRole
        )
        
        XCTAssertEqual(context.userId, userId)
        XCTAssertEqual(context.timestamp, timestamp)
        XCTAssertEqual(context.region, region)
        XCTAssertEqual(context.contractCount, contractCount)
        XCTAssertEqual(context.userEmail, userEmail)
        XCTAssertEqual(context.userRole, userRole)
    }
    
    func testAppContextWithNilOptionalValues() {
        let context = AppContext(
            userId: "USER-12345",
            timestamp: Date(),
            region: "US",
            contractCount: 5,
            userEmail: nil,
            userRole: nil
        )
        
        XCTAssertNil(context.userEmail)
        XCTAssertNil(context.userRole)
    }
    
    func testAppContextCurrent() {
        let context1 = AppContext.current
        let context2 = AppContext.current
        
        XCTAssertFalse(context1.userId.isEmpty)
        XCTAssertTrue(context1.userId.starts(with: "USER-"))
        XCTAssertNotNil(context1.timestamp)
        XCTAssertFalse(context1.region.isEmpty)
        XCTAssertGreaterThanOrEqual(context1.contractCount, 1)
        XCTAssertLessThanOrEqual(context1.contractCount, 10)
        
        XCTAssertNotEqual(context1.userId, context2.userId, "Each call should generate a unique userId")
    }
    
    func testAppContextCurrentTimestampIsRecent() {
        let context = AppContext.current
        let now = Date()
        let timeDifference = abs(context.timestamp.timeIntervalSince(now))
        
        XCTAssertLessThan(timeDifference, 1.0, "Timestamp should be very recent")
    }
}
