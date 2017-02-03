require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe Tenk::TimeEntries do
  subject(:time_entry) { Tenk::TimeEntries.new(Tenk.new) }

  it { should respond_to :list }
  it { should respond_to :get }
  it { should respond_to :update }
  it { should respond_to :create }

  describe '#list' do
    subject do
      VCR.use_cassette 'list_time_entries', record: :new_episodes do
        time_entry.list
      end
    end

    it { should respond_to :data }

    describe '#data' do
      it { should respond_to :length }
    end
  end

  describe '#get' do
    subject do
      VCR.use_cassette 'get_time_entries', record: :new_episodes do
        time_entry.get(13035670)
      end
    end

    it { should respond_to :hours }
  end

  describe '#update' do
    subject do
      VCR.use_cassette 'update_time_entries', record: :new_episodes do
        time_entry.update(13035670, hours: 1.0)
      end
    end

    it { should respond_to :hours }
  end

  describe '#create' do
    subject do
      VCR.use_cassette 'create_time_entries', record: :new_episodes do
        time_entry.create(
          user_id: 30256,
          assignable_id: 183765,
          date: '2017-01-31',
          hours: 0.75,
          task: 'Test',
          notes: 'Test test',
        )
      end
    end

    it { should respond_to :hours }
  end
end
