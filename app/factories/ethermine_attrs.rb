module EthermineAttrs
  def method_missing(name, *args, &blocks)
    if @attrs.include? name
      return @args.try(name)
    end
    super
  end
end
