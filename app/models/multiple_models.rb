class MultipleModels < Array
  def client
    Elasticsearch::Model.client
  end

  def ancestors
    []
  end
end
