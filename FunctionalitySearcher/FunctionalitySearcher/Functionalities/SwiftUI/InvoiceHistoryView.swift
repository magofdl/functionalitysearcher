import SwiftUI

struct InvoiceHistoryView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    let functionality: Functionality
    let userId: String
    var onDismiss: (() -> Void)?
    
    var body: some View {
        SwiftUIFunctionalityScaffold(title: functionality.name, onDismiss: onDismiss) {
            ScrollView {
                VStack(spacing: theme.spacing.lg) {
                    // Header Card with Gradient
                    headerCard
                    
                    // User Information
                    userInfoSection
                    
                    // Invoice Statistics
                    statisticsSection
                    
                    // Action Buttons
                    actionsSection
                }
                .padding(theme.spacing.md)
            }
            .background(theme.colorPalette.background)
        }
    }
    
    private var headerCard: some View {
        VStack(spacing: theme.spacing.md) {
            Image(systemName: "doc.text.fill")
                .font(.system(size: 64))
                .foregroundColor(theme.colorPalette.onPrimary)
            
            Text("Invoice History")
                .titleStyle(color: .white)
            
            Text("View and manage your invoices")
                .bodyStyle(color: .white.opacity(0.9))
        }
        .frame(maxWidth: .infinity)
        .padding(theme.spacing.xl)
        .background(
            LinearGradient(
                colors: [theme.colorPalette.primary, theme.colorPalette.primaryVariant],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
            )
        )
        .cornerRadius(theme.cornerRadius.large)
        .shadow(color: theme.colorPalette.primary.opacity(0.3), radius: 10, x: 0, y: 5)
    }
    
    private var userInfoSection: some View {
        VStack(spacing: theme.spacing.sm) {
            Text("User Information")
                .subtitle1Style()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            InfoCard(title: "User ID", value: userId, icon: "person.fill")
            InfoCard(title: "Account Status", value: "Active", icon: "checkmark.circle.fill")
            InfoCard(title: "Member Since", value: "January 2024", icon: "calendar")
        }
    }
    
    private var statisticsSection: some View {
        VStack(spacing: theme.spacing.sm) {
            Text("Statistics")
                .subtitle1Style()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: theme.spacing.sm) {
                statCard(title: "Total", value: "24", icon: "doc.text")
                statCard(title: "Paid", value: "20", icon: "checkmark.circle")
                statCard(title: "Pending", value: "4", icon: "clock")
            }
        }
    }
    
    private func statCard(title: String, value: String, icon: String) -> some View {
        VStack(spacing: theme.spacing.xs) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(theme.colorPalette.primary)
            
            Text(value)
                .titleStyle()
            
            Text(title)
                .captionStyle()
        }
        .frame(maxWidth: .infinity)
        .padding(theme.spacing.md)
        .background(theme.colorPalette.surface)
        .cornerRadius(theme.cornerRadius.medium)
    }
    
    private var actionsSection: some View {
        VStack(spacing: theme.spacing.sm) {
            Text("Actions")
                .subtitle1Style()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Button("Download All Invoices") {
                // Action
            }
            .primaryButtonStyle()
            .frame(maxWidth: .infinity)
            
            Button("View Detailed Report") {
                // Action
            }
            .secondaryButtonStyle()
            .frame(maxWidth: .infinity)
            
            Button("Export to PDF") {
                // Action
            }
            .tertiaryButtonStyle()
            .frame(maxWidth: .infinity)
        }
    }
}
