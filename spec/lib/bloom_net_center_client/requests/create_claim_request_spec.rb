require 'spec_helper'

module BloomNetCenterClient
  RSpec.describe CreateClaimRequest, type: %i[virtus] do

    it "inherits from BaseRequest" do
      expect(described_class < BaseRequest).to be true
    end

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:recipient_first_name, String) }
      it { is_expected.to have_attribute(:recipient_last_name, String) }
      it { is_expected.to have_attribute(:ref_no, String) }
      it { is_expected.to have_attribute(:destination, String) }
    end

  end
end