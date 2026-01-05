import UIKit
import SwiftUI

typealias ViewControllerCreator = (Functionality, AppContext, @escaping () -> Void) -> UIViewController

class ConcreteFunctionalityFactory: FunctionalityFactoryProtocol {
    private static var creators: [String: ViewControllerCreator] = {
        var registry: [String: ViewControllerCreator] = [:]
        
        registry["BILL_001"] = { functionality, context, onDismiss in
            UIKitFunctionality1(functionality: functionality, userId: context.userId, onDismiss: onDismiss)
        }
        registry["RET_001"] = { functionality, context, onDismiss in
            UIKitFunctionality2(functionality: functionality, userId: context.userId, timestamp: context.timestamp, onDismiss: onDismiss)
        }
        registry["CERT_001"] = { functionality, context, onDismiss in
            UIKitFunctionality3(functionality: functionality, userId: context.userId, region: context.region, onDismiss: onDismiss)
        }
        registry["PROF_001"] = { functionality, context, onDismiss in
            UIKitFunctionality4(functionality: functionality, userId: context.userId, userEmail: context.userEmail, onDismiss: onDismiss)
        }
        registry["PROD_001"] = { functionality, context, onDismiss in
            UIKitFunctionality5(functionality: functionality, userId: context.userId, contractCount: context.contractCount, onDismiss: onDismiss)
        }
        registry["ORD_001"] = { functionality, context, onDismiss in
            UIKitFunctionality6(functionality: functionality, userId: context.userId, timestamp: context.timestamp, onDismiss: onDismiss)
        }
        registry["BILL_003"] = { functionality, context, onDismiss in
            UIKitFunctionality7(functionality: functionality, userId: context.userId, region: context.region, onDismiss: onDismiss)
        }
        registry["RET_003"] = { functionality, context, onDismiss in
            UIKitFunctionality8(functionality: functionality, userId: context.userId, onDismiss: onDismiss)
        }
        registry["CERT_003"] = { functionality, context, onDismiss in
            UIKitFunctionality9(functionality: functionality, userId: context.userId, contractCount: context.contractCount, onDismiss: onDismiss)
        }
        registry["PROF_003"] = { functionality, context, onDismiss in
            UIKitFunctionality10(functionality: functionality, userId: context.userId, userRole: context.userRole, onDismiss: onDismiss)
        }
        
        registry["BILL_002"] = { functionality, context, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality1(functionality: functionality, userId: context.userId, onDismiss: onDismiss))
        }
        registry["RET_002"] = { functionality, context, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality2(functionality: functionality, userId: context.userId, timestamp: context.timestamp, onDismiss: onDismiss))
        }
        registry["CERT_002"] = { functionality, context, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality3(functionality: functionality, userId: context.userId, region: context.region, onDismiss: onDismiss))
        }
        registry["PROF_002"] = { functionality, context, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality4(functionality: functionality, userId: context.userId, userEmail: context.userEmail, onDismiss: onDismiss))
        }
        registry["PROD_002"] = { functionality, context, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality5(functionality: functionality, userId: context.userId, contractCount: context.contractCount, onDismiss: onDismiss))
        }
        registry["ORD_002"] = { functionality, context, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality6(functionality: functionality, userId: context.userId, timestamp: context.timestamp, onDismiss: onDismiss))
        }
        registry["BILL_004"] = { functionality, context, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality7(functionality: functionality, userId: context.userId, region: context.region, onDismiss: onDismiss))
        }
        registry["RET_004"] = { functionality, context, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality8(functionality: functionality, userId: context.userId, onDismiss: onDismiss))
        }
        registry["CERT_004"] = { functionality, context, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality9(functionality: functionality, userId: context.userId, contractCount: context.contractCount, onDismiss: onDismiss))
        }
        registry["PROF_004"] = { functionality, context, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality10(functionality: functionality, userId: context.userId, userRole: context.userRole, onDismiss: onDismiss))
        }
        
        return registry
    }()
    
    func createViewController(for functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        if let creator = Self.creators[functionality.code] {
            return creator(functionality, context, onDismiss)
        }
        
        return createDefaultViewController(for: functionality, context: context, onDismiss: onDismiss)
    }
    
    private func createDefaultViewController(for functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        switch functionality.uiType {
        case .uikit:
            return UIKitFunctionalityTemplate(functionality: functionality, onDismiss: onDismiss)
        case .swiftui:
            let swiftUIView = SwiftUIFunctionalityTemplate(functionality: functionality, onDismiss: onDismiss)
            return UIHostingController(rootView: swiftUIView)
        }
    }
}
