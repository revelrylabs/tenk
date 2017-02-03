require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe Tenk::Users do
  subject(:user) { Tenk::Users.new(Tenk.new) }

  it { should respond_to :list }
  it { should respond_to :get }
  it { should respond_to :update }
  it { should respond_to :create }

  describe '#list' do
    subject do
      VCR.use_cassette 'list_users', record: :new_episodes do
        user.list
      end
    end

    it { should respond_to :data }

    describe '#data' do
      it { should respond_to :length }
    end
  end

  describe '#get' do
    subject do
      VCR.use_cassette 'get_users', record: :new_episodes do
        user.get(30256)
      end
    end

    it { should respond_to :display_name }
  end

  describe '#update' do
    subject do
      VCR.use_cassette 'update_users', record: :new_episodes do
        user.update(30256, first_name: 'Test')
      end
    end

    it { should respond_to :display_name }
  end

  describe '#create' do
    subject do
      VCR.use_cassette 'create_users', record: :new_episodes do
        user.create(first_name: 'Test', last_name: 'Testerson')
      end
    end

    it { should respond_to :display_name }
  end

  describe '#time_entries' do
    it { expect(subject.time_entries).to be_a Tenk::Users::TimeEntries }
  end

  describe '#assignments' do
    it { expect(subject.assignments).to be_a Tenk::Users::Assignments }
  end
end
