module WebApi

  CORS_HASH = {
    'Access-Control-Allow-Origin' => "*",
    'Access-Control-Allow-Methods' => 'POST, GET, OPTIONS, PUT',
    'Access-Control-Allow-Headers' => 'Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With, Token'
  }.freeze


  class V1 < Grape::API
    format :json
    version 'v1'

    rescue_from ActiveRecord::RecordNotFound do |_e|
      error!({error: 'Record not found'}, 404, source_hash)
    end

    helpers do

      def source_hash
        CORS_HASH.merge({'Last-Modified' => Time.now.httpdate})
      end

    end

    before do
      header.merge!(source_hash)
    end

    mount Posts

    add_swagger_documentation doc_version: '1.0.0', info: { title: "Nau WebAPI Documentation" }
  end
end
