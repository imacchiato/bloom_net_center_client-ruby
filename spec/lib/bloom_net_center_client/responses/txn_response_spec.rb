require 'spec_helper'

module BloomNetCenterClient
  RSpec.describe TxnResponse, type: %i[virtus] do

    it "inherits from BaseResponse" do
      expect(described_class < BaseResponse).to be true
    end

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:txn) }
    end

    describe "#txn" do
      context "there is a valid response" do
        let(:body) do
          {
            "data" => {
              "id" => "trackno",
              "type" => "txns",
              "attributes" => {
                "tracking-no" => "trackno",
                "ref-no" => "refno",
                "sender-first-name" => "Fatima",
                "sender-last-name" => "Roberto",
                "sender-street" => "24 Lilian St",
                "sender-city" => "Sum City",
                "sender-province" => "Sum Province",
                "sender-mobile" => "+639171234567",
                "recipient-first-name" => "Mike",
                "recipient-last-name" => "Roberto",
                "recipient-street" => "33 Up St",
                "recipient-city" => "Upcity",
                "recipient-province" => "Uprovince",
                "recipient-mobile" => "+638188927288",
                "currency" => "PHP",
                "amount" => "2050.0",
                "account" => "GATX",
                "status" => "unfunded",
              }
            }
          }
        end
        let(:response) { described_class.new(body: body) }
        let(:txn) { response.txn }

        it "builds a Txn out of the response" do
          expect(txn).to be_a Txn
          expect(txn.id).to eq "trackno"
          expect(txn.tracking_no).to eq "trackno"
          expect(txn.ref_no).to eq "refno"
          expect(txn.sender_first_name).to eq "Fatima"
          expect(txn.sender_last_name).to eq "Roberto"
          expect(txn.sender_street).to eq "24 Lilian St"
          expect(txn.sender_city).to eq "Sum City"
          expect(txn.sender_province).to eq "Sum Province"
          expect(txn.sender_mobile).to eq "+639171234567"
          expect(txn.recipient_first_name).to eq "Mike"
          expect(txn.recipient_last_name).to eq "Roberto"
          expect(txn.recipient_street).to eq "33 Up St"
          expect(txn.recipient_city).to eq "Upcity"
          expect(txn.recipient_province).to eq "Uprovince"
          expect(txn.recipient_mobile).to eq "+638188927288"
          expect(txn.currency).to eq "PHP"
          expect(txn.amount).to eq 2050.0
          expect(txn.account).to eq "GATX"
          expect(txn.status).to eq "unfunded"
        end
      end

      context "there is an invalid response" do
        let(:body) { { "data" => { } } }
        let(:response) { described_class.new(body: body) }
        subject(:txn) { response.txn }
        it { is_expected.to be_nil }
      end
    end

  end
end
