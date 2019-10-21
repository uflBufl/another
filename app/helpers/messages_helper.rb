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
    when 'E'
      'evil_smile1.png'
    else
      'smile_final4.png'
    end
  end

  # Возвращает текст комментария
  def comment_text(message)
    message.comment[0..-2]
  end

  # Возвращает текст сообщения
  def message_text(message)
    image?(message) ? message.value[0..message.value.index('$')-1] : message.value
  end

  # Возвращает картинку
  def message_image(message)
    image?(message) ? message.value[message.value.index('$')+1..-1] +'.jpg' : 'default.jpg'
  end

  # Возвращает true, если сообщение содержит картинку
  def image?(message)
    message.value.include?('$')
  end

end
