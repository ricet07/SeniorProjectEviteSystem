class User < ActiveRecord::Base
has_many :events, :dependent => :destroy
authenticates_with_sorcery!
  attr_accessible :password, :email, :password_confirmation, :username

validates :username, :presence => true
validates :email, :presence => true,
				  :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}



 validates_length_of :password, :minimum => 6, :message => "password must be at least 6 characters long", :if => :password
 validates_confirmation_of :password, :message => "should match confirmation", :if => :password
 
 end


