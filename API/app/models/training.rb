class Training < ApplicationRecord
    enum kind: {a: "A", ab: "AB", abc: "ABC", abcd: "ABCD", abcde: "ABCDE"}

    belongs_to :client
    belongs_to :trainer
    
    has_many :exercises, dependent: :destroy
    
    accepts_nested_attributes_for :exercises, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true

end


# rails g migration