class LinksController < ApiController

  has_scope :by_channel
  has_scope :by_name
  has_scope :by_primary
  has_scope :dates_between


  def index
    unless params[:by_channel]
      head :no_content 
    else
      links = apply_scopes(Link.all).order(created_at: :desc)
      render json: links
    end
  end

  def destroy
    if Link.find_by(id: params[:id])&.destroy
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  def create
    link = Link.new(link_params)
    if link.save
      render json: link
    else
      render json: { errors: link.errors }, status: :unprocessable_entity
    end
  end

  def update
    link = Link.find_by(id: params[:id])
    if link&.update(link_params)
      render json: link
    else
      head :unprocessable_entity
    end
  end

  def show
    if link = Link.find_by(id: params[:id])
      render json: link
    else
      head :unprocessable_entity
    end
  end

  private

  def link_params
    params.require(:link).permit(:category, :link, :name, :category, :id_channel, :is_primary).with_defaults(is_primary: false)
  end

end