class MeetupsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]
  
    def index
      meetups = Meetup.all
      render json: meetups,
      include:[:event]

    end

    def create
          @meetup = Meetup.create(pending_params)
          if @meetup.valid?
            
            render json: { meetup: @meetup }, status: :created
          else
            render json: { error: 'failed to create meetup' }, status: :not_acceptable
          end
    end
    
    

        private
    def pending_params
      params.require(:meetup).permit(:date, :alibi_1_id, :alibi_2_id, :event_id)
    end

end




