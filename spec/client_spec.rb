require 'spec_helper'

describe Tenk::Client do
  subject do
    Tenk::Client.new api_base: 'https://vnext.10000ft.com/api/v1', token: ENV['TENK_TOKEN']
  end

  context 'with block' do
    it do
      Tenk::Client.new do |tenk|
        expect(tenk).to respond_to :get
      end
    end
  end

  it { expect(subject.placeholder_resources).to be_a Tenk::PlaceholderResources }

  it { expect(subject.time_entries).to be_a Tenk::TimeEntries }

  it { expect(subject.bill_rates).to be_a Tenk::BillRates }

  it { expect(subject.approvals).to be_a Tenk::Approvals }
end
