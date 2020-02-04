class GigSerializer < ActiveModel::Serializer
    attributes :id, :name, :date, :time, :longitude, :latitude, :category, :poster, :description, :published, :host_id, :host_type, :venue_name, :venue_address, :age
    has_many :invite_performers
    has_many :invite_venues
  end
