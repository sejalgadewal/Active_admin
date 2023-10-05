require 'rails_helper'

# RSpec.describe "Posts", type: :request do
RSpec.describe PostsController, type: :controller do

  let(:valid_attributes) {
    { title: 'test', body: 'Test Post' }
  }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      post = Post.create! valid_attributes
      get :show, params: { id: post.to_param}
      expect(response). to be_successful
    end
  end

  describe "GET #new" do
  it "returns a success response" do
    get :new
    expect(response).to be_successful
  end
  end
end
