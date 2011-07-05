class PagesController < HighVoltage::PagesController
  before_filter :parse_format_from_id

  unloadable

  rescue_from ActionView::MissingTemplate do |exception|
    if exception.message =~ %r{Missing template pages/}
      raise ActionController::RoutingError, "No such page: #{params[:id]}"
    else
      raise exception
    end
  end

  def show
    respond_to do |format|
      page_contents = File.read(Rails.root.join('app','views',"#{current_page}.html.erb"))
      format.json { render :json => page_contents.to_json }
    end
  end

  protected

    def parse_format_from_id
      matches = /\.\w*$/.match(params[:id])
      if matches
        params[:format] = matches[0].gsub('.','').to_sym
        params[:id] = params[:id].gsub(".#{params[:format].to_s}", '')
      end
    end
end