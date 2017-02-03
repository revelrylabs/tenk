require 'spec_helper'

describe Tenk::BillRates do
  subject(:bill_rate) { Tenk::BillRates.new(Tenk.new) }

  it { should respond_to :list }
  it { should respond_to :get }
  it { should respond_to :update }
  it { should respond_to :create }

  # FIXME: LIST does not work due to permissions of API users

  # describe '#list' do
  #   subject do
  #     VCR.use_cassette 'list_bill_rates', record: :new_episodes do
  #       bill_rate.list
  #     end
  #   end
  #
  #   it { should respond_to :data }
  #
  #   describe '#data' do
  #     it { should respond_to :length }
  #   end
  # end

  # FIXME: GET does not work due to permissions of API users

  # describe '#get' do
  #   subject do
  #     VCR.use_cassette 'get_bill_rates', record: :new_episodes do
  #       bill_rate.get(319903)
  #     end
  #   end
  #
  #   it { should respond_to :rate }
  # end

  describe '#update' do
    subject do
      VCR.use_cassette 'update_bill_rates', record: :new_episodes do
        bill_rate.update(319903, rate: 123)
      end
    end

    it { should respond_to :rate }
  end

  # FIXME: CREATE does not work

  # describe '#create' do
  #   subject do
  #     VCR.use_cassette 'create_bill_rates', record: :new_episodes do
  #       bill_rate.create(assignable_id: 183760, rate: 123)
  #     end
  #   end
  #
  #   it { should respond_to :rate }
  # end
end
