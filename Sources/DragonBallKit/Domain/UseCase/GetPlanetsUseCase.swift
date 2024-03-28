import RefdsShared
import RefdsNetwork

protocol GetPlanetsUseCase {
    func getPlanets(
        page: Int?,
        limit: Int?,
        name: String?,
        isDestroyed: Bool?
    ) async -> Result<PlanetsModel, RefdsHttpError>
}
