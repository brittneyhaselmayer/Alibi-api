class PendingsController < ApplicationController
  skip_before_action :authorized, only: [:create, :index, :destroy]

  def index
    pendings = Pending.all
    render json: pendings,
    include:[:event, :alibi_1, :alibi_2]

  end

  def create
        pending = Pending.create(pending_params)
      
        if pending.valid?
        
          render json: {pending: pending} , status: :created
        else
          render json: { error: 'failed to create pending' }, status: :not_acceptable
        end
  end
  
  def destroy
    Pending.destroy(params[:id])
  end
      

       private
  def pending_params
    params.require(:pending).permit(:date, :alibi_1_id, :alibi_2_id, :event_id)
  end

end
