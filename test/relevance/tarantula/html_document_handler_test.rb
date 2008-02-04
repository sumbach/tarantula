require File.join(File.dirname(__FILE__), "..", "..", "test_helper.rb")

describe "Relevance::Tarantula::HtmlDocumentHandler" do
  before do
    @handler = Relevance::Tarantula::HtmlDocumentHandler.new(nil)
  end
  
  it "queues anchor tags" do
    @handler.expects(:queue_link).with("/foo")
    @handler.handle nil, nil, stub(:body => '<a href="/foo">foo</a>')
  end

  it "queues link tags" do
    @handler.expects(:queue_link).with("/bar")
    @handler.handle nil, nil, stub(:body => '<link href="/bar">bar</a>')
  end
  
  it "queues forms" do
    @handler.expects(:queue_form).with{|tag| HTML::Tag === tag}
    @handler.handle nil, nil, stub(:body => '<form>stuff</form>')
  end
  
end

