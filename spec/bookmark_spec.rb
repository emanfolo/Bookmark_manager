# frozen_string_literal: true

require './lib/bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      expect(subject.all).to include 'http://www.makersacademy.com/'
      expect(subject.all).to include 'http://www.twitter.com/'
      expect(subject.all).to include 'http://www.google.com/'
    end
  end
end
