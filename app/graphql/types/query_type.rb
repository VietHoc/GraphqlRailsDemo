module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :items, 
    [Types::ItemType],
    null: false, 
    description: "Return a list of items" do
      argument :query, String, required: false
    end
    def items(query: nil)
      return Item.all if query.nil?
      Item.all.where("title LIKE ?", "%#{query}%")
    end 

    field :item,
    Types::ItemType,
    "Find a item by ID" do
      argument :id, ID
    end
    def item(id:)
      Item.find(id)
    end
  end
end
