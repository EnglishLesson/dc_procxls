require_relative '../controller/answer'
require_relative '../controller/keyword'
require_relative '../controller/noon'
require_relative '../controller/punctuation'
require_relative '../controller/question'
require_relative '../controller/questionnaire'
require_relative '../controller/rule'
require_relative '../controller/rulesn'
require_relative '../controller/rulesv'
require_relative '../controller/translation'
require_relative '../controller/verb'
require_relative '../controller/gender'
require_relative '../controller/arthicle'

module MdSheet
  class SheetDefault
    IDX_CODE  = 0
    IDX_VALUE = 1
  end

  class AnswerSheet < SheetDefault
    NAME = 'Answer'
    INSTANCE = AnswerCtrl.new
  end

  class KeywordSheet < SheetDefault
    NAME = 'Keyword'
    INSTANCE = KeywordCtrl.new
  end

  class NoonSheet < SheetDefault
    NAME = 'NoonSheet'
    INSTANCE = NoonCtrl.new
  end

  class PunctuactionSheet < SheetDefault
    NAME = 'Punctuaction'
    INSTANCE = PunctuactionCtrl.new
  end

  class QuestionSheet < SheetDefault
    NAME = 'Question'
    INSTANCE = QuestionCtrl.new
  end

  class GenderSheet < SheetDefault
    IDX_ALS = 2
    NAME = 'Gender'
    INSTANCE = GenderCtrl.new
  end

  class RuleSheet < SheetDefault
    IDX_NAME = 2
    NAME = 'Rule'
    INSTANCE = RuleCtrl.new
  end

  class ArthicleSheet < SheetDefault
    NAME = 'Arthicle'
    INSTANCE = ArthicleCtrl.new
  end

  class TranslationSheet < SheetDefault
      IDX_GENDER = 2
      NAME       = 'Translation'
      INSTANCE = TranslationCtrl.new
  end

  class VerbSheet < SheetDefault
    IDX_TRANSLATION = 2
    NAME            = 'Verb'
    INSTANCE = VerbCtrl.new
  end

  class RulesVSheet < SheetDefault
    IDX_RULE  = 1
    IDX_VERB  = 2
    IDX_RLL   = 3
    NAME      = 'RulesV'
    INSTANCE =  RulesVCtrl.new
  end

  class RulesNSheet
    IDX_CODE  = 0
    IDX_RULE  = 1
    IDX_NOON  = 2
    NAME      = 'RulesN'
    INSTANCE =RulesNCtrl.new
  end

  class QuestionnaireSheet
    IDX_CODE     = 0
    IDX_QUESTION = 1
    IDX_ANSWER   = 2
    NAME         = 'Questionnaire'
    INSTANCE = QuestionnaireCtrl.new
  end
end
