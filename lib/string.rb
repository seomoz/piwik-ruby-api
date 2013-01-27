class String
  def is_binary_data?
    self.count( "^ -~", "^\r\n" ).fdiv(self.size) > 0.3 || self.index( "\x00" )
  end
  
  if RUBY_VERSION.to_f < 1.9
    def force_encoding(enc)
      self
    end
  end
end