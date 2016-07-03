require 'yaml'

class Configuration

  attr_accessor :name, :dir_path, :values

  DEFAULT_FILE_PATH = File.expand_path('../../../configuration.yaml', File.dirname(__FILE__))

  # Get data from yaml file.
  def initialize(file_path = DEFAULT_FILE_PATH)
    @dir_path = File.dirname(File.expand_path(file_path))
    File.open(file_path, 'r') do |file|
      # noinspection RubyResolve
      content = YAML.load(file) || {}
      # Name of section to select.
      @name = 'app'
      @values = content[@name] || content
    end
    self
  end

  # Get values from the yaml data.
  # The path is slash-separated node-names in the yaml; if omitted gets all.
  # Example path:  'account/name'.
  # If values is given, it must be something that was returned elsewhere by this very method.
  # In other words, it must be a sub-element of some previous @values.
  # Thus, you can do this:
  #   account_name = config.get('account/name')
  def get(path = '', values = @values)
    # Path comes in as 'foo/bar/baz'
    # whose tokens refer to nested sections in the yaml.
    node_names = path.split('/')
    node = values
    until node_names.empty?
      node = case
               when node.respond_to?(:each_pair)
                 node_name = node_names.shift
                 unless node.include?(node_name)
                   message = 'Cannot find node %s for path %s' % [node_name, path]
                   raise ArgumentError.new(message)
                 end
                 node[node_name]
               else
                 raise NotImplementedError.new(node.class)
             end
    end
    node
  end

end