require 'spec_helper'

module BloomNetCenterClient
  RSpec.describe CreateClaimRequest, type: %i[virtus] do

    it "inherits from BaseRequest" do
      expect(described_class < BaseRequest).to be true
    end

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:tracking_no, String) }
      it { is_expected.to have_attribute(:account, String) }
    end

    describe "#body" do
      let(:request) do
        described_class.new(tracking_no: "JUWAX", account: "GDACALA")
      end
      let(:request_body) { JSON.parse(request.body) }
      let(:data) { request_body["data"] }
      let(:attributes) { data["attributes"] }

      it "is the body that the API expects" do
        expect(data["type"]).to eq "claims"
        expect(attributes["tracking-no"]).to eq "JUWAX"
        expect(attributes["account"]).to eq "GDACALA"
      end
    end

  end
end
