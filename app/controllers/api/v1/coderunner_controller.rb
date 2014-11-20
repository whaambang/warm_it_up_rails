class Api::V1::CoderunnerController < ApplicationController
  def index
    result = EvalIn.call(params[:code], language: "ruby/mri-2.1")
    answer = result.output.chomp
    render json: answer.to_json, callback: params["callback"]
  end
end
