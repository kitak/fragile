# coding: utf-8
# Name::      Fragile
# Author::    tnakamura <http://d.hatena.ne.jp/griefworker>
# Created::   Jun 15, 2012
# Updated::   Jun 15, 2012
# Copyright:: tnakamura Copyright (c) 2012
# License::   Licensed under the MIT LICENSE.
require "fragile/pipeline"

module Fragile
  module PipelineManager
    def pipelines
      @pipelines ||= {}
    end

    def define_pipeline(name, &block)
      p = Pipeline.new(name.to_s)
      p.instance_eval(&block)
      self.pipelines[name.to_s] = p
    end

    def pipeline_exist?(name)
      self.pipelines.has_key?(name.to_s)
    end

    def run_pipeline(*names)
      names.flatten.each do |name|
        unless pipeline_exist?(name)
          raise Fragile::PipelineError.new("Pipeline #{name} not found.")
        end
        self.pipelines[name.to_s].run
      end
    end
  end
end

