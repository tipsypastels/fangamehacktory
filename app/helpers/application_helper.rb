module ApplicationHelper
  def context_bar(**cbar, &cbar_block)
    @cbar = cbar
    @cbar_block = cbar_block
  end
end
