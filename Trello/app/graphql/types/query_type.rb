module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # lists
    field :lists, [Types::ListType], null: false
    def lists
      List.all
    end
    #
    # field :list, Type::ListType, null: false do
    #   argument :id, ID, required: true
    # end
    # def list(id:)
    #   List.find(id)
    # end
  end
end
