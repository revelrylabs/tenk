require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe Tenk::Projects do
  subject(:project) { Tenk::Projects.new(Tenk.new) }

  it { should respond_to :list }
  it { should respond_to :get }
  it { should respond_to :update }
  it { should respond_to :create }

  describe '#list' do
    subject do
      VCR.use_cassette 'list_projects', record: :new_episodes do
        project.list
      end
    end

    it { should respond_to :data }

    describe '#data' do
      it { should respond_to :length }
    end
  end

  describe '#get' do
    subject do
      VCR.use_cassette 'get_projects', record: :new_episodes do
        project.get(183760)
      end
    end

    it { should respond_to :name }
  end

  describe '#update' do
    subject do
      VCR.use_cassette 'update_projects', record: :new_episodes do
        project.update(183760, name: 'Test')
      end
    end

    it { should respond_to :name }
  end

  describe '#create' do
    subject do
      VCR.use_cassette 'create_projects', record: :new_episodes do
        project.create(name: 'Test2')
      end
    end

    it { should respond_to :name }
  end

  describe '#time_entries' do
    it { expect(subject.time_entries).to be_a Tenk::Projects::TimeEntries }
  end

  describe '#assignments' do
    it { expect(subject.assignments).to be_a Tenk::Projects::Assignments }
  end

  describe '#users' do
    it { expect(subject.users).to be_a Tenk::Projects::Users }
  end

  describe '#tags' do
    it { expect(subject.tags).to be_a Tenk::Projects::Tags }
  end

  describe '#bill_rates' do
    it { expect(subject.bill_rates).to be_a Tenk::Projects::BillRates }
  end

  describe '#phases' do
    it { expect(subject.phases).to be_a Tenk::Projects::Phases }
  end
end
