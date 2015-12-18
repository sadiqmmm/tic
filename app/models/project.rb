class Project < ActiveRecord::Base
	has_many :tickets, dependent: :delete_all # delete all is fast and 
	
	validates :name, presence: true
end
