class User < ActiveRecord::Base
    has_many :portfolios, dependent: :destroy
end
