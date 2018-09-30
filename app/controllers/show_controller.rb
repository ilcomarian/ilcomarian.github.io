class ShowController < ApplicationController
  def index
    
  end

  
  def mp4
    file = YoutubeDL.download params[:url_param]
     
    str= file.filename
    if str.match(/.mp4/) != nil
      str = str.split('.mp4')
      str.push('.mkv')
      str = str.join()
    end
    name = file.filename
    name = name.split('-')
    name = name[0] + name[1]

    send_data(File.read(str),:filename => file.filename)
  
    File.delete(str)     
     
  end

  def mp3
    options = {
      format: 'bestaudio',
      prefer_ffmpeg: "true",
      extract_audio: "true",
      audio_format: "mp3",
      }

    
    file =  YoutubeDL.download  params[:url_param], options
    puts file.filename
    str= file.filename
    if str.match(/.webm/) != nil
    str = str.split('.webm')
    str.push('.mp3')
    str = str.join()
    end
    name = file.filename
    name = name.split('-')
    name = name[0] + name[1]
    send_data(File.read(str),:filename => name) 
    File.delete(str)   
    # redirect_to:show_index
  end
  
  def create
    @user = current_user.id
    @playlist = Playlist.create(url: params[:url_param], url_show: params[:url], user_id: @user )
    flash[:message] = 'add to profile'
    redirect_to:show_index
  end

  private

  def user
     @user =current_user.id
  end
  
   
  
end
