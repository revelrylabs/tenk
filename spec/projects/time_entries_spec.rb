require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe Tenk::Projects::TimeEntries do
  subject(:time_entry) { Tenk.new.projects.time_entries }

  it { should respond_to :list }
  it { should respond_to :get }
  it { should respond_to :update }
  it { should respond_to :create }

  describe '#list' do
    subject do
      VCR.use_cassette 'project_list_time_entries', record: :new_episodes do
        time_entry.list(183760)
      end
    end

    it { should respond_to :data }

    describe '#data' do
      it { should respond_to :length }
    end
  end

  describe '#get' do
    subject do
      VCR.use_cassette 'project_get_time_entries', record: :new_episodes do
        time_entry.get(183760, 13035670)
      end
    end

    it { should respond_to :hours }
  end

  describe '#update' do
    subject do
      VCR.use_cassette 'project_update_time_entries', record: :new_episodes do
        time_entry.update(183760, 13035670, hours: 0.5)
      end
    end

    it { should respond_to :hours }
  end

  describe '#create' do
    subject :time_entry_response do
      VCR.use_cassette 'project_create_time_entries', record: :new_episodes do
        time_entry.create(
          183765,
          hours: 0.5,
          date: '2017-01-01',
          user_id: 30256,
          assignable_id: 183765,
        )
      end
    end

    it { should respond_to :hours }
  end
end
