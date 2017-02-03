require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe Tenk::Projects::Phases do
  subject(:phase) { Tenk.new.projects.phases }

  it { should respond_to :list }
  it { should respond_to :get }
  it { should respond_to :update }
  it { should respond_to :create }

  describe '#list' do
    subject do
      VCR.use_cassette 'list_phases', record: :new_episodes do
        phase.list(183760)
      end
    end

    it { should respond_to :data }

    describe '#data' do
      it { should respond_to :length }
    end
  end

  describe '#get' do
    subject do
      VCR.use_cassette 'get_phases', record: :new_episodes do
        phase.get(183760, 183761)
      end
    end

    it { should respond_to :phase_name }
  end

  describe '#update' do
    subject do
      VCR.use_cassette 'update_phases', record: :new_episodes do
        phase.update(183760, 183761, phase_name: 'Test')
      end
    end

    it { should respond_to :phase_name }
  end

  describe '#create' do
    subject :phase_response do
      VCR.use_cassette 'create_phases', record: :new_episodes do
        phase.create(183760, phase_name: 'Test')
      end
    end

    it { should respond_to :phase_name }
  end
end
