module Mutations
  class DeleteList < Mutations::BaseMutation
    argument :id, ID, required: true

    type Types::ListType

    def resolve(id:)
      List.find(id).destroy!
    end
  end
end
