
module WebApi
  class V1::Entities::Post  < Grape::Entity
    expose "author", documentation:   { type: String, desc: 'author info' }
  end
end
