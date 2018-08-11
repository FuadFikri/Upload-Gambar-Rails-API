class User < ApplicationRecord
	
	validates :name, presence: true, length: { minimum: 3 }
	validates :email, presence: true, uniqueness: true
	mount_uploader :picture, PictureUploader
	
	
	has_secure_password
	validates :password, length: { minimum: 6, maximum: 20 }, allow_nil: true
	# allow_nil agar saat update tidak minta password terus
	def self.hide_date_and_password
		def as_json(options={})
		{
			id: id,
			name: name,
			email: email,
			phone_number: phone_number,
			avatar:avatar
		}	
		end	
	end	
end	

 # cari format regex
# validate :bikin_sendiri
#  def bikin_sendiri
# end