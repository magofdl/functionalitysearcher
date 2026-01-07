# Design System Guide

A clean, customizable design system for FunctionalitySearcher with theme support.

---

## 🎨 Overview

The design system provides:
- **5 Pre-built Themes**: Light, Dark, Blue Ocean, Purple Dream, Nature
- **Typography System**: headline, title, subtitle1, subtitle2, body, caption
- **Button Styles**: primary, secondary, tertiary, icon, destructive
- **Components**: Cards, Badges, InfoCards, Dividers
- **Consistent Spacing & Corner Radius**
- **User-Selectable Theme Picker**

---

## 📁 File Structure

```
DesignSystem/
├── Theme/
│   ├── AppTheme.swift         # Theme protocols, types, and definitions
│   └── ThemeManager.swift     # Observable theme manager
├── Components/
│   ├── ButtonStyles.swift     # Button style definitions
│   ├── LabelStyles.swift      # Typography and text styles
│   └── CardStyles.swift       # Card, Badge, and container components
└── Examples/
    └── DesignSystemShowcase.swift  # Usage examples
```

---

## 🎨 Themes

### Available Themes

| Theme | Primary Color | Use Case |
|-------|---------------|----------|
| **Light** | Blue | Default light theme |
| **Dark** | Blue | Dark mode |
| **Blue Ocean** | Deep Blue | Professional, ocean-inspired |
| **Purple Dream** | Purple | Creative, vibrant |
| **Nature** | Green | Calm, natural |

### Theme Structure

Each theme includes:
```swift
protocol Theme {
    var name: String { get }
    var colorPalette: ColorPalette { get }  // Colors
    var typography: Typography { get }       // Fonts
    var spacing: Spacing { get }             // Spacing values
    var cornerRadius: CornerRadius { get }   // Border radius
}
```

### Color Palette

```swift
struct ColorPalette {
    // Primary & Secondary
    let primary: Color
    let secondary: Color
    let onPrimary: Color      // Text on primary color
    let onSecondary: Color    // Text on secondary color
    
    // Background & Surface
    let background: Color     // App background
    let surface: Color        // Card/component background
    
    // Semantic Colors
    let error: Color
    let success: Color
    let warning: Color
    let info: Color
    
    // Text Colors
    let textPrimary: Color    // Main text
    let textSecondary: Color  // Secondary text
    let textTertiary: Color   // Tertiary text
    let textDisabled: Color   // Disabled text
    
    // Borders & Dividers
    let border: Color
    let divider: Color
}
```

---

## 📝 Typography

### Font Styles

```swift
// Usage
Text("Headline")
    .headlineStyle()

Text("Title")
    .titleStyle()

Text("Subtitle 1")
    .subtitle1Style()

Text("Subtitle 2")
    .subtitle2Style()

Text("Body text")
    .bodyStyle()

Text("Caption")
    .captionStyle()
```

### Custom Colors

```swift
Text("Custom color")
    .titleStyle(color: .red)
```

### Semantic Text Styles

```swift
Text("Primary text").primaryText()
Text("Secondary text").secondaryText()
Text("Error text").errorText()
Text("Success text").successText()
```

---

## 🔘 Buttons

### Button Styles

#### Primary Button (Filled)
```swift
Button("Save") {
    // action
}
.primaryButtonStyle()
```

#### Secondary Button (Outlined)
```swift
Button("Cancel") {
    // action
}
.secondaryButtonStyle()
```

#### Tertiary Button (Text only)
```swift
Button("Learn More") {
    // action
}
.tertiaryButtonStyle()
```

#### Icon Button
```swift
Button {
    // action
} label: {
    Image(systemName: "heart.fill")
}
.iconButtonStyle()

// With custom background
.iconButtonStyle(backgroundColor: .red)
```

#### Destructive Button
```swift
Button("Delete") {
    // action
}
.destructiveButtonStyle()
```

---

## 🎴 Components

### ThemedCard

```swift
ThemedCard {
    VStack {
        Text("Card content")
        Text("More content")
    }
}

// Or as modifier
VStack {
    Text("Content")
}
.cardStyle()

// Custom padding
.cardStyle(padding: 24)
```

### InfoCard

```swift
InfoCard(
    title: "Email",
    value: "user@example.com",
    icon: "envelope.fill"
)
```

### Badge

```swift
Badge("New")
Badge("Premium", color: theme.colorPalette.success)
```

### ThemedLabel

```swift
ThemedLabel("User Name", icon: "person.fill", style: .subtitle1)
```

### ThemedDivider

```swift
ThemedDivider()
```

---

## 🎯 Usage in Views

### Step 1: Add Environment Variables

```swift
struct MyView: View {
    @Environment(\.theme) var theme
    
    var body: some View {
        // Your view
    }
}
```

### Step 2: Use Design System Components

```swift
struct InvoiceHistoryView: View {
    @Environment(\.theme) var theme
    
    var body: some View {
        ScrollView {
            VStack(spacing: theme.spacing.lg) {
                // Header
                Text("Invoice History")
                    .headlineStyle()
                
                // Info Cards
                InfoCard(
                    title: "Total Invoices",
                    value: "24",
                    icon: "doc.text"
                )
                
                // Buttons
                Button("Download All") {
                    // action
                }
                .primaryButtonStyle()
                
                Button("Export PDF") {
                    // action
                }
                .secondaryButtonStyle()
            }
            .padding(theme.spacing.md)
        }
        .background(theme.colorPalette.background)
    }
}
```

---

## 🔧 Spacing & Radius

### Spacing

```swift
theme.spacing.xs    // 4pt
theme.spacing.sm    // 8pt
theme.spacing.md    // 16pt
theme.spacing.lg    // 24pt
theme.spacing.xl    // 32pt
theme.spacing.xxl   // 48pt
```

### Corner Radius

```swift
theme.cornerRadius.small       // 4pt
theme.cornerRadius.medium      // 8pt
theme.cornerRadius.large       // 12pt
theme.cornerRadius.extraLarge  // 16pt
theme.cornerRadius.round       // 999pt (fully rounded)
```

### Example

```swift
RoundedRectangle(cornerRadius: theme.cornerRadius.medium)
    .fill(theme.colorPalette.primary)
    .padding(theme.spacing.md)
```

---

## 🎨 Theme Switching

### User-Facing Theme Picker

The `SearchView` includes a built-in theme picker:

```swift
// Automatically available in SearchView
// User can tap "Theme" dropdown to select
```

### Programmatic Theme Switching

```swift
// Access ThemeManager
@EnvironmentObject var themeManager: ThemeManager

// Change theme
themeManager.setTheme(.dark)
themeManager.setTheme(.blue)
themeManager.setTheme(.purple)
```

### Theme Persistence

Themes are automatically saved to `UserDefaults` and restored on app launch.

---

## 📱 Integration

### App Setup

The design system is integrated at the app level:

```swift
// In AppCoordinator
let searchView = SearchView(...)
    .themedApp() // ✅ Applies theme to entire app
```

The `.themedApp()` modifier:
- Injects `ThemeManager` as environment object
- Sets up theme environment value
- Enables theme switching throughout the app

---

## 🎯 Best Practices

### 1. Use Theme Colors

❌ **Avoid hardcoded colors:**
```swift
.foregroundColor(.blue)
```

✅ **Use theme colors:**
```swift
.foregroundColor(theme.colorPalette.primary)
```

### 2. Use Typography Styles

❌ **Avoid hardcoded fonts:**
```swift
.font(.system(size: 22, weight: .semibold))
```

✅ **Use typography styles:**
```swift
.titleStyle()
```

### 3. Use Spacing Values

❌ **Avoid magic numbers:**
```swift
.padding(16)
```

✅ **Use theme spacing:**
```swift
.padding(theme.spacing.md)
```

### 4. Use Button Styles

❌ **Custom button styling:**
```swift
Button("Save") { }
    .padding()
    .background(Color.blue)
    .foregroundColor(.white)
    .cornerRadius(8)
```

✅ **Use button styles:**
```swift
Button("Save") { }
    .primaryButtonStyle()
```

---

## 🎨 Creating Custom Themes

To add a new theme:

1. **Create Theme Struct:**

```swift
struct OrangeTheme: Theme {
    let name = "Sunset"
    
    let colorPalette = ColorPalette(
        primary: Color.orange,
        // ... other colors
    )
    
    let typography = Typography(
        headline: .system(size: 28, weight: .bold),
        // ... other fonts
    )
    
    let spacing = Spacing()
    let cornerRadius = CornerRadius()
}
```

2. **Add to ThemeType Enum:**

```swift
enum ThemeType: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case orange = "Sunset"  // ✅ Add here
    
    var theme: Theme {
        switch self {
        case .orange:
            return OrangeTheme()  // ✅ Add here
        // ... other cases
        }
    }
}
```

---

## 📊 Component Catalog

See `DesignSystemShowcase.swift` for a complete catalog of:
- All typography styles
- All button types
- Card examples
- Interactive components
- Color palette visualization

---

## 🚀 Examples

### Example 1: Invoice Card

```swift
VStack(spacing: theme.spacing.md) {
    Text("Invoice #12345")
        .subtitle1Style()
    
    InfoCard(title: "Amount", value: "$150.00", icon: "dollarsign.circle")
    InfoCard(title: "Status", value: "Paid", icon: "checkmark.circle")
    
    Button("Download PDF") { }
        .primaryButtonStyle()
}
.cardStyle()
```

### Example 2: Statistics Dashboard

```swift
HStack(spacing: theme.spacing.sm) {
    statCard(title: "Total", value: "24")
    statCard(title: "Pending", value: "4")
    statCard(title: "Completed", value: "20")
}

func statCard(title: String, value: String) -> some View {
    VStack {
        Text(value)
            .headlineStyle()
        Text(title)
            .captionStyle()
    }
    .cardStyle()
}
```

### Example 3: Action List

```swift
VStack(spacing: theme.spacing.sm) {
    Button("Primary Action") { }
        .primaryButtonStyle()
        .frame(maxWidth: .infinity)
    
    Button("Secondary Action") { }
        .secondaryButtonStyle()
        .frame(maxWidth: .infinity)
    
    Button("Tertiary Action") { }
        .tertiaryButtonStyle()
}
```

---

## ✅ Checklist for New Views

When creating new functionality views:

- [ ] Add `@Environment(\.theme) var theme`
- [ ] Use typography styles (`.headlineStyle()`, `.bodyStyle()`, etc.)
- [ ] Use button styles (`.primaryButtonStyle()`, etc.)
- [ ] Use theme colors (`theme.colorPalette.*`)
- [ ] Use theme spacing (`theme.spacing.*`)
- [ ] Use theme corner radius (`theme.cornerRadius.*`)
- [ ] Avoid hardcoded colors, fonts, or spacing
- [ ] Test with multiple themes

---

## 📚 Reference

- **Theme Files**: `DesignSystem/Theme/`
- **Component Files**: `DesignSystem/Components/`
- **Example Usage**: `DesignSystem/Examples/DesignSystemShowcase.swift`
- **Updated View**: `Functionalities/SwiftUI/InvoiceHistoryView.swift`
- **Theme Picker**: `Search/Views/SearchView.swift`

---

## 🎉 Summary

The design system provides:
✅ Consistent visual language across the app
✅ User-customizable themes
✅ Easy-to-use components and modifiers
✅ Scalable and maintainable code
✅ Type-safe styling
✅ Automatic theme persistence

Happy theming! 🎨
