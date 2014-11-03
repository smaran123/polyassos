class LeadsController < ApplicationController
  #layout "manager"
  
  before_action :set_lead, :except=>[:new,:create,:index]
  
  def index
    @worker = Worker.find(params[:worker_id])
    @leads = Lead.where("worker_id = #{@worker.id}")
  end
  
  def new
     @worker = Worker.find(params[:worker_id])
    @lead = Lead.new
    if @lead.worker_comments.blank?
   @lead.worker_comments.build
  end
    
  end
  
  def edit
     @worker = Worker.find(params[:worker_id])
     
#     if @lead.worker_comments.blank?
#   @lead.worker_comments.build
#     end
     
  end
  
  def show
    @worker = Worker.find(params[:worker_id])
  end
  
  def create
    @lead = Lead.new(lead_params.merge(:worker_id => current_worker.id))
    if @lead.save
      redirect_to worker_leads_path
    else
      render "new"
    end
  end
  
  def update
    @worker = Worker.find(params[:worker_id])
    if @lead.update(lead_params)
      redirect_to  worker_leads_path
    else
      render "edit"
    end
  end
  
  
  def destroy
     @worker = Worker.find(params[:worker_id])
    if @lead.destroy
      redirect_to worker_leads_path
    end
  end
  
  
  def set_lead
    @lead = Lead.find(params[:id])
    
  end
  
  private
  
  def lead_params
    params.require(:lead).permit!
  end

end
