class Adventure < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :reactions, dependent: :destroy
    validates :user, presence:true

    Kinds = %w[like dislike].freeze
    KindsSpanish = {"like" => "Me gusta", "dislike" => "No me gusta"}.freeze

end
