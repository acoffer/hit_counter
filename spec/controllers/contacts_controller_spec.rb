require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:valid_attributes) {
    {
     name: "Tom",
     email: "tom@stu",
     content: "some message"

    }
  }

  let(:invalid_attributes) {
    {
     name: nil,
     email: nil,
     content: nil 
    }
  }

  describe "GET #new" do
    it "returns success responce" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "it creates a new Contact" do
        expect {
          post :create, params: {contact: valid_attributes}
        }.to change(Contact, :count).by(1)
      end
      it "redirects to the home page (/)" do
        post :create, params: {contact: valid_attributes}
        expect(response).to redirect_to("/")
      end
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database" do
        expect{
          post :create, params: {contact: invalid_attributes}
        }.to_not change(Contact, :count)
      end
      it "re-renders the contacts/new" do
        post :create, params: {contact: invalid_attributes}
        expect(response).to be_success
      end
    end
  end
end
