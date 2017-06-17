require 'rails_helper'

describe Message do

  let(:message){build(:message)}

  describe "#create" do
    it "is valid with body" do
      message.valid?
      expect(message).to be_valid
    end

    it "is invalid if body is empty" do
      message.body = ""
      message.valid?
      expect(message.errors[:body]).to include("を入力してください。")
    end
  end
end
