# rubocop:disable Metrics/BlockLength
describe Tenk::Users::TimeEntries do
  subject(:time_entry) { Tenk.new.users.time_entries }

  it { should respond_to :list }
  it { should respond_to :get }
  it { should respond_to :update }
  it { should respond_to :create }

  describe '#list' do
    subject do
      VCR.use_cassette 'user_list_time_entries', record: :new_episodes do
        time_entry.list(30256)
      end
    end

    it { should respond_to :data }

    describe '#data' do
      it { should respond_to :length }
    end
  end

  describe '#get' do
    subject do
      VCR.use_cassette 'user_get_time_entries', record: :new_episodes do
        time_entry.get(30256, 13035670)
      end
    end

    it { should respond_to :hours }
  end

  describe '#update' do
    subject do
      VCR.use_cassette 'user_update_time_entries', record: :new_episodes do
        time_entry.update(30256, 13035670, hours: 0.5)
      end
    end

    it { should respond_to :hours }
  end

  describe '#create' do
    subject :time_entry_response do
      VCR.use_cassette 'user_create_time_entries', record: :new_episodes do
        time_entry.create(30256, date: '2017-01-01', hours: 0.5, project_id: 183760)
      end
    end

    it { should respond_to :hours }

    describe '#delete' do
      it do
        response = VCR.use_cassette 'user_delete_time_entry', record: :new_episodes do
          time_entry.delete(30256, time_entry_response.id)
        end
        expect(response).to eq true
      end
    end
  end
end
