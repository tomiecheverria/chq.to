#rubocop:disable Metrics/ModuleLength
module LinksHelper
  def save_or_redirect(link, notice, success_path, failure_path)
    if link.save
      redirect_to_with_notice(notice, success_path)
    else
      flash[:errors] = link.errors.full_messages
      redirect_to failure_path
    end
  end

  def update_or_redirect(link, notice, success_path, failure_path)
    if link.update(link_params)
      redirect_to_with_notice(notice, success_path)
    else
      flash[:errors] = link.errors.full_messages
      redirect_to failure_path
    end
  end

  def build_new_link(user)
    user.links.build
  end

  def redirect_to_with_notice(notice, path)
    flash[:notice] = notice
    redirect_to path
  end

  def handle_valid_link(link)
    if link.temporary? && link.expired?
      handle_expired_link
    elsif link.custom_private_link?
      redirect_to private_link_form_link_path(id: link.id), data: { turbo: false }
    elsif link.custom_ephemeral?
      handle_ephemeral_link(link)
    else
      create_and_redirect_to_link(link)
    end
  end

  def handle_ephemeral_link(link)
    if link.accessed
      handle_ephemeral_link_accessed(link)
    else
      link.update(accessed: true)
      create_and_redirect_to_link(link)
    end
  end

  def handle_ephemeral_link_accessed(link)
    flash[:alert] = 'This ephemeral link has already been accessed and is no longer valid.'
    render 'errors/forbidden', status: :forbidden
  end

  def handle_expired_link
    flash[:alert] = 'The link has expired'
    render 'errors/not_found', status: :not_found
  end

  def password_matches?(password, link)
    return false unless password.present?

    password == link.password
  end

  def create_and_redirect_to_link(link)
    visit = link.visits.new(
      accessed_at: Time.current,
      ip_address: request.remote_ip
    )

    if link.save && visit.save
      redirect_to_link(link)
    else
      flash[:error] = 'Error creating link or visit'
      redirect_back fallback_location: root_path
    end
  end

  def redirect_to_link(link)
    redirect_to link.url, status: :moved_permanently, allow_other_host: true
  end

  def handle_invalid_link
    flash[:alert] = 'This link does not exist'
    redirect_back fallback_location: root_path
  end

  def handle_invalid_password(link)
    flash[:alert] = 'Invalid password'
    redirect_to private_link_form_link_path(id: link.id), data: { turbo: false }
  end

  def build_link_with_type(user, params)
    link = user.links.build(params)
    link.link_type = link_type_from_params(params[:link_type])
    link.password_confirmation = params[:password_confirmation] if link.private_link?
    link
  end

  def link_type_from_params(type_param)
    type_mapping = {
      'temporary' => :temporary,
      'regular' => :regular,
      'private_link' => :private_link,
      'ephemeral' => :ephemeral
    }
    type_mapping[type_param]
  end

  def filtered_visits(link, params)
    visits = link.visits.where('ip_address LIKE ?', "%#{params[:filter_ip]}%") if params[:filter_ip].present?
    if params[:start_date].present? && params[:end_date].present?
      start_date = params[:start_date].to_date
      end_date = params[:end_date].to_date.end_of_day
      visits = visits.where(accessed_at: start_date..end_date)
    end
    visits.paginate(page: params[:visit_page], per_page: 5)
  end
end
