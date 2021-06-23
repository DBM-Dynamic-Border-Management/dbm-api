class LinksController < ApiController

  has_scope :by_channel
  has_scope :by_name
  has_scope :by_primary
  has_scope :dates_between


  def index
    missions = apply_scopes(Mission.by_active(true)).order(created_at: :desc).page(params[:page]).per((params[:per_page] || 5).to_i)
    missions_current_user_applied_to = Mission.by_active(true).by_user_applied(current_user.id)
    render json: {
      missions: ActiveModel::Serializer::CollectionSerializer.new(
        missions,
        each_serializer: MissionSerializer,
        scope: current_user
      ),
      missions_current_user_applied_to_count: {
        en_cours_de_traitement: missions_current_user_applied_to.by_mission_statuses('En cours de traitement').size,
        transmis_au_client: missions_current_user_applied_to.by_mission_statuses('Transmis au client').size,
        candidature_refusee: missions_current_user_applied_to.by_mission_statuses('Candidature refusée').size
      },
      meta: {
        count: missions.size,
        total_count: missions.total_count,
        max_page: missions.total_pages,
        current_page: missions.current_page
      }
    }
  end

  def destroy
    if @mission.update(is_active: false)
      render json: @mission
    else
      render json: { errors: @mission.errors }, status: :unprocessable_entity
    end
  end

  def create
    mission = Mission.new(mission_params)
    if mission.save
      render json: mission
    else
      render json: { errors: mission.errors }, status: :unprocessable_entity
    end
  end

  def update
    params[:mission][:mission_statuses_attributes]&.each { |mission_status| mission_status[:user_id] = current_user.id }
    if @mission.update(mission_params)
      render json: @mission
    else
      render json: { errors: @mission.errors }, status: :unprocessable_entity
    end
  end

  def show
    @mission.mission_statuses.build(
      mission_id: params[:id], user_id: current_user.id
    ).save if @mission.mission_statuses.by_user(current_user.id).empty?
    render json: @mission
  end

end