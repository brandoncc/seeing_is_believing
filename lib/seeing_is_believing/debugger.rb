class SeeingIsBelieving
  class Debugger

    CONTEXT_COLOUR = "\e[37;44m" # background blue
    RESET_COLOUR   = "\e[0m"

    # TODO: CI debugger
    #   add a ci debugger, which writes each debugger info to a log file
    #   if it fails, read that log file?

    def initialize(options={})
      @coloured = options[:colour]
      @stream   = options[:stream]
    end

    def coloured?
      @coloured
    end

    attr_reader :stream
    alias enabled? stream

    def context(name, &block)
      if enabled?
        stream << CONTEXT_COLOUR          if coloured?
        stream << "#{name}:"
        stream << RESET_COLOUR            if coloured?
        stream << "\n"
        stream << block.call.to_s << "\n" if block
      end
      self
    end

    def ==(other)
      return false unless other.respond_to? :coloured?
      return false unless other.respond_to? :stream
      coloured? == other.coloured? && stream == other.stream
    end

  end
end
