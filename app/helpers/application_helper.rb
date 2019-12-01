module ApplicationHelper
  def context_bar(**cbar, &cbar_block)
    @cbar = cbar
    @cbar_block = cbar_block
  end

  def has_paper!
    @paper = true
  end
end
