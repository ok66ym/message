class RoomsController < ApplicationController
before_action :set_group, only: [:edit, :update]

    def index
        @room_lists = Room.all#.order(:id)
        @room_joining = RoomParticipant.where(user_id: current_user.id)
        @room_lists_none = "あなたはまだグループに参加していません。"
        
        if params[:search] == nil
            @room_lists= Room.all
        elsif params[:search] == ''
            @room_lists= Room.all
        else #部分検索
            @room_lists = Room.where("roomname LIKE ? ",'%' + params[:search] + '%')
        end
    end

    def new
        @room = Room.new
        @room.users << current_user
    end

    def create
        @room = Room.new(room_params)
        if @room.save
            redirect_to rooms_path, notice: 'グループを作る'
        else
            redirect_to new_room_path
        end
    end

    def show
        @room = Room.find(params[:id])
        @responses = @room.responses
        @response = Response.new
    end

    def edit
        # @group = Group.find(params[:id])
    end

    def update
        # @group = Group.find(params[:id])
        if @room.update(room_params)
            redirect_to rooms_path, notice: 'あなたのグループを更新する'
        else
            render :edit
        end
    end

    def destroy
        delete_room = Room.find(params[:id])
        if delete_room.destroy
            redirect_to rooms_path, notice: 'あなたのグループを削除する'
        end
    end

    private
    def set_group
        @room = Room.find(params[:id])
    end

    def room_params
        params.require(:room).permit(:roomname, user_ids: [])
    end
end
