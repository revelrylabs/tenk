require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe Tenk::Projects::BillRates do
  subject(:bill_rate) { Tenk.new.projects.bill_rates }

  it { should respond_to :list }
  it { should respond_to :get }
  it { should respond_to :update }
  it { should respond_to :create }

  describe '#list' do
    subject do
      VCR.use_cassette 'list_bill_rates', record: :new_episodes do
        bill_rate.list(183760)
      end
    end

    it { should respond_to :data }

    describe '#data' do
      it { should respond_to :length }
    end
  end

  describe '#get' do
    subject do
      VCR.use_cassette 'get_bill_rates', record: :new_episodes do
        bill_rate.get(183760, 319903)
      end
    end

    it { should respond_to :rate }
  end

  describe '#update' do
    # FIXME: Update and create behave inconsistently if you are using phases
    #   Update wants assignable_id to be the project_id
    #   Create wants assignable_id to be the phase_id
    subject do
      VCR.use_cassette 'update_bill_rates', record: :new_episodes do
        bill_rate.update(183760, 319903, rate: 123, assignable_id: 183760)
      end
    end

    it { should respond_to :rate }
  end

  describe '#create' do
    subject :bill_rate_response do
      VCR.use_cassette 'create_bill_rates', record: :new_episodes do
        bill_rate.create(
          183760,
          rate: 123,
          user_id: 30256,
          assignable_id: 183765,
        )
      end
    end

    it { should respond_to :rate }
  end
end
