class ProfileController < ApplicationController
  def index
   @user = current_user 
 
  
  end

  def delete
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    respond_to do |format|
    format.html {  redirect_to:profile_index, notice: 'Video was deleted.' }
    format.json { head :no_content }
      
    end
     
  end

  
   
end
