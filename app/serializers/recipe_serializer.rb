class RecipeSerializer < ActiveModel::Serializer
  attributes :title, :instructions, :minutes_to_complete

  belongs_to :user
end
