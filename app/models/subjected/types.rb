module Subjected::Types
  class TypeList < Array
    def names
      collect(&:name)
    end

    def creatable
      # TODO figure out why this sometimes nomethods
      TypeList[*select { |t| t.creatable? rescue false }]
    end

    def viewable
      TypeList[*select { |t| t.viewable_in_principle? }]
    end

    def as_json(*)
      map { |s| s.new.as_api_response(:public) }
    end
  end
  private_constant :TypeList
  
  LIST = TypeList[
    Game, 
    Resource, 
    Tutorial, 
    Announcement, 
    Memo
  ]
end