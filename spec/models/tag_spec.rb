# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:without_sputnik_id_tag) { build :tag, :without_sputnik_id }
  let(:without_name_tag) { build :tag, :without_name }
  let(:tag) { build :tag }

  it 'is invalid tag without name' do
    expect(without_sputnik_id_tag).not_to be_valid
  end

  it 'is invalid tag without sputnik_id' do
    expect(without_name_tag).not_to be_valid
  end

  it 'is valid with sputnik_id, description and name' do
    expect(tag).to be_valid
  end
end
