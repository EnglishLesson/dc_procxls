require_relative 'rulesdefault'

class RulesVBModel < RulesDefault
  def getCodeVerb
    @codeVerb
  end

  def setCodeVerb(codeVerb)
    @codeVerb = codeVerb
  end
end
