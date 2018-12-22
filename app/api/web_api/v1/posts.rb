module WebApi
  class V1::Posts < Grape::API

    resource :posts do

      desc 'Return posts info.',
        success: V1::Entities::Post

      get do
        present Post.all, with: V1::Entities::Post
      end

    end
  end
end
