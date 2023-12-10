class VisitController < ApplicationController
  include WillPaginate::CollectionMethods
  before_action :set_link

  def create
    @visit = @link.visits.new(
      accessed_at: Time.current,
      ip_address: request.remote_ip
    )

    if @visit.save
      redirect_to @link, notice: 'Visit successfully recorded.'
    else
      redirect_back fallback_location: root_path, alert: 'Failed to record visit.'
    end
  end

  private

  def set_link
    @link = Link.find(params[:link_id])
  end
end

