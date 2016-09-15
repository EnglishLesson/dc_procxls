require_relative '../controller/answer'
require_relative '../controller/punctuation'
require_relative '../controller/question'
require_relative '../controller/questionnaire'
require_relative '../controller/rule'
require_relative '../controller/rulesn'
require_relative '../controller/rulesv'
require_relative '../controller/translation/translation'
require_relative '../controller/verb'
require_relative '../controller/gender'
require_relative '../controller/arthicle'
require_relative '../controller/word'
require_relative '../controller/ruleswd'
require_relative '../controller/rulesvb'
require_relative '../controller/noun'
require_relative '../controller/rulesnn'
require_relative '../controller/preposition'
require_relative '../controller/tkeyword'
require_relative '../controller/keyword'
require_relative '../controller/number'
require_relative '../controller/adjective'

module MdSheet
  class SheetDefault
    IDX_CODE  = 0
    IDX_VALUE = 1
  end

  class TranslDefault
    IDX_CODE = 0
    IDX_TRANSLATION = 1
  end

  class PunctuactionSheet < SheetDefault
    NAME = 'Punctuaction'
    INSTANCE = PunctuactionCtrl.new
  end

  class GenderSheet < SheetDefault
    IDX_ALS = 2
    NAME = 'Gender'
    INSTANCE = GenderCtrl.new
  end

  class WordSheet < SheetDefault
    NAME = 'Word'
    INSTANCE = WordCtrl.new
  end

  class RuleSheet < SheetDefault
    IDX_NAME = 2
    IDX_RLL  = 3
    NAME = 'Rule'
    INSTANCE = RuleCtrl.new
  end

  class RulesWDSheet < SheetDefault
    IDX_CODE_RULE = 2
    IDX_CODE_WORD = 3
    NAME = 'RulesWD'
  end

  class NounSheet < SheetDefault
    NAME = 'Noun'
    INSTANCE = NounCtrl.new
  end

  class RulesNNSheet < SheetDefault
    IDX_CODE_RULE = 2
    IDX_CODE_NOUN = 3
    NAME          = 'RulesNoun'
    INSTANCE      = RulesNNCtrl.new
  end

  class PrepositionSheet < SheetDefault
    NAME = 'Preposition'
    INSTANCE = PrepositionCtrl.new
  end

  class TKeywordSheet < SheetDefault
    IDX_NAME = 2
    NAME = 'TKeyword'
    INSTANCE = TKeywordCtrl.new
  end

  class KeywordSheet < SheetDefault
    IDX_CODE_TKEYWORD = 2
    NAME = 'Keyword'
    INSTANCE = KeywordCtrl.new
  end

  class RulesKWSheet < SheetDefault
    IDX_CODE_RULE = 2
    IDX_CODE_KEYWORD = 3
    NAME = 'RulesKW'
    INSTANCE = RulesKWCtrl.new
  end

  class NumberSheet < SheetDefault
    NAME = 'Number'
    INSTANCE = NumberCtrl.new
  end

  class AdjectiveSheet < SheetDefault
    NAME = 'Adjective'
    INSTANCE = AdjectiveCtrl.new
  end

  class PronounSheet < SheetDefault
    NAME = 'Pronoun'
    INSTANCE = PronounCtrl.new
  end

  class AnswerSheet < SheetDefault
    NAME = 'Answer'
    INSTANCE = AnswerCtrl.new
  end

  class QuestionSheet < SheetDefault
    NAME = 'Question'
    INSTANCE = QuestionCtrl.new
  end

  class QuestionnaireSheet < SheetDefault
    IDX_CODE_QUESTION = 1
    IDX_CODE_ANSWER   = 2
    IDX_RANSWER  = 3
    NAME         = 'Questionnaire'
    INSTANCE = QuestionnaireCtrl.new
  end

  class TranslWDSheet < TranslDefault
    IDX_CODE_WORD = 2
    NAME = 'TranslWD'
    INSTANCE = TranslWDCtrl.new
  end

  class TranslVBSheet < TranslDefault
    IDX_CODE_VERB = 2
    NAME = 'TranslVB'
    INSTANCE = TranslVBCtrl.new
  end

  class TranslKWSheet < TranslDefault
    IDX_CODE_KEYWORD = 2
    NAME = 'TranslKW'
    INSTANCE = TranslKWCtrl.new
  end

  class TranslNNSheet < TranslDefault
    IDX_CODE_NOUN = 2
    NAME = 'TranslNN'
    INSTANCE = TranslNNCtrl.new
  end

  class TranslPPSheet < TranslDefault
    IDX_CODE_PREPOSITION = 2
    NAME = 'TranslPP'
    INSTANCE = TranslPPCtrl.new
  end

  class TranslNBSheet < TranslDefault
    IDX_CODE_NUMBER = 2
    NAME = 'TranslNB'
    INSTANCE = TranslNBCtrl.new
  end

  class TranslADJSheet < TranslDefault
    IDX_CODE_ADJECTIVE = 2
    NAME = 'TranslADJ'
    INSTANCE = TranslADJCtrl.new
  end

  class TranslPronSheet < TranslDefault
    IDX_CODE_PRONOUN = 2
    NAME = 'TranslPron'
    INSTANCE = TranslPronCtrl.new
  end






  class TranslationSheet < SheetDefault
      IDX_GENDER = 2
      NAME       = 'Translation'
      INSTANCE = TranslationCtrl.new
  end

  class VerbSheet < SheetDefault
    NAME            = 'Verb'
    INSTANCE = VerbCtrl.new
  end

  class RulesVBSheet < SheetDefault
    IDX_RULE  = 1
    IDX_VERB  = 2
    NAME      = 'RulesVB'
    INSTANCE =  RulesVBCtrl.new
  end

  class RulesNSheet
    IDX_CODE  = 0
    IDX_RULE  = 1
    IDX_NOON  = 2
    NAME      = 'RulesN'
    INSTANCE =RulesNCtrl.new
  end
end
