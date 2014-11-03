class WorkersController < ApplicationController
 def index
   @workers = Worker.where("manager=?", false).paginate(:page=> params[:page], :per_page=> 8)
  # @workers = Worker.where("manager=?", false).paginate(:page=> params[:page], :per_page=> 8)   if current_worker.manager == true
    
   # @workers = Worker.where("worker = #{current_worker}") if current_worker.manager == false
  end

  def new
    @worker = Worker.new
  end

  
  def show
    @worker = Worker.find(params[:id])
  end

  def create_worker
    @worker = Worker.new(worker_params)
    @worker.password = 'ashok123'
    @worker.password_confirmation = 'ashok123'
    #@worker.confirmation_token = nil
    #@worker.confirmed_at = Time.now
    if @worker.save
            @worker.update_attributes(:confirmation_token => nil,:confirmed_at => Time.now)
      @worker.send_reset_password_instructions
      redirect_to workers_path
    else
      flash[:error] = "Failed to create worker account"
      render "new"
    end
  end

  def edit
    @worker = Worker.find(params[:id])

  end

  def update
    @worker = Worker.find(params[:id])
    if @worker.update(worker_params)
      redirect_to workers_path
    else
      render  "edit"
    end
  end
  
  
  
  
  
#  def update_block
#    @worker = Worker.find(params[:id])
#    if current_worker.is_active?
#      @worker.update_attributes(:is_active=>false)
#      redirect_to workers_path, :notice => "You are banned for WorkerTasks."
#    end
#  end
#  
#  def update_unblock
#    @worker = Worker.find(params[:id])
#    @worker.update_attributes(:is_active=>true)
#    redirect_to workers_path, :notice => "You are allowed for workerTasks."
#  end



  def destroy
    @worker = Worker.find(params[:id])
    if @worker.destroy
      redirect_to workers_path
    end
  end

  # def get_user
  # @user = User.find(params[:id])
  # end
  private

  def worker_params
    params.require(:worker).permit!
  end

end
