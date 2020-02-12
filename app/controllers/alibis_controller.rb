class AlibisController < ApplicationController
   skip_before_action :authorized, only: [:create, :index, :destroy]
def create
        @alibi = Alibi.create(alibi_params)
        if @alibi.valid?
          
          render json: { alibi: @alibi }, status: :created
        else
          render json: { error: 'failed to create alibi' }, status: :not_acceptable
        end
      end
    

      def index
        alibis = Alibi.all 
        render json: alibis,
        include: [:user]
    end
      
    def destroy
    Alibi.destroy(params[:id])
  end
 
  private
  def alibi_params
    params.require(:alibi).permit(:user_id, :when)
  end
end
s