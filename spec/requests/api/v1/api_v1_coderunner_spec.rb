require 'rails_helper'

RSpec.describe "Api::V1::Coderunner", :type => :request do
  it "returns evaluated code" do
    get "/api/v1/coderunner", { code: "puts 'hello world'" }
    resp = response.body.delete('"')
    expect(resp).to eq("hello world")
  end
end
