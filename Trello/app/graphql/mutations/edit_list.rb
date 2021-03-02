module Mutations
  class EditList < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: true

    type Types::ListType

    def resolve(id:, title:)
      list = List.find(id)
      list.update!(title: title)

      list
    end
  end
end
