class AnswerParser

  attr_reader :incoming

  def initialize(params)
    @incoming = params["request"]["intent"]["slots"]["answer"]["value"]
  end

  def parsed
    return if incoming.blank?

    acronymed.downcase
  end

  private

  def acronymed
    {
      "they are"     => "yes",
      "yup"          => "yes",
      "they are not" => "no",
      "nope"         => "no"
    }[incoming] || incoming
  end
end
