require_relative '../controller/codest'
require_relative '../controller/rule/rule'
require_relative '../controller/gender'
require_relative '../controller/translation/translation'
require_relative '../controller/exception'
require_relative '../controller/word'
require_relative '../controller/rule/ruleswd'
require_relative '../controller/verb'
require_relative '../controller/rule/rulesvb'
require_relative '../controller/noun'
require_relative '../controller/rule/rulesnn'
require_relative '../controller/preposition'
require_relative '../controller/tkeyword'
require_relative '../controller/keyword'
require_relative '../controller/rule/ruleskw'
require_relative '../controller/number'
require_relative '../controller/adjective'
require_relative '../controller/pronoun'
require_relative '../controller/answer'
require_relative '../controller/question'
require_relative '../controller/questionnaire'
require_relative '../controller/translation/translwd'
require_relative '../controller/translation/translvb'
require_relative '../controller/translation/translkw'
require_relative '../controller/translation/translnn'
require_relative '../controller/translation/translpp'
require_relative '../controller/translation/translnb'
require_relative '../controller/translation/transladj'
require_relative '../controller/translation/translpron'

module MdSheet
  class SheetDefault
    IDX_CODE  = 0
    IDX_VALUE = 1
  end

  class TranslDefault
    IDX_CODE = 0
    IDX_CODE_TRANSLATION = 1
  end

  class RulesDefault
    IDX_CODE = 0
    IDX_CODE_RULE = 1
    IDX_CODE_EXCEPTION = 2
  end

  class CodesTSheet
    IDX_TNAME = 0
    IDX_CODE = 1
    NAME = 'codest'
    INSTANCE = CodesTCtrl.new
  end

  class RuleSheet < SheetDefault
    IDX_NAME = 2
    NAME = 'rule'
    INSTANCE = RuleCtrl.new
  end

  class GenderSheet < SheetDefault
    NAME = 'gender'
    INSTANCE = GenderCtrl.new
  end

  class TranslationSheet < SheetDefault
    IDX_CODE_GENDER = 2
    NAME       = 'translation'
    INSTANCE = TranslationCtrl.new
  end

  class ExceptionSheet < SheetDefault
    IDX_NAME = 2
    NAME = 'exception'
    INSTANCE = ExceptionCtrl.new
  end

  class WordSheet < SheetDefault
    NAME = 'word'
    INSTANCE = WordCtrl.new
  end

  class RulesWDSheet < RulesDefault
    IDX_CODE_WORD = 3
    NAME = 'ruleswd'
    INSTANCE = RulesWDCtrl.new
  end

  class VerbSheet < SheetDefault
    NAME            = 'verb'
    INSTANCE = VerbCtrl.new
  end

  class RulesVBSheet < RulesDefault
    IDX_CODE_VERB  = 3
    NAME      = 'rulesvb'
    INSTANCE =  RulesVBCtrl.new
  end

  class NounSheet < SheetDefault
    NAME = 'noun'
    INSTANCE = NounCtrl.new
  end

  class RulesNNSheet < RulesDefault
    IDX_CODE_NOUN = 3
    NAME          = 'rulesnn'
    INSTANCE      = RulesNNCtrl.new
  end

  class PrepositionSheet < SheetDefault
    NAME = 'preposition'
    INSTANCE = PrepositionCtrl.new
  end

  class TKeywordSheet
    IDX_CODE = 0
    IDX_NAME = 1
    NAME = 'tkeyword'
    INSTANCE = TKeywordCtrl.new
  end

  class KeywordSheet < SheetDefault
    IDX_CODE_TKEYWORD = 2
    NAME = 'keyword'
    INSTANCE = KeywordCtrl.new
  end

  class RulesKWSheet < RulesDefault
    IDX_CODE_KEYWORD = 3
    NAME = 'ruleskw'
    INSTANCE = RulesKWCtrl.new
  end

  class NumberSheet < SheetDefault
    NAME = 'number'
    INSTANCE = NumberCtrl.new
  end

  class AdjectiveSheet < SheetDefault
    NAME = 'adjective'
    INSTANCE = AdjectiveCtrl.new
  end

  class PronounSheet < SheetDefault
    NAME = 'pronoun'
    INSTANCE = PronounCtrl.new
  end

  class AnswerSheet < SheetDefault
    NAME = 'answer'
    INSTANCE = AnswerCtrl.new
  end

  class QuestionSheet < SheetDefault
    NAME = 'question'
    INSTANCE = QuestionCtrl.new
  end

  class QuestionnaireSheet < SheetDefault
    IDX_CODE_QUESTION = 1
    IDX_CODE_ANSWER   = 2
    IDX_RANSWER  = 3
    NAME = 'questionnaire'
    INSTANCE = QuestionnaireCtrl.new
  end

  class TranslWDSheet < TranslDefault
    IDX_CODE_WORD = 2
    NAME = 'translwd'
    INSTANCE = TranslWDCtrl.new
  end

  class TranslVBSheet < TranslDefault
    IDX_CODE_VERB = 2
    NAME = 'translvb'
    INSTANCE = TranslVBCtrl.new
  end

  class TranslKWSheet < TranslDefault
    IDX_CODE_KEYWORD = 2
    NAME = 'translkw'
    INSTANCE = TranslKWCtrl.new
  end

  class TranslNNSheet < TranslDefault
    IDX_CODE_NOUN = 2
    NAME = 'translnn'
    INSTANCE = TranslNNCtrl.new
  end

  class TranslPPSheet < TranslDefault
    IDX_CODE_PREPOSITION = 2
    NAME = 'translpp'
    INSTANCE = TranslPPCtrl.new
  end

  class TranslNBSheet < TranslDefault
    IDX_CODE_NUMBER = 2
    NAME = 'translnb'
    INSTANCE = TranslNBCtrl.new
  end

  class TranslADJSheet < TranslDefault
    IDX_CODE_ADJECTIVE = 2
    NAME = 'transladj'
    INSTANCE = TranslADJCtrl.new
  end

  class TranslPronSheet < TranslDefault
    IDX_CODE_PRONOUN = 2
    NAME = 'translpron'
    INSTANCE = TranslPronCtrl.new
  end
end
