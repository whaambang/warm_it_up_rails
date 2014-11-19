class Api::V1::CoderunnerController < ApplicationController

  def create
    result = EvalIn.call(params[:code], language: "ruby/mri-2.1")

    render json: result.output
  end
end
