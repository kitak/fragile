# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Fragile::DSL do
  describe "#pipeline" do
    include Fragile::DSL

    after do
      Fragile.application.pipelines.clear
    end

    it "パイプラインを登録できるべき" do
      pipeline "foo" do;end
      Fragile.application.pipelines.has_key?("foo").should be_true
    end
  end
end
