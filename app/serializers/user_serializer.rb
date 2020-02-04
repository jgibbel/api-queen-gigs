class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :location
    has_many :attends
    has_many :follow_places
    has_many :follow_persons


end


