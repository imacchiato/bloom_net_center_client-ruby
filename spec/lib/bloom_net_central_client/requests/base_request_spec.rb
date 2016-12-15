require 'spec_helper'

module BloomNetCentralClient
  RSpec.describe BaseRequest, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:headers) }
    end

  end
end
