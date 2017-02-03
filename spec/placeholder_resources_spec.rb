require 'spec_helper'

describe Tenk::PlaceholderResources do
  subject(:placeholder_resource) { Tenk::PlaceholderResources.new(Tenk.new) }

  # FIXME: Placeholders are not testable on staging because I guess staging
  #   accounts don't have Placeholders enabled

  # it { should respond_to :list }
  # it { should respond_to :get }
  # it { should respond_to :update }
  # it { should respond_to :create }

  # describe '#list' do
  #   subject do
  #     VCR.use_cassette 'list_placeholder_resources', record: :new_episodes do
  #       placeholder_resource.list
  #     end
  #   end
  #
  #   it { should respond_to :data }
  #
  #   describe '#data' do
  #     it { should respond_to :length }
  #   end
  # end
  #
  # describe '#get' do
  #   subject do
  #     VCR.use_cassette 'get_placeholder_resources', record: :new_episodes do
  #       placeholder_resource.get(30256)
  #     end
  #   end
  #
  #   it { should respond_to :display_name }
  # end
  #
  # describe '#update' do
  #   subject do
  #     VCR.use_cassette 'update_placeholder_resources', record: :new_episodes do
  #       placeholder_resource.update(30256, first_name: 'Test')
  #     end
  #   end
  #
  #   it { should respond_to :display_name }
  # end
  #
  # describe '#create' do
  #   subject do
  #     VCR.use_cassette 'create_placeholder_resources', record: :new_episodes do
  #       placeholder_resource.create(first_name: 'Test', last_name: 'Testerson')
  #     end
  #   end
  #
  #   it { should respond_to :display_name }
  # end
  #
  # describe '#time_entries' do
  #   it { expect(subject.time_entries).to be_a Tenk::PlaceholderResources::TimeEntries }
  # end
  #
  # describe '#assignments' do
  #   it { expect(subject.assignments).to be_a Tenk::PlaceholderResources::Assignments }
  # end
end
