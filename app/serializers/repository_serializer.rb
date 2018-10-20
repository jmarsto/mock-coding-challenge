class RepositorySerializer < ActiveModel::Serializer
  attributes :id, :owner, :name, :description, :language, :contributors
end
