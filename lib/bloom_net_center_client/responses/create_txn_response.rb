module BloomNetCenterClient
  class CreateTxnResponse < BaseResponse

    attribute :txn, Object, lazy: true, default: :default_txn

    private

    def default_txn
      attributes = Txn::ATTRS.each_with_object({}) do |attr, hash|
        attr_dasherized = attr.to_s.dasherize
        hash[attr] = body[:data][attr_dasherized] ||
          body[:data][:attributes][attr_dasherized]
      end
      BloomNetCenterClient::Txn.new(attributes)
    end

  end
end
