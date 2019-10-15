module MessagesHelper

  # Возвращает true, если у сообщения есть комментарий, иначе false.
  def comment?(message)
    message.comment != ""
  end

  # Возвращает название смайла комментария
  def comment_smile(message)
    # char = message.comment[-1]
    case message.comment[-1]
    when 'A'
      'angry_final4.png'
    when 'N'
      'normal_final4.png'
    else
      'smile_final4.png'
    end
  end

  # Возвращает текст комментария
  def comment_text(message)
    message.comment[0..-2]
  end

end
