import SwiftUI
import RefdsUI
import DragonBallKit

struct PlanetsView: View {
    @StateObject private var dragonBallKit = DragonBallKit.shared
    @State private var page: Int = 1
    @State private var limit: Int = 6
    
    var body: some View {
        NavigationStack {
            List {
                if let planets = dragonBallKit.planets, !planets.items.isEmpty {
                    ForEach(planets.items) { planet in
                        PlanetRowView(planet: planet)
                    }
                }
            }
            .animation(.default, value: dragonBallKit.planets?.items ?? [])
            .refreshable { fetchPlanets() }
            .onAppear { fetchPlanets() }
            .onChange(of: page) { fetchPlanets() }
            .listStyle(.plain)
            .navigationTitle("Planets")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    RefdsPagination(currentPage: $page, canChangeToNextPage: {
                        page < dragonBallKit.planets?.meta?.totalPages ?? 0
                    })
                }
            }
        }
    }
    
    private func fetchPlanets() {
        dragonBallKit.fetchPlanets(page: page, limit: limit)
    }
}

#Preview {
    PlanetsView()
}
