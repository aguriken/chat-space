require 'rails_helper'

describe MessagesController do

  let(:user){create(:user)}
  let(:group){user.groups.first}
  let(:groups){user.groups}
  let(:message){user.messages}
  let(:messages){create_list(user.messages, 3)}
  # let(:group_members){group.users}

  before do
    sign_in user
  end

  describe "GET #index" do

    before do
      get :index , group_id: group.id
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end

    it "assign the requested current_group to @group" do
      expect(assigns(:group)).to eq group
    end

    it "assign the requested current_group to @groups" do
      expect(assigns(:groups)).to match groups
    end

    it "assign the requested current_group to @messages" do
      expect(assigns(:messages)).to match group.messages
    end

    # it "assign the requested current_group to @group_members" do
    #   binding.pry
    #   expect(assigns(:group_members)).to match group_members
    # end

  end

  describe "GET #create" do
    context "message is saved" do

      it "message is saved in the database" do
        expect{
          post :create, group_id: group, message: attributes_for(:message)
        }.to change(Message, :count).by(1)
      end

      it "renders the :index template" do
        get :index , group_id: group.id
        expect(response).to render_template :index
      end
    end
    context "message is not saved" do

      it "message is not saved in the database" do
        expect{
          post :create, group_id: group.id, message: attributes_for(:message, body: nil)
        }.to_not change(Message, :count)
      end

      it "renders the :index template" do
        get :index , group_id: group.id
        expect(response).to render_template :index
      end
    end
  end
end
