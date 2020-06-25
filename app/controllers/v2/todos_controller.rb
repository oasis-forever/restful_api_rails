class V2::TodosController < ApplicationController
  def index
    # a dummy response
    json_response({ message: 'Hello there'})
  end
end
