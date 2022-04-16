class PopulateRoles < ActiveRecord::Migration[6.1]
  def change
    Role.find_or_create_by(name: 'audio_operator', display_name: 'Audio')
    Role.find_or_create_by(name: 'video_operator', display_name: 'Video')
    Role.find_or_create_by(name: 'zoom_attendant', display_name: 'Zoom Attendant')
    Role.find_or_create_by(name: 'microphone', display_name: 'Mic')
    Role.find_or_create_by(name: 'platform', display_name: 'Platform')
  end
end
