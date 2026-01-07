//
//  BillingView.swift
//  FunctionalitySearcher
//
//  Billing tab with billing summary and functionalities
//

import SwiftUI

struct BillingView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    let functionalityService: FunctionalityService
    let onFunctionalitySelected: (Functionality) -> Void
    
    private var billingFunctionalities: [Functionality] {
        functionalityService.getFunctionalities(byCategory: "Billing")
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: theme.spacing.lg) {
                    // Billing Summary Header
                    billingSummaryHeader
                    
                    // Quick Actions
                    quickActionsSection
                    
                    // Billing Functionalities Title
                    Text("All Billing Options")
                        .font(theme.typography.title)
                        .foregroundColor(theme.colorPalette.textPrimary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, theme.spacing.md)
                    
                    // Grid of Billing Functionalities
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 16),
                        GridItem(.flexible(), spacing: 16)
                    ], spacing: theme.spacing.md) {
                        ForEach(billingFunctionalities) { functionality in
                            FunctionalityCardButton(
                                functionality: functionality,
                                onTap: {
                                    onFunctionalitySelected(functionality)
                                }
                            )
                        }
                    }
                    .padding(.horizontal, theme.spacing.md)
                }
                .padding(.vertical, theme.spacing.md)
            }
            .background(theme.colorPalette.background)
            .navigationTitle("Billing")
            .navigationBarTitleDisplayMode(.large)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
    
    private var billingSummaryHeader: some View {
        VStack(spacing: theme.spacing.md) {
            // Icon
            ZStack {
                Circle()
                    .fill(theme.colorPalette.primary.opacity(0.1))
                    .frame(width: 80, height: 80)
                
                Image(systemName: "dollarsign.circle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(theme.colorPalette.primary)
            }
            
            // Summary Stats
            HStack(spacing: theme.spacing.lg) {
                VStack(spacing: theme.spacing.xs) {
                    Text("24")
                        .font(theme.typography.title)
                        .foregroundColor(theme.colorPalette.textPrimary)
                        .fontWeight(.bold)
                    Text("Total Invoices")
                        .font(theme.typography.caption)
                        .foregroundColor(theme.colorPalette.textSecondary)
                }
                
                Divider()
                    .frame(height: 40)
                
                VStack(spacing: theme.spacing.xs) {
                    Text("$1,250.75")
                        .font(theme.typography.title)
                        .foregroundColor(theme.colorPalette.success)
                        .fontWeight(.bold)
                    Text("Balance")
                        .font(theme.typography.caption)
                        .foregroundColor(theme.colorPalette.textSecondary)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(theme.spacing.lg)
        .background(theme.colorPalette.surface)
        .cornerRadius(theme.cornerRadius.large)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .padding(.horizontal, theme.spacing.md)
    }
    
    private var quickActionsSection: some View {
        VStack(alignment: .leading, spacing: theme.spacing.md) {
            Text("Quick Actions")
                .font(theme.typography.subtitle1)
                .foregroundColor(theme.colorPalette.textPrimary)
                .fontWeight(.semibold)
            
            HStack(spacing: theme.spacing.sm) {
                quickActionCard(
                    title: "Download Latest",
                    icon: "arrow.down.circle.fill",
                    color: theme.colorPalette.primary
                )
                
                quickActionCard(
                    title: "View History",
                    icon: "clock.fill",
                    color: theme.colorPalette.secondary
                )
            }
        }
        .padding(theme.spacing.md)
        .background(theme.colorPalette.surface)
        .cornerRadius(theme.cornerRadius.medium)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .padding(.horizontal, theme.spacing.md)
    }
    
    private func quickActionCard(title: String, icon: String, color: Color) -> some View {
        Button(action: {
            // Quick action - could navigate to specific functionality
        }) {
            VStack(spacing: theme.spacing.sm) {
                Image(systemName: icon)
                    .font(.system(size: 32))
                    .foregroundColor(color)
                
                Text(title)
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colorPalette.textPrimary)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding(theme.spacing.md)
            .background(theme.colorPalette.background)
            .cornerRadius(theme.cornerRadius.small)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
