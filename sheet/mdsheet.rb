module MdSheet
  class SheetDefault
    IDX_CODE  = 0
    IDX_VALUE = 1
  end

  class AnswerSheet < SheetDefault

  end

  class KeywordSheet < SheetDefault

  end

  class NoonSheet < SheetDefault

  end

  class PunctuactionSheet < SheetDefault

  end

  class QuestionSheet < SheetDefault

  end

  class GenderSheet < SheetDefault

  end

  class RuleSheet < SheetDefault

  end

  class ArthicleSheet < SheetDefault

  end

  class TranslationSheet < SheetDefault
      IDX_GENDER = 2
  end

  class VerbSheet < SheetDefault
    IDX_TRANSLATION = 2
  end

  class RulesVSheet
    IDX_CODE  = 0
    IDX_RULE  = 1
    IDX_VERB  = 2
    IDX_RLL   = 3
  end

  class RulesNSheet
    IDX_CODE  = 0
    IDX_RULE  = 1
    IDX_NOON  = 2
  end

  class QuestionnaireSheet
    IDX_CODE     = 0
    IDX_QUESTION = 1
    IDX_ANSWER   = 2
  end
end
