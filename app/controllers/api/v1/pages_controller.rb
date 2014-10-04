class API::V1::PagesController < APIController
  
  before_filter :build_resource, :only => :create
  
  load_and_authorize_resource :except => [:destory], :class => "Faalis::Page"
  
  # GET /api/v1/pages
  def index
    respond_with(@pages)
  end

  def create
    
    if @page.save
      respond_with(@page)
    else
      respond_to do |format|
        format.json { render :json => {:fields => @page.errors}, :status => :unprocessable_entity }
      end
    end
  end

  def show
    respond_with(@page)
  end

  def update
    

    if @page.update(resource_params)
      respond_with(@page)
    else
      respond_to do |format|
        format.json { render :json => {:fields => @page.errors}, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    ids = params[:id].split(",")
    @pages = Faalis::Page.where(:id => ids)
    authorize! :destroy, @pages
    @pages.destroy_all
  end

  def build_resource
    @page = Faalis::Page.new(resource_params)
    
  end

  def resource_params
    params.require(:page).permit(:id, :title, :layout, :description, :tags, :permalink, :publish, :raw_content)
  end

end
