defmodule MongodbTest do
  def hello do
    :world
  end

  def insertElem do
    {:ok, doc} = Mongo.insert_one(:mongo, "collection", %{:key => "value"}, [return_document: :after, upsert: :true])
    IO.puts doc
  end
end
