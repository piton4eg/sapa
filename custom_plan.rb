require 'zeus/rails'

class CustomPlan < Zeus::Rails

  def cucumber_environment
    require 'cucumber/rspec/disable_option_parser'
    require 'cucumber/cli/main'
    @cucumber_runtime = Cucumber::Runtime.new
  end

  def cucumber(argv=ARGV)
    require 'factory_girl'
    FactoryGirl.reload
    cucumber_main = Cucumber::Cli::Main.new(argv.dup)
    had_failures = cucumber_main.execute!(@cucumber_runtime)
    exit_code = had_failures ? 1 : 0
    exit exit_code
  end

  def test
    require 'factory_girl'
    FactoryGirl.reload
    super
  end
end

Zeus.plan = CustomPlan.new
