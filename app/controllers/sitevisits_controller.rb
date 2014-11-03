class SitevisitsController < ApplicationController
  
#layout "manager"
  
  before_action :set_site_visit, :except=>[:new,:create,:index]
  
  def index
    #    @worker = Worker.find(params[:worker_id])
    #  @leads = Lead.where("worker_id = #{@worker.id}")
     @worker = Worker.find(params[:worker_id])
    @site_visits = SiteVisit.where("worker_id = #{@worker.id}")
  end
  
  def new
    #     @worker = Worker.find(params[:worker_id])
    #    @lead = Lead.new
    @worker = Worker.find(params[:worker_id])
    @site_visit = SiteVisit.new
    
    if @site_visit.worker_comments.blank?
      @site_visit.worker_comments.build
    end
    
  end
  
  def edit
     @worker = Worker.find(params[:worker_id])
    # @worker = Worker.find(params[:worker_id])
 
  end
  
  def show
     @worker = Worker.find(params[:worker_id])
    #    @worker = Worker.find(params[:worker_id])
  
    
  end
  
  def create
    #@lead = Lead.new(lead_params.merge(:worker_id => current_worker.id))
    @site_visit =SiteVisit.new(site_visit_params.merge(:worker_id => current_worker.id))
    if @site_visit.save
      redirect_to   worker_sitevisits_path
    else
      render "new"
    end
  end
  
  def update
    #@worker = Worker.find(params[:worker_id])
@worker = Worker.find(params[:worker_id])
    if @site_visit.update(site_visit_params)
      redirect_to   worker_sitevisits_path
    else
      render "edit"
    end
  end
  
  
  def destroy
    # @worker = Worker.find(params[:worker_id])
@worker = Worker.find(params[:worker_id])
    if @site_visit.destroy
      redirect_to  worker_sitevisits_path
    end
  end
  
  
  
  
  
  
  
  
  
  
  
  
  def set_site_visit
    @site_visit = SiteVisit.find(params[:id])
    
  end
  
  private
  
  def site_visit_params
    params.require(:site_visit).permit!
  end
  
end
