# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def navigation
    if params[:filter] == 'untracked'
      link_to 'All', :params => {:filter => 'none'}
    else
      link_to 'Only untracked', :params => {:filter => 'untracked'}
    end
  end
end
