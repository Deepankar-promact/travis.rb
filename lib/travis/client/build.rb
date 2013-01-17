require 'travis/client'

module Travis
  module Client
    class Build < Entity
      include States

      # @!parse attr_reader :repository_id, :commit_id, :number, :pull_request, :config, :state, :started_at, :finished_at, :duration, :job_ids
      attributes :repository_id, :commit_id, :number, :pull_request, :config, :state, :started_at, :finished_at, :duration, :job_ids
      time :started_at, :finished_at

      alias pull_request? pull_request

      # @!parse attr_reader :repository, :commit, :jobs
      has :repository, :commit, :jobs

      one :build
      many :builds

      def push?
        not pull_request?
      end

      def inspect_info
        "#{repository.slug}##{number}"
      end
    end
  end
end
