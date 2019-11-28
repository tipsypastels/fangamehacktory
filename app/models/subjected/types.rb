module Subjected::Types
  class TypeList < Array
    def names
      collect(&:name)
    end

    def creatable
      # TODO figure out why this sometimes nomethods
      TypeList[*select { |t| t.creatable? rescue false }]
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