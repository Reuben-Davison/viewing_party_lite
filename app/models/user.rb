class User < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :email
    validates_uniqueness_of :email
end

