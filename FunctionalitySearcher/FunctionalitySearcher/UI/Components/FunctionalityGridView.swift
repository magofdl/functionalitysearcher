//
//  FunctionalityGridView.swift
//  FunctionalitySearcher
//
//  Reusable grid view for displaying functionalities
//

import SwiftUI

struct FunctionalityGridView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    let functionalities: [Functionality]
    let onFunctionalitySelected: (Functionality) -> Void
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: theme.spacing.md) {
                ForEach(functionalities) { functionality in
                    FunctionalityCardButton(
                        functionality: functionality,
                        onTap: {
                            onFunctionalitySelected(functionality)
                        }
                    )
                }
            }
            .padding(theme.spacing.md)
        }
        .background(theme.colorPalette.background)
    }
}
