class ResponsesController < ApplicationController
def create
  room = Room.find(params[:room_id])
  response = room.responses.build(response_params)

  response.user_id = current_user.id
  if response.save
    flash[:success] = "コメントしました"
    redirect_to controller: :rooms, action: :show, id: params[:room_id]
    # (fallback_location:root_path)
  else
    flash[:success] = "コメントできませんでした"
    redirect_to controller: :rooms, action: :show, id: params[:room_id]
    # (fallback_location:root_path)
  end
end

private
    def response_params
        params.require(:response).permit(:content)
    end
end
