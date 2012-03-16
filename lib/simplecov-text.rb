require "simplecov-text/version"

module SimpleCov
  module Formatter
    class TextFormatter
      
      def format(result)
        output = ""
        output << sprintf("%0.2f", result.covered_percent) << "\n"
        output << "%d of %d lines covered (%0.2f hits per line)" % [
          result.covered_lines,
          result.total_lines,
          result.covered_strength
        ]
        
        result.groups.each do |name, files|
          output << "Group: #{name}" << "\n"
          output << "="*40 << "\n"
          files.each do |file|
            output << "%s (coverage: %0.2f%%)\n" % [
              file.filename,
              file.covered_percent
            ]
          end
          output << "\n"
        end
        
        write_result(output)
      end
      
      def write_result(result)
        File.open(path, 'w') do |f|
          f.write(result)
        end
      end
      
      def path
        File.join(SimpleCov.coverage_path, 'result.txt')
      end
      
    end
  end
end
