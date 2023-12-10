class HomeController < ApplicationController
  def index
    @regular_links = Link.regular.limit(5)
    @temporary_links = Link.temporary.limit(5)
    @private_links = Link.private_link.limit(5)
    @ephemeral_links = Link.ephemeral.limit(5)
  end
end
