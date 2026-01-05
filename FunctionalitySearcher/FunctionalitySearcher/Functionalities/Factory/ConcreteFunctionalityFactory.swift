//
//  ConcreteFunctionalityFactory.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import UIKit
import SwiftUI

typealias ViewControllerCreator = (Functionality, @escaping () -> Void) -> UIViewController

class ConcreteFunctionalityFactory: FunctionalityFactoryProtocol {
    // Registry pattern: Map functionality codes to their creators
    private static var creators: [String: ViewControllerCreator] = {
        var registry: [String: ViewControllerCreator] = [:]
        
        // Register UIKit unique screens
        registry["BILL_001"] = { functionality, onDismiss in
            UIKitFunctionality1(functionality: functionality, onDismiss: onDismiss)
        }
        registry["RET_001"] = { functionality, onDismiss in
            UIKitFunctionality2(functionality: functionality, onDismiss: onDismiss)
        }
        registry["CERT_001"] = { functionality, onDismiss in
            UIKitFunctionality3(functionality: functionality, onDismiss: onDismiss)
        }
        registry["PROF_001"] = { functionality, onDismiss in
            UIKitFunctionality4(functionality: functionality, onDismiss: onDismiss)
        }
        registry["PROD_001"] = { functionality, onDismiss in
            UIKitFunctionality5(functionality: functionality, onDismiss: onDismiss)
        }
        registry["ORD_001"] = { functionality, onDismiss in
            UIKitFunctionality6(functionality: functionality, onDismiss: onDismiss)
        }
        registry["BILL_003"] = { functionality, onDismiss in
            UIKitFunctionality7(functionality: functionality, onDismiss: onDismiss)
        }
        registry["RET_003"] = { functionality, onDismiss in
            UIKitFunctionality8(functionality: functionality, onDismiss: onDismiss)
        }
        registry["CERT_003"] = { functionality, onDismiss in
            UIKitFunctionality9(functionality: functionality, onDismiss: onDismiss)
        }
        registry["PROF_003"] = { functionality, onDismiss in
            UIKitFunctionality10(functionality: functionality, onDismiss: onDismiss)
        }
        
        // Register SwiftUI unique screens
        registry["BILL_002"] = { functionality, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality1(functionality: functionality, onDismiss: onDismiss))
        }
        registry["RET_002"] = { functionality, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality2(functionality: functionality, onDismiss: onDismiss))
        }
        registry["CERT_002"] = { functionality, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality3(functionality: functionality, onDismiss: onDismiss))
        }
        registry["PROF_002"] = { functionality, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality4(functionality: functionality, onDismiss: onDismiss))
        }
        registry["PROD_002"] = { functionality, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality5(functionality: functionality, onDismiss: onDismiss))
        }
        registry["ORD_002"] = { functionality, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality6(functionality: functionality, onDismiss: onDismiss))
        }
        registry["BILL_004"] = { functionality, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality7(functionality: functionality, onDismiss: onDismiss))
        }
        registry["RET_004"] = { functionality, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality8(functionality: functionality, onDismiss: onDismiss))
        }
        registry["CERT_004"] = { functionality, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality9(functionality: functionality, onDismiss: onDismiss))
        }
        registry["PROF_004"] = { functionality, onDismiss in
            UIHostingController(rootView: SwiftUIFunctionality10(functionality: functionality, onDismiss: onDismiss))
        }
        
        return registry
    }()
    
    func createViewController(for functionality: Functionality, onDismiss: @escaping () -> Void) -> UIViewController {
        // Look up creator in registry
        if let creator = Self.creators[functionality.code] {
            return creator(functionality, onDismiss)
        }
        
        // Default: use template based on uiType
        return createDefaultViewController(for: functionality, onDismiss: onDismiss)
    }
    
    private func createDefaultViewController(for functionality: Functionality, onDismiss: @escaping () -> Void) -> UIViewController {
        switch functionality.uiType {
        case .uikit:
            return UIKitFunctionalityTemplate(functionality: functionality, onDismiss: onDismiss)
        case .swiftui:
            let swiftUIView = SwiftUIFunctionalityTemplate(functionality: functionality, onDismiss: onDismiss)
            return UIHostingController(rootView: swiftUIView)
        }
    }
}
