# frozen_string_literal: true

module ActiveRecord
  # Returns the currently loaded version of Active Record as a <tt>Gem::Version</tt>.
  def self.gem_version
    Gem::Version.new VERSION::STRING
  end

  module VERSION
    MAJOR = 7
    MINOR = 0
    TINY = 4
    PRE = "3"

    STRING = [MAJOR, MINOR, TINY, PRE].compact.join(".")
  end
end
