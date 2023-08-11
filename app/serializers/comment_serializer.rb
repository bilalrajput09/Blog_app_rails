class CommentSerializer < ActiveModel::Serializer
  attributes :id, :author_id, :post_id, :text
end
