class User < ActiveRecord::Base
  mount_uploader :resume, ResumeUploader
end
