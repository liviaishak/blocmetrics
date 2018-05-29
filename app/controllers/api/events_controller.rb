class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

   def create
     registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
     if registered_application
       @event = registered_application.events.new(event_params)
         if @registered_application.save
           render json: @event, status: :created
         else
           render json: {errors: @event.errors}, status: :unprocessable_entity
         end
      else
          render json: "Unregistered application", status: :unprocessable_entity
      end
   end

   def preflight
    head 200
   end

   before_filter :set_access_control_headers

   def set_access_control_headers
     headers['Access-Control-Allow-Origin'] = '*'
     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
     headers['Access-Control-Allow-Headers'] = 'Content-Type'
   end

   private
   def event_params
     params.require(:event).permit(:name)
   end
end