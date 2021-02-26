module Mutations
  class CreateList < Mutations::BaseMutation
    argument :title, String, required: true

    type Types::ListType


    def resolve(title:)
      List.create!(title: title)
    end
  end
end