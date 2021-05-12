class V2::TodosController < ApplicationController
  def index
    # a dummy response
    json_response({ message: 'This is the verion 2 of Todos' })
  end
end
