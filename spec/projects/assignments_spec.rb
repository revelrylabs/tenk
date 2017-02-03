require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe Tenk::Projects::Assignments do
  subject(:assignment) { Tenk.new.projects.assignments }

  it { should respond_to :list }
  it { should respond_to :get }
  it { should respond_to :update }
  it { should respond_to :create }

  describe '#list' do
    subject do
      VCR.use_cassette 'list_assignments', record: :new_episodes do
        assignment.list(183760)
      end
    end

    it { should respond_to :data }

    describe '#data' do
      it { should respond_to :length }
    end
  end

  describe '#get' do
    subject do
      VCR.use_cassette 'get_assignments', record: :new_episodes do
        assignment.get(183760, 186877)
      end
    end

    it { should respond_to :allocation_mode }
  end

  describe '#update' do
    subject do
      VCR.use_cassette 'update_assignments', record: :new_episodes do
        assignment.update(183760, 186877, percent: 0.5)
      end
    end

    it { should respond_to :allocation_mode }
  end

  describe '#create' do
    subject :assignment_response do
      VCR.use_cassette 'create_assignments', record: :new_episodes do
        assignment.create(
          183760,
          starts_at: '2017-01-01',
          ends_at: '2017-01-31',
          user_id: 30256,
        )
      end
    end

    it { should respond_to :allocation_mode }

    describe '#delete' do
      it do
        response = VCR.use_cassette 'delete_assignment', record: :new_episodes do
          assignment.delete(183760, assignment_response.id)
        end
        expect(response).to eq true
      end
    end
  end
end
