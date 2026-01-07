import UIKit
import SwiftUI

typealias ViewControllerCreator = (Functionality, AppContext, @escaping () -> Void) -> UIViewController
typealias ViewControllerCreatorWithData = (Functionality, AppContext, [String: FunctionalityArgumentValue], @escaping () -> Void) -> UIViewController

class ConcreteFunctionalityFactory: FunctionalityFactoryProtocol {
    private let dataResolvers: [String: FunctionalityDataResolver]
    
    init(dataResolvers: [String: FunctionalityDataResolver] = [:]) {
        self.dataResolvers = dataResolvers
    }
    
    private static var creators: [String: ViewControllerCreator] = {
        var registry: [String: ViewControllerCreator] = [:]
        
        registry["BILL_001"] = { functionality, context, onDismiss in
            DownloadInvoiceViewControllerComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["RET_001"] = { functionality, context, onDismiss in
            InitiateReturnViewControllerComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["CERT_001"] = { functionality, context, onDismiss in
            GetCertificateViewControllerComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["PROF_001"] = { functionality, context, onDismiss in
            EditProfileViewControllerComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["PROD_001"] = { functionality, context, onDismiss in
            SearchProductsViewControllerComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["ORD_001"] = { functionality, context, onDismiss in
            ViewOrdersViewControllerComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["BILL_003"] = { functionality, context, onDismiss in
            MonthlyBillingViewControllerComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["RET_003"] = { functionality, context, onDismiss in
            ReturnStatusViewControllerComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["CERT_003"] = { functionality, context, onDismiss in
            DownloadCertificateViewControllerComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["PROF_003"] = { functionality, context, onDismiss in
            ViewPersonalInfoViewControllerComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        
        registry["BILL_002"] = { functionality, context, onDismiss in
            InvoiceHistoryViewComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["RET_002"] = { functionality, context, onDismiss in
            TrackReturnViewComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["CERT_002"] = { functionality, context, onDismiss in
            RenewCertificateViewComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["PROF_002"] = { functionality, context, onDismiss in
            ChangePasswordViewComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["PROD_002"] = { functionality, context, onDismiss in
            ProductDetailsViewComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["ORD_002"] = { functionality, context, onDismiss in
            TrackShipmentViewComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["BILL_004"] = { functionality, context, onDismiss in
            ExportInvoicesViewComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["RET_004"] = { functionality, context, onDismiss in
            ReturnHistoryViewComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["CERT_004"] = { functionality, context, onDismiss in
            ActiveCertificatesViewComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        registry["PROF_004"] = { functionality, context, onDismiss in
            NotificationSettingsViewComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        
        return registry
    }()
    
    private static var creatorsWithData: [String: ViewControllerCreatorWithData] = {
        var registry: [String: ViewControllerCreatorWithData] = [:]
        
        // UserSubscriptionView with external data
        registry["PROF_011"] = { functionality, context, additionalData, onDismiss in
            // The functionality already has merged arguments from the resolver
            UserSubscriptionViewComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        
        // UserAccountDetailsViewController with external data (using a new code to differentiate)
        registry["PROF_010"] = { functionality, context, additionalData, onDismiss in
            // The functionality already has merged arguments from the resolver
            UserAccountDetailsViewControllerComposerUI.make(functionality: functionality, context: context, onDismiss: onDismiss)
        }
        
        return registry
    }()
    
    func createViewController(for functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        // Check if there's a resolver for this functionality
        if let resolver = dataResolvers[functionality.code] {
            let additionalData = resolver.resolveData(for: functionality, context: context)
            
            // Merge additional data with functionality arguments
            var mergedArguments = functionality.arguments
            for (key, value) in additionalData {
                mergedArguments[key] = value
            }
            
            // Create functionality with merged arguments
            let functionalityWithData = Functionality(
                id: functionality.id,
                code: functionality.code,
                name: functionality.name,
                path: functionality.path,
                category: functionality.category,
                description: functionality.description,
                keywords: functionality.keywords,
                uiType: functionality.uiType,
                arguments: mergedArguments
            )
            
            // Check if there's a creator that accepts additional data
            if let creatorWithData = Self.creatorsWithData[functionality.code] {
                return creatorWithData(functionalityWithData, context, additionalData, onDismiss)
            }
            
            // If no creator with data, try standard creator with updated functionality
            if let creator = Self.creators[functionality.code] {
                return creator(functionalityWithData, context, onDismiss)
            }
            
            // Fallback to default view controller with merged data
            return createDefaultViewController(for: functionalityWithData, context: context, onDismiss: onDismiss)
        }
        
        // Use standard creator if available (no resolver needed)
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
                .environmentObject(ThemeManager.shared)
            return UIHostingController(rootView: swiftUIView)
        }
    }
}
