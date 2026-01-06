# FunctionalitySearcher

A conceptual iOS application demonstrating a **searchable functionality registry pattern** with dynamic view composition, external data resolution, and clean architecture principles.

## 🎯 What This App Does

FunctionalitySearcher is a proof-of-concept that showcases:

1. **Dynamic Functionality Discovery**: Search and navigate to different app features dynamically
2. **Data Resolver Pattern**: Functionalities can request external data not stored in app context
3. **Factory + Composer Pattern**: Clean separation between functionality creation and composition
4. **Hybrid Architecture**: UIKit and SwiftUI functionalities coexist seamlessly

### Core Concept

Instead of hardcoding navigation paths, the app maintains a **searchable registry of functionalities**. Users search for features (e.g., "user preferences" ,"subscription", "profile", "billing"), and the app dynamically creates and presents the appropriate screen with the necessary data.

---

## 🔑 Key Components

### 1. **Functionality Model** (`Core/Models/Functionality.swift`)
Defines a searchable functionality with:
- `code`: Unique identifier (e.g., `PROF_011`)
- `name`, `description`, `keywords`: Searchable metadata
- `arguments`: Dictionary for external data (using `FunctionalityArgumentValue`)
- `uiType`: `.uikit` or `.swiftui`

### 2. **Data Resolver Pattern** (`Core/Protocols/FunctionalityDataResolver.swift`)

**Example**: `SwiftUIFunctionality11DataResolver`
protocol FunctionalityDataResolver {
    func resolveData(for functionality: Functionality, 
                     context: AppContext) 
    -> [String: FunctionalityArgumentValue]
}

Resolvers fetch:
API data
Database queries
Computed values
External service responses
Data is merged into functionality.arguments before view creation.

### 3. Factory + Composer Pattern (Functionalities/Factory/)
- Factory (ConcreteFunctionalityFactory): Maps functionality codes to view controllers
- Composers (UIKitFunctionalityXComposerUI, SwiftUIFunctionalityXComposerUI):
- Encapsulate view controller creation logic
- Inject dependencies (functionality, context, data, callbacks)
- Return configured UIViewController instances

### 4. Search Service (Search/Services/MockSearchService.swift)
Scores functionalities by:
Exact name matches (highest score)
Keyword matches
Description matches
Category matches
Code matches

##How to Test
Prerequisites
Xcode 15+
iOS 15+ simulator or device


Test Scenarios
- Scenario 1: Basic Functionality Search
In the search bar, type: subscription
Tap on "User preferences and subscription" (PROF_011)
Expected: See a SwiftUI screen showing:
Subscription tier (Premium)
User preferences (theme, language, notifications)
Account balance
Last login date

- Scenario 2: External Data Functionality
Search: PROF_010 or account details
Tap the result
Expected: UIKit screen with:
VIP badge (if loyalty points > 1000)
Loyalty points card
Order history
Payment methods

- Scenario 3: Standard Functionality (No External Data)
Search: BILL_001 or download invoice
Tap result
Expected: UIKit screen with custom card UI

- Scenario 4: Template Fallback
Search: PROD_015 (not registered in factory)
Tap result
Expected: Default template with category icon
